using Clang.Generators
using Clang.JLLEnvs
using JLLPrefixes
using AWSCRT_jll

cd(@__DIR__)

for target in JLLEnvs.JLL_ENV_TRIPLES
    options = load_options(joinpath(@__DIR__, "generator.toml"))
    options["general"]["output_file_path"] = joinpath(@__DIR__, "..", "lib", "$target.jl")

    metas = collect_artifact_metas(["AWSCRT_jll"])
    metas_keys = collect(keys(metas))

    jll_include_dirs = Dict(
        "aws_c_auth_jll" => ["aws/auth"],
        "aws_c_cal_jll" => ["aws/cal"],
        "aws_c_common_jll" => ["aws/common"],
        "aws_c_compression_jll" => ["aws/compression"],
        "aws_c_event_stream_jll" => ["aws/event-stream"],
        "aws_c_http_jll" => ["aws/http"],
        "aws_c_io_jll" => ["aws/io"],
        "aws_c_iot_jll" => ["aws/iotdevice"],
        "aws_c_mqtt_jll" => ["aws/mqtt"],
        "aws_c_s3_jll" => ["aws/s3"],
        "aws_c_sdkutils_jll" => ["aws/sdkutils"],
        "aws_checksums_jll" => ["aws/checksums"],
    )

    # add compiler flags, e.g. "-DXXXXXXXXX"
    args = get_default_args()  # Note you must call this function firstly and then append your own flags
    header_dirs = String[]

    for (jll_name, include_dirs) in collect(jll_include_dirs)
        meta_key = metas_keys[findfirst(it -> it.name == jll_name, metas_keys)]
        meta = metas[meta_key]
        if length(meta["paths"]) != 1
            error("not sure what to do with these paths", meta)
        end
        path = meta["paths"][1]
        push!(args, "-I$(joinpath(path, "include"))")
        for dir in include_dirs
            push!(header_dirs, joinpath(path, "include", dir))
        end
    end

    headers = String[]
    for header_dir in header_dirs, file in readdir(header_dir, join=true)
        if endswith(file, ".h")
            push!(headers, file)
        end
    end

    # create context
    ctx = create_context(headers, args, options)

    # run generator
    build!(ctx)
end
