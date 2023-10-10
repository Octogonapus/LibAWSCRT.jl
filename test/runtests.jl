using Test, LibAWSCRT, CountDownLatches
import ForeignCallbacks, Random

const refs = Vector{Ref}()
const received_on_connection_complete = CountDownLatch(1)
const received_on_disconnect = CountDownLatch(1)
const NUM_PACKETS = 20
const all_pubacks_received = CountDownLatch(NUM_PACKETS)
const all_packets_received = CountDownLatch(NUM_PACKETS)
const suback = CountDownLatch(1)
const PAYLOAD_STR = Random.randstring(48)
const TOPIC_STR = "test-topic"

struct OnConnectionCompleteMsg
    error_code::Cint
    return_code::Cint
    session_present::Cuchar
end

on_connection_complete_fcb = ForeignCallbacks.ForeignCallback{OnConnectionCompleteMsg}() do msg
    if msg.error_code != AWS_ERROR_SUCCESS || msg.return_code != AWS_MQTT_CONNECT_ACCEPTED || msg.session_present != 0
        error("on_connection_complete failed: $msg")
    end
    count_down(received_on_connection_complete)
    return nothing
end

function on_connection_complete(
    connection::Ptr{aws_mqtt_client_connection},
    error_code::Cint,
    return_code::Cint,
    session_present::Cuchar,
    userdata::Ptr{Cvoid},
)
    # This is a native function and may not interact with the Julia runtime
    # convert and then load the pointer because this function must be type-stable
    token = Base.unsafe_load(Base.unsafe_convert(Ptr{ForeignCallbacks.ForeignToken}, userdata))
    ForeignCallbacks.notify!(token, OnConnectionCompleteMsg(error_code, return_code, session_present))
    return nothing
end

on_puback_received_fcb = ForeignCallbacks.ForeignCallback{Nothing}() do msg
    count_down(all_pubacks_received)
    return nothing
end

function on_puback(
    connection::Ptr{aws_mqtt_client_connection},
    packet_id::Cuint,
    error_code::Cint,
    userdata::Ptr{Cvoid},
)
    # This is a native function and may not interact with the Julia runtime
    # convert and then load the pointer because this function must be type-stable
    token = Base.unsafe_load(Base.unsafe_convert(Ptr{ForeignCallbacks.ForeignToken}, userdata))
    ForeignCallbacks.notify!(token, nothing)
    return nothing
end

struct PacketReceivedMsg
    topic_copy::Ptr{Cuchar}
    topic_len::Csize_t
    payload_copy::Ptr{Cuchar}
    payload_len::Csize_t
end

on_packet_received_fcb = ForeignCallbacks.ForeignCallback{PacketReceivedMsg}() do msg
    count_down(all_packets_received)

    topic = String(Base.unsafe_wrap(Array, msg.topic_copy, msg.topic_len, own=true))
    if topic != TOPIC_STR
        @error "topic equality check failed" topic TOPIC_STR
        exit(1)
    end

    payload = String(Base.unsafe_wrap(Array, msg.payload_copy, msg.payload_len, own=true))
    if payload != PAYLOAD_STR
        @error "payload equality check failed" payload PAYLOAD_STR
        exit(1)
    end

    return nothing
end

function on_packet_received(
    connection::Ptr{aws_mqtt_client_connection},
    topic::Ptr{aws_byte_cursor},
    payload::Ptr{aws_byte_cursor},
    dup::Cuchar,
    qos::Cint,
    retain::Cuchar,
    userdata::Ptr{Cvoid},
)
    # This is a native function and may not interact with the Julia runtime
    # convert and then load the pointer because this function must be type-stable
    token = Base.unsafe_load(Base.unsafe_convert(Ptr{ForeignCallbacks.ForeignToken}, userdata))

    # Make a copy because we only have topic inside this function, not inside the ForeignCallback
    topic_obj = Base.unsafe_load(topic)
    topic_copy = ccall(:calloc, Ptr{Cvoid}, (Csize_t, Csize_t), topic_obj.len, 1)
    ccall(:memcpy, Ptr{Cvoid}, (Ptr{Cvoid}, Ptr{Cvoid}, Csize_t), topic_copy, topic_obj.ptr, topic_obj.len)

    # Make a copy because we only have payload inside this function, not inside the ForeignCallback
    payload_obj = Base.unsafe_load(payload)
    payload_copy = ccall(:calloc, Ptr{Cvoid}, (Csize_t, Csize_t), payload_obj.len, 1)
    ccall(:memcpy, Ptr{Cvoid}, (Ptr{Cvoid}, Ptr{Cvoid}, Csize_t), payload_copy, payload_obj.ptr, payload_obj.len)

    ForeignCallbacks.notify!(
        token,
        PacketReceivedMsg(
            Base.unsafe_convert(Ptr{Cuchar}, topic_copy),
            topic_obj.len,
            Base.unsafe_convert(Ptr{Cuchar}, payload_copy),
            payload_obj.len,
        ),
    )
    return nothing
end

on_suback_fcb = ForeignCallbacks.ForeignCallback{Nothing}() do msg
    count_down(suback)
    return nothing
end

function mqtt_on_suback(
    connection::Ptr{aws_mqtt_client_connection},
    packet_id::Cuint,
    topic::Ptr{aws_byte_cursor},
    qos::Cint,
    error_code::Cint,
    userdata::Ptr{Cvoid},
)
    # This is a native function and may not interact with the Julia runtime
    # convert and then load the pointer because this function must be type-stable
    token = Base.unsafe_load(Base.unsafe_convert(Ptr{ForeignCallbacks.ForeignToken}, userdata))
    ForeignCallbacks.notify!(token, nothing)
    return nothing
end

on_disconnect_fcb = ForeignCallbacks.ForeignCallback{Nothing}() do msg
    count_down(received_on_disconnect)
    return nothing
end

function mqtt_on_disconnect(connection::Ptr{aws_mqtt_client_connection}, userdata::Ptr{Cvoid})
    # This is a native function and may not interact with the Julia runtime
    # convert and then load the pointer because this function must be type-stable
    token = Base.unsafe_load(Base.unsafe_convert(Ptr{ForeignCallbacks.ForeignToken}, userdata))
    ForeignCallbacks.notify!(token, nothing)
    return nothing
end

function aws_iot_client_test_main()
    client_id_name = "test-client-id"
    will_payload = "The client has gone offline!"
    ca_filepath = joinpath(@__DIR__, "certs", "AmazonRootCA1.pem")

    allocator = aws_mem_tracer_new(aws_default_allocator(), C_NULL, AWS_MEMTRACE_BYTES, 16)
    push!(refs, allocator)

    logger = Ref(aws_logger(C_NULL, C_NULL, C_NULL))
    push!(refs, logger)
    logger_options = Ref(
        aws_logger_standard_options(
            AWS_LL_TRACE,
            Base.unsafe_convert(Ptr{Cchar}, joinpath(@__DIR__, "log.txt")),
            C_NULL,
        ),
    )
    push!(refs, logger_options)
    aws_logger_init_standard(logger, allocator, logger_options)
    aws_logger_set(logger)

    aws_mqtt_library_init(allocator)

    el_group = aws_event_loop_group_new_default(allocator, 1, C_NULL)
    push!(refs, el_group)

    resolver_options = Ref(aws_host_resolver_default_options(8, el_group, C_NULL, C_NULL))
    resolver = aws_host_resolver_new_default(allocator, resolver_options)
    push!(refs, resolver)

    bootstrap_options = Ref(aws_client_bootstrap_options(el_group, resolver, C_NULL, C_NULL, C_NULL))
    bootstrap = aws_client_bootstrap_new(allocator, bootstrap_options)
    push!(refs, bootstrap)

    tls_ctx_opt = Ref(aws_tls_ctx_options(
        C_NULL,
        AWS_IO_TLS_VER_SYS_DEFAULTS,
        AWS_IO_TLS_CIPHER_PREF_SYSTEM_DEFAULT,
        aws_byte_buf(0, C_NULL, 0, C_NULL),
        C_NULL,
        C_NULL,
        aws_byte_buf(0, C_NULL, 0, C_NULL),
        aws_byte_buf(0, C_NULL, 0, C_NULL),
        0,
        false,
        C_NULL,
        C_NULL,
    ))
    cert_bc = Ref(aws_byte_cursor_from_c_str(ENV["CERT_STRING"]))
    pri_key_bc = Ref(aws_byte_cursor_from_c_str(ENV["PRI_KEY_STRING"]))
    @test AWS_OP_SUCCESS == aws_tls_ctx_options_init_client_mtls(tls_ctx_opt, allocator, cert_bc, pri_key_bc)
    @test tls_ctx_opt[].allocator == allocator
    @test AWS_OP_SUCCESS == aws_tls_ctx_options_set_alpn_list(tls_ctx_opt, "x-amzn-mqtt-ca")
    @test AWS_OP_SUCCESS == aws_tls_ctx_options_override_default_trust_store_from_path(tls_ctx_opt, C_NULL, ca_filepath)

    tls_ctx = aws_tls_client_ctx_new(allocator, tls_ctx_opt)
    push!(refs, tls_ctx)
    @test tls_ctx != C_NULL

    aws_tls_ctx_options_clean_up(tls_ctx_opt)

    tls_connection_options =
        Ref(aws_tls_connection_options(C_NULL, C_NULL, C_NULL, C_NULL, C_NULL, C_NULL, C_NULL, false, 0))
    push!(refs, tls_connection_options)
    aws_tls_connection_options_init_from_ctx(tls_connection_options, tls_ctx)

    client = aws_mqtt_client_new(allocator, bootstrap)
    push!(refs, client)
    connection = aws_mqtt_client_connection_new(client)
    push!(refs, connection)

    socket_options = Ref(aws_socket_options(AWS_SOCKET_STREAM, AWS_SOCKET_IPV6, 3000, 0, 0, 0, false))
    push!(refs, socket_options)

    host_name_cur = Ref(aws_byte_cursor_from_c_str(ENV["ENDPOINT"]))
    push!(refs, host_name_cur)

    client_id_cur = Ref(aws_byte_cursor_from_c_str(client_id_name))
    push!(refs, client_id_cur)

    subscribe_topic_cur = Ref(aws_byte_cursor_from_c_str(TOPIC_STR))
    push!(refs, subscribe_topic_cur)

    will_cur = Ref(aws_byte_cursor_from_c_str(will_payload))
    push!(refs, will_cur)

    @test 0 == aws_mqtt_client_connection_set_will(
        connection,
        subscribe_topic_cur,
        AWS_MQTT_QOS_AT_LEAST_ONCE,
        false,
        will_cur,
    )

    on_connection_complete_token = Ref(ForeignCallbacks.ForeignToken(on_connection_complete_fcb))
    push!(refs, on_connection_complete_token)
    on_disconnect_token = Ref(ForeignCallbacks.ForeignToken(on_disconnect_fcb))
    push!(refs, on_disconnect_token)
    on_packet_received_token = Ref(ForeignCallbacks.ForeignToken(on_packet_received_fcb))
    push!(refs, on_packet_received_token)
    on_suback_token = Ref(ForeignCallbacks.ForeignToken(on_suback_fcb))
    push!(refs, on_suback_token)
    on_puback_token = Ref(ForeignCallbacks.ForeignToken(on_puback_received_fcb))
    push!(refs, on_puback_token)

    on_connection_complete_cb =
        @cfunction(on_connection_complete, Cvoid, (Ptr{aws_mqtt_client_connection}, Cint, Cint, Cuchar, Ptr{Cvoid}))

    on_disconnect_cb = @cfunction(mqtt_on_disconnect, Cvoid, (Ptr{aws_mqtt_client_connection}, Ptr{Cvoid}))

    on_packet_received_cb = @cfunction(
        on_packet_received,
        Cvoid,
        (Ptr{aws_mqtt_client_connection}, Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}, Cuchar, Cint, Cuchar, Ptr{Cvoid})
    )

    mqtt_on_suback_cb = @cfunction(
        mqtt_on_suback,
        Cvoid,
        (Ptr{aws_mqtt_client_connection}, Cuint, Ptr{aws_byte_cursor}, Cint, Cint, Ptr{Cvoid})
    )

    on_puback_cb = @cfunction(on_puback, Cvoid, (Ptr{aws_mqtt_client_connection}, Cuint, Cint, Ptr{Cvoid}))

    conn_options = Ref(
        aws_mqtt_connection_options(
            host_name_cur[],
            UInt16(8883),
            Base.unsafe_convert(Ptr{aws_socket_options}, socket_options),
            Base.unsafe_convert(Ptr{aws_tls_connection_options}, tls_connection_options),
            client_id_cur[],
            0,
            0,
            0,
            on_connection_complete_cb,
            Base.unsafe_convert(Ptr{Cvoid}, on_connection_complete_token), # user_data for on_connection_complete
            true,
        ),
    )
    push!(refs, conn_options)

    aws_mqtt_client_connection_connect(connection, conn_options)
    await(received_on_connection_complete)
    @info "Connected"

    aws_mqtt_client_connection_subscribe(
        connection,
        subscribe_topic_cur,
        AWS_MQTT_QOS_AT_LEAST_ONCE,
        on_packet_received_cb,
        on_packet_received_token, # user_data for on_packet_received
        C_NULL,
        mqtt_on_suback_cb,
        on_suback_token, # user_data for mqtt_on_suback
    )
    await(suback)
    @info "Subscribed"

    payload_cur = Ref(aws_byte_cursor_from_c_str(PAYLOAD_STR))
    push!(refs, payload_cur)

    for i = 1:NUM_PACKETS
        @info "Publishing ($i)"
        aws_mqtt_client_connection_publish(
            connection,
            subscribe_topic_cur,
            AWS_MQTT_QOS_AT_LEAST_ONCE,
            false,
            payload_cur,
            on_puback_cb,
            on_puback_token, # user_data for on_puback
        )
    end
    await(all_pubacks_received)
    @info "All pubacks received"
    await(all_packets_received)
    @info "All packets received"

    aws_mqtt_client_connection_disconnect(connection, on_disconnect_cb, on_disconnect_token)
    await(received_on_disconnect)

    aws_tls_connection_options_clean_up(tls_connection_options)
    aws_mqtt_client_connection_release(connection)
    aws_mqtt_client_release(client)
    aws_tls_ctx_release(tls_ctx)
    aws_client_bootstrap_release(bootstrap)
    aws_host_resolver_release(resolver)
    aws_event_loop_group_release(el_group)
    aws_thread_join_all_managed()
    aws_logger_clean_up(logger)
    aws_mqtt_library_clean_up()
    empty!(refs)

    @test aws_mem_tracer_count(allocator) == 0
    aws_mem_tracer_destroy(allocator)
end

@testset "aws_iot_client_test" begin
    aws_iot_client_test_main()
end
