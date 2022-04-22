using CEnum

const __uid_t = Cuint

const __pid_t = Cint

const __clock_t = Clong

const __time_t = Clong

const time_t = __time_t

const pthread_t = Culong

struct __pthread_internal_list
    __prev::Ptr{__pthread_internal_list}
    __next::Ptr{__pthread_internal_list}
end

const __pthread_list_t = __pthread_internal_list

struct pthread_mutex_t
    data::NTuple{40, UInt8}
end

function Base.getproperty(x::Ptr{pthread_mutex_t}, f::Symbol)
    f === :__data && return Ptr{__pthread_mutex_s}(x + 0)
    f === :__size && return Ptr{NTuple{40, Cchar}}(x + 0)
    f === :__align && return Ptr{Clong}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::pthread_mutex_t, f::Symbol)
    r = Ref{pthread_mutex_t}(x)
    ptr = Base.unsafe_convert(Ptr{pthread_mutex_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{pthread_mutex_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct pthread_cond_t
    data::NTuple{48, UInt8}
end

function Base.getproperty(x::Ptr{pthread_cond_t}, f::Symbol)
    f === :__data && return Ptr{var"##Ctag#5861"}(x + 0)
    f === :__size && return Ptr{NTuple{48, Cchar}}(x + 0)
    f === :__align && return Ptr{Clonglong}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::pthread_cond_t, f::Symbol)
    r = Ref{pthread_cond_t}(x)
    ptr = Base.unsafe_convert(Ptr{pthread_cond_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{pthread_cond_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

const pthread_once_t = Cint

struct pthread_rwlock_t
    data::NTuple{56, UInt8}
end

function Base.getproperty(x::Ptr{pthread_rwlock_t}, f::Symbol)
    f === :__data && return Ptr{var"##Ctag#5863"}(x + 0)
    f === :__size && return Ptr{NTuple{56, Cchar}}(x + 0)
    f === :__align && return Ptr{Clong}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::pthread_rwlock_t, f::Symbol)
    r = Ref{pthread_rwlock_t}(x)
    ptr = Base.unsafe_convert(Ptr{pthread_rwlock_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{pthread_rwlock_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct tm
    tm_sec::Cint
    tm_min::Cint
    tm_hour::Cint
    tm_mday::Cint
    tm_mon::Cint
    tm_year::Cint
    tm_wday::Cint
    tm_yday::Cint
    tm_isdst::Cint
    tm_gmtoff::Clong
    tm_zone::Ptr{Cchar}
end

struct sigval
    data::NTuple{8, UInt8}
end

function Base.getproperty(x::Ptr{sigval}, f::Symbol)
    f === :sival_int && return Ptr{Cint}(x + 0)
    f === :sival_ptr && return Ptr{Ptr{Cvoid}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::sigval, f::Symbol)
    r = Ref{sigval}(x)
    ptr = Base.unsafe_convert(Ptr{sigval}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{sigval}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

const sigval_t = sigval

struct var"##Ctag#5942"
    data::NTuple{112, UInt8}
end

function Base.getproperty(x::Ptr{var"##Ctag#5942"}, f::Symbol)
    f === :_pad && return Ptr{NTuple{28, Cint}}(x + 0)
    f === :_kill && return Ptr{var"##Ctag#5943"}(x + 0)
    f === :_timer && return Ptr{var"##Ctag#5944"}(x + 0)
    f === :_rt && return Ptr{var"##Ctag#5945"}(x + 0)
    f === :_sigchld && return Ptr{var"##Ctag#5946"}(x + 0)
    f === :_sigfault && return Ptr{var"##Ctag#5947"}(x + 0)
    f === :_sigpoll && return Ptr{var"##Ctag#5948"}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#5942", f::Symbol)
    r = Ref{var"##Ctag#5942"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#5942"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#5942"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct siginfo
    data::NTuple{128, UInt8}
end

function Base.getproperty(x::Ptr{siginfo}, f::Symbol)
    f === :si_signo && return Ptr{Cint}(x + 0)
    f === :si_errno && return Ptr{Cint}(x + 4)
    f === :si_code && return Ptr{Cint}(x + 8)
    f === :_sifields && return Ptr{var"##Ctag#5942"}(x + 16)
    return getfield(x, f)
end

function Base.getproperty(x::siginfo, f::Symbol)
    r = Ref{siginfo}(x)
    ptr = Base.unsafe_convert(Ptr{siginfo}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{siginfo}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

const siginfo_t = siginfo

"""
    aws_raise_error(err)

### Prototype
```c
AWS_STATIC_IMPL int aws_raise_error(int err);
```
"""
function aws_raise_error(err)
    ccall((:aws_raise_error, libawscrt), Cint, (Cint,), err)
end

"""
    aws_is_mem_zeroed(buf, bufsize)

Returns whether each byte is zero.

### Prototype
```c
AWS_STATIC_IMPL bool aws_is_mem_zeroed(const void *buf, size_t bufsize);
```
"""
function aws_is_mem_zeroed(buf, bufsize)
    ccall((:aws_is_mem_zeroed, libawscrt), Bool, (Ptr{Cvoid}, Csize_t), buf, bufsize)
end

"""
    aws_mul_u64_saturating(a, b)

Multiplies a * b. If the result overflows, returns 2^64 - 1.

### Prototype
```c
AWS_STATIC_IMPL uint64_t aws_mul_u64_saturating(uint64_t a, uint64_t b);
```
"""
function aws_mul_u64_saturating(a, b)
    ccall((:aws_mul_u64_saturating, libawscrt), UInt64, (UInt64, UInt64), a, b)
end

"""
    aws_mul_u64_checked(a, b, r)

If a * b overflows, returns [`AWS_OP_ERR`](@ref); otherwise multiplies a * b, returns the result in *r, and returns [`AWS_OP_SUCCESS`](@ref).

### Prototype
```c
AWS_STATIC_IMPL int aws_mul_u64_checked(uint64_t a, uint64_t b, uint64_t *r);
```
"""
function aws_mul_u64_checked(a, b, r)
    ccall((:aws_mul_u64_checked, libawscrt), Cint, (UInt64, UInt64, Ptr{UInt64}), a, b, r)
end

"""
    aws_mul_u32_saturating(a, b)

Multiplies a * b. If the result overflows, returns 2^32 - 1.

### Prototype
```c
AWS_STATIC_IMPL uint32_t aws_mul_u32_saturating(uint32_t a, uint32_t b);
```
"""
function aws_mul_u32_saturating(a, b)
    ccall((:aws_mul_u32_saturating, libawscrt), UInt32, (UInt32, UInt32), a, b)
end

"""
    aws_mul_u32_checked(a, b, r)

If a * b overflows, returns [`AWS_OP_ERR`](@ref); otherwise multiplies a * b, returns the result in *r, and returns [`AWS_OP_SUCCESS`](@ref).

### Prototype
```c
AWS_STATIC_IMPL int aws_mul_u32_checked(uint32_t a, uint32_t b, uint32_t *r);
```
"""
function aws_mul_u32_checked(a, b, r)
    ccall((:aws_mul_u32_checked, libawscrt), Cint, (UInt32, UInt32, Ptr{UInt32}), a, b, r)
end

"""
    aws_add_u64_checked(a, b, r)

If a + b overflows, returns [`AWS_OP_ERR`](@ref); otherwise adds a + b, returns the result in *r, and returns [`AWS_OP_SUCCESS`](@ref).

### Prototype
```c
AWS_STATIC_IMPL int aws_add_u64_checked(uint64_t a, uint64_t b, uint64_t *r);
```
"""
function aws_add_u64_checked(a, b, r)
    ccall((:aws_add_u64_checked, libawscrt), Cint, (UInt64, UInt64, Ptr{UInt64}), a, b, r)
end

"""
    aws_add_u64_saturating(a, b)

Adds a + b. If the result overflows, returns 2^64 - 1.

### Prototype
```c
AWS_STATIC_IMPL uint64_t aws_add_u64_saturating(uint64_t a, uint64_t b);
```
"""
function aws_add_u64_saturating(a, b)
    ccall((:aws_add_u64_saturating, libawscrt), UInt64, (UInt64, UInt64), a, b)
end

"""
    aws_add_u32_checked(a, b, r)

If a + b overflows, returns [`AWS_OP_ERR`](@ref); otherwise adds a + b, returns the result in *r, and returns [`AWS_OP_SUCCESS`](@ref).

### Prototype
```c
AWS_STATIC_IMPL int aws_add_u32_checked(uint32_t a, uint32_t b, uint32_t *r);
```
"""
function aws_add_u32_checked(a, b, r)
    ccall((:aws_add_u32_checked, libawscrt), Cint, (UInt32, UInt32, Ptr{UInt32}), a, b, r)
end

"""
    aws_add_u32_saturating(a, b)

Adds a + b. If the result overflows, returns 2^32 - 1.

### Prototype
```c
AWS_STATIC_IMPL uint32_t aws_add_u32_saturating(uint32_t a, uint32_t b);
```
"""
function aws_add_u32_saturating(a, b)
    ccall((:aws_add_u32_saturating, libawscrt), UInt32, (UInt32, UInt32), a, b)
end

"""
    aws_clz_u32(n)

Search from the MSB to LSB, looking for a 1

### Prototype
```c
AWS_STATIC_IMPL size_t aws_clz_u32(uint32_t n);
```
"""
function aws_clz_u32(n)
    ccall((:aws_clz_u32, libawscrt), Csize_t, (UInt32,), n)
end

"""
    aws_clz_i32(n)

### Prototype
```c
AWS_STATIC_IMPL size_t aws_clz_i32(int32_t n);
```
"""
function aws_clz_i32(n)
    ccall((:aws_clz_i32, libawscrt), Csize_t, (Int32,), n)
end

"""
    aws_clz_u64(n)

### Prototype
```c
AWS_STATIC_IMPL size_t aws_clz_u64(uint64_t n);
```
"""
function aws_clz_u64(n)
    ccall((:aws_clz_u64, libawscrt), Csize_t, (UInt64,), n)
end

"""
    aws_clz_i64(n)

### Prototype
```c
AWS_STATIC_IMPL size_t aws_clz_i64(int64_t n);
```
"""
function aws_clz_i64(n)
    ccall((:aws_clz_i64, libawscrt), Csize_t, (Int64,), n)
end

"""
    aws_clz_size(n)

### Prototype
```c
AWS_STATIC_IMPL size_t aws_clz_size(size_t n);
```
"""
function aws_clz_size(n)
    ccall((:aws_clz_size, libawscrt), Csize_t, (Csize_t,), n)
end

"""
    aws_ctz_u32(n)

Search from the LSB to MSB, looking for a 1

### Prototype
```c
AWS_STATIC_IMPL size_t aws_ctz_u32(uint32_t n);
```
"""
function aws_ctz_u32(n)
    ccall((:aws_ctz_u32, libawscrt), Csize_t, (UInt32,), n)
end

"""
    aws_ctz_i32(n)

### Prototype
```c
AWS_STATIC_IMPL size_t aws_ctz_i32(int32_t n);
```
"""
function aws_ctz_i32(n)
    ccall((:aws_ctz_i32, libawscrt), Csize_t, (Int32,), n)
end

"""
    aws_ctz_u64(n)

### Prototype
```c
AWS_STATIC_IMPL size_t aws_ctz_u64(uint64_t n);
```
"""
function aws_ctz_u64(n)
    ccall((:aws_ctz_u64, libawscrt), Csize_t, (UInt64,), n)
end

"""
    aws_ctz_i64(n)

### Prototype
```c
AWS_STATIC_IMPL size_t aws_ctz_i64(int64_t n);
```
"""
function aws_ctz_i64(n)
    ccall((:aws_ctz_i64, libawscrt), Csize_t, (Int64,), n)
end

"""
    aws_ctz_size(n)

### Prototype
```c
AWS_STATIC_IMPL size_t aws_ctz_size(size_t n);
```
"""
function aws_ctz_size(n)
    ccall((:aws_ctz_size, libawscrt), Csize_t, (Csize_t,), n)
end

"""
    aws_sub_u64_saturating(a, b)

Subtracts a - b. If the result overflows returns 0.

### Prototype
```c
AWS_STATIC_IMPL uint64_t aws_sub_u64_saturating(uint64_t a, uint64_t b);
```
"""
function aws_sub_u64_saturating(a, b)
    ccall((:aws_sub_u64_saturating, libawscrt), UInt64, (UInt64, UInt64), a, b)
end

"""
    aws_sub_u64_checked(a, b, r)

If a - b overflows, returns [`AWS_OP_ERR`](@ref); otherwise subtracts a - b, returns the result in *r, and returns [`AWS_OP_SUCCESS`](@ref).

### Prototype
```c
AWS_STATIC_IMPL int aws_sub_u64_checked(uint64_t a, uint64_t b, uint64_t *r);
```
"""
function aws_sub_u64_checked(a, b, r)
    ccall((:aws_sub_u64_checked, libawscrt), Cint, (UInt64, UInt64, Ptr{UInt64}), a, b, r)
end

"""
    aws_sub_u32_saturating(a, b)

Subtracts a - b. If the result overflows returns 0.

### Prototype
```c
AWS_STATIC_IMPL uint32_t aws_sub_u32_saturating(uint32_t a, uint32_t b);
```
"""
function aws_sub_u32_saturating(a, b)
    ccall((:aws_sub_u32_saturating, libawscrt), UInt32, (UInt32, UInt32), a, b)
end

"""
    aws_sub_u32_checked(a, b, r)

If a - b overflows, returns [`AWS_OP_ERR`](@ref); otherwise subtracts a - b, returns the result in *r, and returns [`AWS_OP_SUCCESS`](@ref).

### Prototype
```c
AWS_STATIC_IMPL int aws_sub_u32_checked(uint32_t a, uint32_t b, uint32_t *r);
```
"""
function aws_sub_u32_checked(a, b, r)
    ccall((:aws_sub_u32_checked, libawscrt), Cint, (UInt32, UInt32, Ptr{UInt32}), a, b, r)
end

"""
    aws_mul_size_saturating(a, b)

Multiplies a * b. If the result overflows, returns SIZE\\_MAX.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_mul_size_saturating(size_t a, size_t b);
```
"""
function aws_mul_size_saturating(a, b)
    ccall((:aws_mul_size_saturating, libawscrt), Csize_t, (Csize_t, Csize_t), a, b)
end

"""
    aws_mul_size_checked(a, b, r)

Multiplies a * b and returns the result in *r. If the result overflows, returns [`AWS_OP_ERR`](@ref); otherwise returns [`AWS_OP_SUCCESS`](@ref).

### Prototype
```c
AWS_STATIC_IMPL int aws_mul_size_checked(size_t a, size_t b, size_t *r);
```
"""
function aws_mul_size_checked(a, b, r)
    ccall((:aws_mul_size_checked, libawscrt), Cint, (Csize_t, Csize_t, Ptr{Csize_t}), a, b, r)
end

"""
    aws_add_size_saturating(a, b)

Adds a + b. If the result overflows returns SIZE\\_MAX.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_add_size_saturating(size_t a, size_t b);
```
"""
function aws_add_size_saturating(a, b)
    ccall((:aws_add_size_saturating, libawscrt), Csize_t, (Csize_t, Csize_t), a, b)
end

"""
    aws_add_size_checked(a, b, r)

Adds a + b and returns the result in *r. If the result overflows, returns [`AWS_OP_ERR`](@ref); otherwise returns [`AWS_OP_SUCCESS`](@ref).

### Prototype
```c
AWS_STATIC_IMPL int aws_add_size_checked(size_t a, size_t b, size_t *r);
```
"""
function aws_add_size_checked(a, b, r)
    ccall((:aws_add_size_checked, libawscrt), Cint, (Csize_t, Csize_t, Ptr{Csize_t}), a, b, r)
end

"""
    aws_sub_size_saturating(a, b)

Subtracts a - b. If the result overflows returns 0.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_sub_size_saturating(size_t a, size_t b);
```
"""
function aws_sub_size_saturating(a, b)
    ccall((:aws_sub_size_saturating, libawscrt), Csize_t, (Csize_t, Csize_t), a, b)
end

"""
    aws_sub_size_checked(a, b, r)

If a - b overflows, returns [`AWS_OP_ERR`](@ref); otherwise subtracts a - b, returns the result in *r, and returns [`AWS_OP_SUCCESS`](@ref).

### Prototype
```c
AWS_STATIC_IMPL int aws_sub_size_checked(size_t a, size_t b, size_t *r);
```
"""
function aws_sub_size_checked(a, b, r)
    ccall((:aws_sub_size_checked, libawscrt), Cint, (Csize_t, Csize_t, Ptr{Csize_t}), a, b, r)
end

"""
    aws_is_power_of_two(x)

Function to check if x is power of 2

### Prototype
```c
AWS_STATIC_IMPL bool aws_is_power_of_two(const size_t x);
```
"""
function aws_is_power_of_two(x)
    ccall((:aws_is_power_of_two, libawscrt), Bool, (Csize_t,), x)
end

"""
    aws_round_up_to_power_of_two(n, result)

Function to find the smallest result that is power of 2 >= n. Returns [`AWS_OP_ERR`](@ref) if this cannot be done without overflow

### Prototype
```c
AWS_STATIC_IMPL int aws_round_up_to_power_of_two(size_t n, size_t *result);
```
"""
function aws_round_up_to_power_of_two(n, result)
    ccall((:aws_round_up_to_power_of_two, libawscrt), Cint, (Csize_t, Ptr{Csize_t}), n, result)
end

"""
    aws_min_u8(a, b)

### Prototype
```c
AWS_STATIC_IMPL uint8_t aws_min_u8(uint8_t a, uint8_t b);
```
"""
function aws_min_u8(a, b)
    ccall((:aws_min_u8, libawscrt), UInt8, (UInt8, UInt8), a, b)
end

"""
    aws_max_u8(a, b)

### Prototype
```c
AWS_STATIC_IMPL uint8_t aws_max_u8(uint8_t a, uint8_t b);
```
"""
function aws_max_u8(a, b)
    ccall((:aws_max_u8, libawscrt), UInt8, (UInt8, UInt8), a, b)
end

"""
    aws_min_i8(a, b)

### Prototype
```c
AWS_STATIC_IMPL int8_t aws_min_i8(int8_t a, int8_t b);
```
"""
function aws_min_i8(a, b)
    ccall((:aws_min_i8, libawscrt), Int8, (Int8, Int8), a, b)
end

"""
    aws_max_i8(a, b)

### Prototype
```c
AWS_STATIC_IMPL int8_t aws_max_i8(int8_t a, int8_t b);
```
"""
function aws_max_i8(a, b)
    ccall((:aws_max_i8, libawscrt), Int8, (Int8, Int8), a, b)
end

"""
    aws_min_u16(a, b)

### Prototype
```c
AWS_STATIC_IMPL uint16_t aws_min_u16(uint16_t a, uint16_t b);
```
"""
function aws_min_u16(a, b)
    ccall((:aws_min_u16, libawscrt), UInt16, (UInt16, UInt16), a, b)
end

"""
    aws_max_u16(a, b)

### Prototype
```c
AWS_STATIC_IMPL uint16_t aws_max_u16(uint16_t a, uint16_t b);
```
"""
function aws_max_u16(a, b)
    ccall((:aws_max_u16, libawscrt), UInt16, (UInt16, UInt16), a, b)
end

"""
    aws_min_i16(a, b)

### Prototype
```c
AWS_STATIC_IMPL int16_t aws_min_i16(int16_t a, int16_t b);
```
"""
function aws_min_i16(a, b)
    ccall((:aws_min_i16, libawscrt), Int16, (Int16, Int16), a, b)
end

"""
    aws_max_i16(a, b)

### Prototype
```c
AWS_STATIC_IMPL int16_t aws_max_i16(int16_t a, int16_t b);
```
"""
function aws_max_i16(a, b)
    ccall((:aws_max_i16, libawscrt), Int16, (Int16, Int16), a, b)
end

"""
    aws_min_u32(a, b)

### Prototype
```c
AWS_STATIC_IMPL uint32_t aws_min_u32(uint32_t a, uint32_t b);
```
"""
function aws_min_u32(a, b)
    ccall((:aws_min_u32, libawscrt), UInt32, (UInt32, UInt32), a, b)
end

"""
    aws_max_u32(a, b)

### Prototype
```c
AWS_STATIC_IMPL uint32_t aws_max_u32(uint32_t a, uint32_t b);
```
"""
function aws_max_u32(a, b)
    ccall((:aws_max_u32, libawscrt), UInt32, (UInt32, UInt32), a, b)
end

"""
    aws_min_i32(a, b)

### Prototype
```c
AWS_STATIC_IMPL int32_t aws_min_i32(int32_t a, int32_t b);
```
"""
function aws_min_i32(a, b)
    ccall((:aws_min_i32, libawscrt), Int32, (Int32, Int32), a, b)
end

"""
    aws_max_i32(a, b)

### Prototype
```c
AWS_STATIC_IMPL int32_t aws_max_i32(int32_t a, int32_t b);
```
"""
function aws_max_i32(a, b)
    ccall((:aws_max_i32, libawscrt), Int32, (Int32, Int32), a, b)
end

"""
    aws_min_u64(a, b)

### Prototype
```c
AWS_STATIC_IMPL uint64_t aws_min_u64(uint64_t a, uint64_t b);
```
"""
function aws_min_u64(a, b)
    ccall((:aws_min_u64, libawscrt), UInt64, (UInt64, UInt64), a, b)
end

"""
    aws_max_u64(a, b)

### Prototype
```c
AWS_STATIC_IMPL uint64_t aws_max_u64(uint64_t a, uint64_t b);
```
"""
function aws_max_u64(a, b)
    ccall((:aws_max_u64, libawscrt), UInt64, (UInt64, UInt64), a, b)
end

"""
    aws_min_i64(a, b)

### Prototype
```c
AWS_STATIC_IMPL int64_t aws_min_i64(int64_t a, int64_t b);
```
"""
function aws_min_i64(a, b)
    ccall((:aws_min_i64, libawscrt), Int64, (Int64, Int64), a, b)
end

"""
    aws_max_i64(a, b)

### Prototype
```c
AWS_STATIC_IMPL int64_t aws_max_i64(int64_t a, int64_t b);
```
"""
function aws_max_i64(a, b)
    ccall((:aws_max_i64, libawscrt), Int64, (Int64, Int64), a, b)
end

"""
    aws_min_size(a, b)

### Prototype
```c
AWS_STATIC_IMPL size_t aws_min_size(size_t a, size_t b);
```
"""
function aws_min_size(a, b)
    ccall((:aws_min_size, libawscrt), Csize_t, (Csize_t, Csize_t), a, b)
end

"""
    aws_max_size(a, b)

### Prototype
```c
AWS_STATIC_IMPL size_t aws_max_size(size_t a, size_t b);
```
"""
function aws_max_size(a, b)
    ccall((:aws_max_size, libawscrt), Csize_t, (Csize_t, Csize_t), a, b)
end

"""
    aws_min_int(a, b)

### Prototype
```c
AWS_STATIC_IMPL int aws_min_int(int a, int b);
```
"""
function aws_min_int(a, b)
    ccall((:aws_min_int, libawscrt), Cint, (Cint, Cint), a, b)
end

"""
    aws_max_int(a, b)

### Prototype
```c
AWS_STATIC_IMPL int aws_max_int(int a, int b);
```
"""
function aws_max_int(a, b)
    ccall((:aws_max_int, libawscrt), Cint, (Cint, Cint), a, b)
end

"""
    aws_min_float(a, b)

### Prototype
```c
AWS_STATIC_IMPL float aws_min_float(float a, float b);
```
"""
function aws_min_float(a, b)
    ccall((:aws_min_float, libawscrt), Cfloat, (Cfloat, Cfloat), a, b)
end

"""
    aws_max_float(a, b)

### Prototype
```c
AWS_STATIC_IMPL float aws_max_float(float a, float b);
```
"""
function aws_max_float(a, b)
    ccall((:aws_max_float, libawscrt), Cfloat, (Cfloat, Cfloat), a, b)
end

"""
    aws_min_double(a, b)

### Prototype
```c
AWS_STATIC_IMPL double aws_min_double(double a, double b);
```
"""
function aws_min_double(a, b)
    ccall((:aws_min_double, libawscrt), Cdouble, (Cdouble, Cdouble), a, b)
end

"""
    aws_max_double(a, b)

### Prototype
```c
AWS_STATIC_IMPL double aws_max_double(double a, double b);
```
"""
function aws_max_double(a, b)
    ccall((:aws_max_double, libawscrt), Cdouble, (Cdouble, Cdouble), a, b)
end

struct aws_allocator
    mem_acquire::Ptr{Cvoid}
    mem_release::Ptr{Cvoid}
    mem_realloc::Ptr{Cvoid}
    mem_calloc::Ptr{Cvoid}
    impl::Ptr{Cvoid}
end

struct aws_array_list
    alloc::Ptr{aws_allocator}
    current_size::Csize_t
    length::Csize_t
    item_size::Csize_t
    data::Ptr{Cvoid}
end

"""
    aws_array_list_init_dynamic(list, alloc, initial_item_allocation, item_size)

Initializes an array list with an array of size initial\\_item\\_allocation * item\\_size. In this mode, the array size will grow by a factor of 2 upon insertion if space is not available. initial\\_item\\_allocation is the number of elements you want space allocated for. item\\_size is the size of each element in bytes. Mixing items types is not supported by this API.

### Prototype
```c
AWS_STATIC_IMPL int aws_array_list_init_dynamic( struct aws_array_list *AWS_RESTRICT list, struct aws_allocator *alloc, size_t initial_item_allocation, size_t item_size);
```
"""
function aws_array_list_init_dynamic(list, alloc, initial_item_allocation, item_size)
    ccall((:aws_array_list_init_dynamic, libawscrt), Cint, (Ptr{aws_array_list}, Ptr{aws_allocator}, Csize_t, Csize_t), list, alloc, initial_item_allocation, item_size)
end

"""
    aws_array_list_init_static(list, raw_array, item_count, item_size)

Initializes an array list with a preallocated array of void *. item\\_count is the number of elements in the array, and item\\_size is the size in bytes of each element. Mixing items types is not supported by this API. Once this list is full, new items will be rejected.

### Prototype
```c
AWS_STATIC_IMPL void aws_array_list_init_static( struct aws_array_list *AWS_RESTRICT list, void *raw_array, size_t item_count, size_t item_size);
```
"""
function aws_array_list_init_static(list, raw_array, item_count, item_size)
    ccall((:aws_array_list_init_static, libawscrt), Cvoid, (Ptr{aws_array_list}, Ptr{Cvoid}, Csize_t, Csize_t), list, raw_array, item_count, item_size)
end

"""
    aws_array_list_is_valid(list)

Set of properties of a valid [`aws_array_list`](@ref).

### Prototype
```c
AWS_STATIC_IMPL bool aws_array_list_is_valid(const struct aws_array_list *AWS_RESTRICT list);
```
"""
function aws_array_list_is_valid(list)
    ccall((:aws_array_list_is_valid, libawscrt), Bool, (Ptr{aws_array_list},), list)
end

"""
    aws_array_list_debug_print(list)

### Prototype
```c
AWS_STATIC_IMPL void aws_array_list_debug_print(const struct aws_array_list *list);
```
"""
function aws_array_list_debug_print(list)
    ccall((:aws_array_list_debug_print, libawscrt), Cvoid, (Ptr{aws_array_list},), list)
end

"""
    aws_array_list_clean_up(list)

Deallocates any memory that was allocated for this list, and resets list for reuse or deletion.

### Prototype
```c
AWS_STATIC_IMPL void aws_array_list_clean_up(struct aws_array_list *AWS_RESTRICT list);
```
"""
function aws_array_list_clean_up(list)
    ccall((:aws_array_list_clean_up, libawscrt), Cvoid, (Ptr{aws_array_list},), list)
end

"""
    aws_array_list_clean_up_secure(list)

Erases and then deallocates any memory that was allocated for this list, and resets list for reuse or deletion.

### Prototype
```c
AWS_STATIC_IMPL void aws_array_list_clean_up_secure(struct aws_array_list *AWS_RESTRICT list);
```
"""
function aws_array_list_clean_up_secure(list)
    ccall((:aws_array_list_clean_up_secure, libawscrt), Cvoid, (Ptr{aws_array_list},), list)
end

"""
    aws_array_list_push_back(list, val)

Pushes the memory pointed to by val onto the end of internal list

### Prototype
```c
AWS_STATIC_IMPL int aws_array_list_push_back(struct aws_array_list *AWS_RESTRICT list, const void *val);
```
"""
function aws_array_list_push_back(list, val)
    ccall((:aws_array_list_push_back, libawscrt), Cint, (Ptr{aws_array_list}, Ptr{Cvoid}), list, val)
end

"""
    aws_array_list_front(list, val)

Copies the element at the front of the list if it exists. If list is empty, AWS\\_ERROR\\_LIST\\_EMPTY will be raised

### Prototype
```c
AWS_STATIC_IMPL int aws_array_list_front(const struct aws_array_list *AWS_RESTRICT list, void *val);
```
"""
function aws_array_list_front(list, val)
    ccall((:aws_array_list_front, libawscrt), Cint, (Ptr{aws_array_list}, Ptr{Cvoid}), list, val)
end

"""
    aws_array_list_push_front(list, val)

Pushes the memory pointed to by val onto the front of internal list. This call results in shifting all of the elements in the list. Avoid this call unless that is intended behavior.

### Prototype
```c
AWS_STATIC_IMPL int aws_array_list_push_front(struct aws_array_list *AWS_RESTRICT list, const void *val);
```
"""
function aws_array_list_push_front(list, val)
    ccall((:aws_array_list_push_front, libawscrt), Cint, (Ptr{aws_array_list}, Ptr{Cvoid}), list, val)
end

"""
    aws_array_list_pop_front(list)

Deletes the element at the front of the list if it exists. If list is empty, AWS\\_ERROR\\_LIST\\_EMPTY will be raised. This call results in shifting all of the elements at the end of the array to the front. Avoid this call unless that is intended behavior.

### Prototype
```c
AWS_STATIC_IMPL int aws_array_list_pop_front(struct aws_array_list *AWS_RESTRICT list);
```
"""
function aws_array_list_pop_front(list)
    ccall((:aws_array_list_pop_front, libawscrt), Cint, (Ptr{aws_array_list},), list)
end

"""
    aws_array_list_pop_front_n(list, n)

Delete N elements from the front of the list. Remaining elements are shifted to the front of the list. If the list has less than N elements, the list is cleared. This call is more efficient than calling [`aws_array_list_pop_front`](@ref)() N times.

### Prototype
```c
AWS_STATIC_IMPL void aws_array_list_pop_front_n(struct aws_array_list *AWS_RESTRICT list, size_t n);
```
"""
function aws_array_list_pop_front_n(list, n)
    ccall((:aws_array_list_pop_front_n, libawscrt), Cvoid, (Ptr{aws_array_list}, Csize_t), list, n)
end

"""
    aws_array_list_erase(list, index)

Deletes the element this index in the list if it exists. If element does not exist, AWS\\_ERROR\\_INVALID\\_INDEX will be raised. This call results in shifting all remaining elements towards the front. Avoid this call unless that is intended behavior.

### Prototype
```c
int aws_array_list_erase(struct aws_array_list *AWS_RESTRICT list, size_t index);
```
"""
function aws_array_list_erase(list, index)
    ccall((:aws_array_list_erase, libawscrt), Cint, (Ptr{aws_array_list}, Csize_t), list, index)
end

"""
    aws_array_list_back(list, val)

Copies the element at the end of the list if it exists. If list is empty, AWS\\_ERROR\\_LIST\\_EMPTY will be raised.

### Prototype
```c
AWS_STATIC_IMPL int aws_array_list_back(const struct aws_array_list *AWS_RESTRICT list, void *val);
```
"""
function aws_array_list_back(list, val)
    ccall((:aws_array_list_back, libawscrt), Cint, (Ptr{aws_array_list}, Ptr{Cvoid}), list, val)
end

"""
    aws_array_list_pop_back(list)

Deletes the element at the end of the list if it exists. If list is empty, AWS\\_ERROR\\_LIST\\_EMPTY will be raised.

### Prototype
```c
AWS_STATIC_IMPL int aws_array_list_pop_back(struct aws_array_list *AWS_RESTRICT list);
```
"""
function aws_array_list_pop_back(list)
    ccall((:aws_array_list_pop_back, libawscrt), Cint, (Ptr{aws_array_list},), list)
end

"""
    aws_array_list_clear(list)

Clears all elements in the array and resets length to zero. Size does not change in this operation.

### Prototype
```c
AWS_STATIC_IMPL void aws_array_list_clear(struct aws_array_list *AWS_RESTRICT list);
```
"""
function aws_array_list_clear(list)
    ccall((:aws_array_list_clear, libawscrt), Cvoid, (Ptr{aws_array_list},), list)
end

"""
    aws_array_list_swap_contents(list_a, list_b)

Swap contents between two dynamic lists. Both lists must use the same allocator.

### Prototype
```c
AWS_STATIC_IMPL void aws_array_list_swap_contents( struct aws_array_list *AWS_RESTRICT list_a, struct aws_array_list *AWS_RESTRICT list_b);
```
"""
function aws_array_list_swap_contents(list_a, list_b)
    ccall((:aws_array_list_swap_contents, libawscrt), Cvoid, (Ptr{aws_array_list}, Ptr{aws_array_list}), list_a, list_b)
end

"""
    aws_array_list_capacity(list)

Returns the number of elements that can fit in the internal array. If list is initialized in dynamic mode, the capacity changes over time.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_array_list_capacity(const struct aws_array_list *AWS_RESTRICT list);
```
"""
function aws_array_list_capacity(list)
    ccall((:aws_array_list_capacity, libawscrt), Csize_t, (Ptr{aws_array_list},), list)
end

"""
    aws_array_list_length(list)

Returns the number of elements in the internal array.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_array_list_length(const struct aws_array_list *AWS_RESTRICT list);
```
"""
function aws_array_list_length(list)
    ccall((:aws_array_list_length, libawscrt), Csize_t, (Ptr{aws_array_list},), list)
end

"""
    aws_array_list_get_at(list, val, index)

Copies the memory at index to val. If element does not exist, AWS\\_ERROR\\_INVALID\\_INDEX will be raised.

### Prototype
```c
AWS_STATIC_IMPL int aws_array_list_get_at(const struct aws_array_list *AWS_RESTRICT list, void *val, size_t index);
```
"""
function aws_array_list_get_at(list, val, index)
    ccall((:aws_array_list_get_at, libawscrt), Cint, (Ptr{aws_array_list}, Ptr{Cvoid}, Csize_t), list, val, index)
end

"""
    aws_array_list_get_at_ptr(list, val, index)

Copies the memory address of the element at index to *val. If element does not exist, AWS\\_ERROR\\_INVALID\\_INDEX will be raised.

### Prototype
```c
AWS_STATIC_IMPL int aws_array_list_get_at_ptr(const struct aws_array_list *AWS_RESTRICT list, void **val, size_t index);
```
"""
function aws_array_list_get_at_ptr(list, val, index)
    ccall((:aws_array_list_get_at_ptr, libawscrt), Cint, (Ptr{aws_array_list}, Ptr{Ptr{Cvoid}}, Csize_t), list, val, index)
end

"""
    aws_array_list_set_at(list, val, index)

Copies the the memory pointed to by val into the array at index. If in dynamic mode, the size will grow by a factor of two when the array is full. In static mode, AWS\\_ERROR\\_INVALID\\_INDEX will be raised if the index is past the bounds of the array.

### Prototype
```c
AWS_STATIC_IMPL int aws_array_list_set_at(struct aws_array_list *AWS_RESTRICT list, const void *val, size_t index);
```
"""
function aws_array_list_set_at(list, val, index)
    ccall((:aws_array_list_set_at, libawscrt), Cint, (Ptr{aws_array_list}, Ptr{Cvoid}, Csize_t), list, val, index)
end

"""
    aws_array_list_sort(list, compare_fn)

Sort elements in the list in-place according to the comparator function.

### Prototype
```c
AWS_STATIC_IMPL void aws_array_list_sort(struct aws_array_list *AWS_RESTRICT list, aws_array_list_comparator_fn *compare_fn);
```
"""
function aws_array_list_sort(list, compare_fn)
    ccall((:aws_array_list_sort, libawscrt), Cvoid, (Ptr{aws_array_list}, Ptr{Cvoid}), list, compare_fn)
end

"""
    aws_is_big_endian()

Returns 1 if machine is big endian, 0 if little endian. If you compile with even -O1 optimization, this check is completely optimized out at compile time and code which calls "if ([`aws_is_big_endian`](@ref)())" will do the right thing without branching.

### Prototype
```c
AWS_STATIC_IMPL int aws_is_big_endian(void);
```
"""
function aws_is_big_endian()
    ccall((:aws_is_big_endian, libawscrt), Cint, ())
end

"""
    aws_hton64(x)

Convert 64 bit integer from host to network byte order.

### Prototype
```c
AWS_STATIC_IMPL uint64_t aws_hton64(uint64_t x);
```
"""
function aws_hton64(x)
    ccall((:aws_hton64, libawscrt), UInt64, (UInt64,), x)
end

"""
    aws_ntoh64(x)

Convert 64 bit integer from network to host byte order.

### Prototype
```c
AWS_STATIC_IMPL uint64_t aws_ntoh64(uint64_t x);
```
"""
function aws_ntoh64(x)
    ccall((:aws_ntoh64, libawscrt), UInt64, (UInt64,), x)
end

"""
    aws_hton32(x)

Convert 32 bit integer from host to network byte order.

### Prototype
```c
AWS_STATIC_IMPL uint32_t aws_hton32(uint32_t x);
```
"""
function aws_hton32(x)
    ccall((:aws_hton32, libawscrt), UInt32, (UInt32,), x)
end

"""
    aws_htonf32(x)

Convert 32 bit float from host to network byte order.

### Prototype
```c
AWS_STATIC_IMPL float aws_htonf32(float x);
```
"""
function aws_htonf32(x)
    ccall((:aws_htonf32, libawscrt), Cfloat, (Cfloat,), x)
end

"""
    aws_htonf64(x)

Convert 64 bit double from host to network byte order.

### Prototype
```c
AWS_STATIC_IMPL double aws_htonf64(double x);
```
"""
function aws_htonf64(x)
    ccall((:aws_htonf64, libawscrt), Cdouble, (Cdouble,), x)
end

"""
    aws_ntoh32(x)

Convert 32 bit integer from network to host byte order.

### Prototype
```c
AWS_STATIC_IMPL uint32_t aws_ntoh32(uint32_t x);
```
"""
function aws_ntoh32(x)
    ccall((:aws_ntoh32, libawscrt), UInt32, (UInt32,), x)
end

"""
    aws_ntohf32(x)

Convert 32 bit float from network to host byte order.

### Prototype
```c
AWS_STATIC_IMPL float aws_ntohf32(float x);
```
"""
function aws_ntohf32(x)
    ccall((:aws_ntohf32, libawscrt), Cfloat, (Cfloat,), x)
end

"""
    aws_ntohf64(x)

Convert 32 bit float from network to host byte order.

### Prototype
```c
AWS_STATIC_IMPL double aws_ntohf64(double x);
```
"""
function aws_ntohf64(x)
    ccall((:aws_ntohf64, libawscrt), Cdouble, (Cdouble,), x)
end

"""
    aws_hton16(x)

Convert 16 bit integer from host to network byte order.

### Prototype
```c
AWS_STATIC_IMPL uint16_t aws_hton16(uint16_t x);
```
"""
function aws_hton16(x)
    ccall((:aws_hton16, libawscrt), UInt16, (UInt16,), x)
end

"""
    aws_ntoh16(x)

Convert 16 bit integer from network to host byte order.

### Prototype
```c
AWS_STATIC_IMPL uint16_t aws_ntoh16(uint16_t x);
```
"""
function aws_ntoh16(x)
    ccall((:aws_ntoh16, libawscrt), UInt16, (UInt16,), x)
end

struct aws_linked_list_node
    next::Ptr{aws_linked_list_node}
    prev::Ptr{aws_linked_list_node}
end

"""
    aws_linked_list_node_reset(node)

Set node's next and prev pointers to NULL.

### Prototype
```c
AWS_STATIC_IMPL void aws_linked_list_node_reset(struct aws_linked_list_node *node);
```
"""
function aws_linked_list_node_reset(node)
    ccall((:aws_linked_list_node_reset, libawscrt), Cvoid, (Ptr{aws_linked_list_node},), node)
end

struct aws_linked_list
    head::aws_linked_list_node
    tail::aws_linked_list_node
end

"""
    aws_linked_list_empty(list)

Tests if the list is empty.

### Prototype
```c
AWS_STATIC_IMPL bool aws_linked_list_empty(const struct aws_linked_list *list);
```
"""
function aws_linked_list_empty(list)
    ccall((:aws_linked_list_empty, libawscrt), Bool, (Ptr{aws_linked_list},), list)
end

"""
    aws_linked_list_is_valid(list)

Checks that a linked list is valid.

### Prototype
```c
AWS_STATIC_IMPL bool aws_linked_list_is_valid(const struct aws_linked_list *list);
```
"""
function aws_linked_list_is_valid(list)
    ccall((:aws_linked_list_is_valid, libawscrt), Bool, (Ptr{aws_linked_list},), list)
end

"""
    aws_linked_list_node_next_is_valid(node)

Checks that the prev of the next pointer of a node points to the node. As this checks whether the [next] connection of a node is bidirectional, it returns false if used for the list tail.

### Prototype
```c
AWS_STATIC_IMPL bool aws_linked_list_node_next_is_valid(const struct aws_linked_list_node *node);
```
"""
function aws_linked_list_node_next_is_valid(node)
    ccall((:aws_linked_list_node_next_is_valid, libawscrt), Bool, (Ptr{aws_linked_list_node},), node)
end

"""
    aws_linked_list_node_prev_is_valid(node)

Checks that the next of the prev pointer of a node points to the node. Similarly to the above, this returns false if used for the head of a list.

### Prototype
```c
AWS_STATIC_IMPL bool aws_linked_list_node_prev_is_valid(const struct aws_linked_list_node *node);
```
"""
function aws_linked_list_node_prev_is_valid(node)
    ccall((:aws_linked_list_node_prev_is_valid, libawscrt), Bool, (Ptr{aws_linked_list_node},), node)
end

"""
    aws_linked_list_is_valid_deep(list)

Checks that a linked list satisfies double linked list connectivity constraints. This check is O(n) as it traverses the whole linked list to ensure that tail is reachable from head (and vice versa) and that every connection is bidirectional.

Note: This check *cannot* go into an infinite loop, because we ensure that the connection to the next node is bidirectional. Therefore, if a node's [a] a.next is a previous node [b] in the list, b.prev != &a and so this check would fail, thus terminating the loop.

### Prototype
```c
AWS_STATIC_IMPL bool aws_linked_list_is_valid_deep(const struct aws_linked_list *list);
```
"""
function aws_linked_list_is_valid_deep(list)
    ccall((:aws_linked_list_is_valid_deep, libawscrt), Bool, (Ptr{aws_linked_list},), list)
end

"""
    aws_linked_list_init(list)

Initializes the list. List will be empty after this call.

### Prototype
```c
AWS_STATIC_IMPL void aws_linked_list_init(struct aws_linked_list *list);
```
"""
function aws_linked_list_init(list)
    ccall((:aws_linked_list_init, libawscrt), Cvoid, (Ptr{aws_linked_list},), list)
end

"""
    aws_linked_list_begin(list)

Returns an iteration pointer for the first element in the list.

### Prototype
```c
AWS_STATIC_IMPL struct aws_linked_list_node *aws_linked_list_begin(const struct aws_linked_list *list);
```
"""
function aws_linked_list_begin(list)
    ccall((:aws_linked_list_begin, libawscrt), Ptr{aws_linked_list_node}, (Ptr{aws_linked_list},), list)
end

"""
    aws_linked_list_end(list)

Returns an iteration pointer for one past the last element in the list.

### Prototype
```c
AWS_STATIC_IMPL const struct aws_linked_list_node *aws_linked_list_end(const struct aws_linked_list *list);
```
"""
function aws_linked_list_end(list)
    ccall((:aws_linked_list_end, libawscrt), Ptr{aws_linked_list_node}, (Ptr{aws_linked_list},), list)
end

"""
    aws_linked_list_rbegin(list)

Returns a pointer for the last element in the list. Used to begin iterating the list in reverse. Ex: for (i = [`aws_linked_list_rbegin`](@ref)(list); i != [`aws_linked_list_rend`](@ref)(list); i = [`aws_linked_list_prev`](@ref)(i)) {...}

### Prototype
```c
AWS_STATIC_IMPL struct aws_linked_list_node *aws_linked_list_rbegin(const struct aws_linked_list *list);
```
"""
function aws_linked_list_rbegin(list)
    ccall((:aws_linked_list_rbegin, libawscrt), Ptr{aws_linked_list_node}, (Ptr{aws_linked_list},), list)
end

"""
    aws_linked_list_rend(list)

Returns the pointer to one before the first element in the list. Used to end iterating the list in reverse.

### Prototype
```c
AWS_STATIC_IMPL const struct aws_linked_list_node *aws_linked_list_rend(const struct aws_linked_list *list);
```
"""
function aws_linked_list_rend(list)
    ccall((:aws_linked_list_rend, libawscrt), Ptr{aws_linked_list_node}, (Ptr{aws_linked_list},), list)
end

"""
    aws_linked_list_next(node)

Returns the next element in the list.

### Prototype
```c
AWS_STATIC_IMPL struct aws_linked_list_node *aws_linked_list_next(const struct aws_linked_list_node *node);
```
"""
function aws_linked_list_next(node)
    ccall((:aws_linked_list_next, libawscrt), Ptr{aws_linked_list_node}, (Ptr{aws_linked_list_node},), node)
end

"""
    aws_linked_list_prev(node)

Returns the previous element in the list.

### Prototype
```c
AWS_STATIC_IMPL struct aws_linked_list_node *aws_linked_list_prev(const struct aws_linked_list_node *node);
```
"""
function aws_linked_list_prev(node)
    ccall((:aws_linked_list_prev, libawscrt), Ptr{aws_linked_list_node}, (Ptr{aws_linked_list_node},), node)
end

"""
    aws_linked_list_insert_after(after, to_add)

Inserts to\\_add immediately after after.

### Prototype
```c
AWS_STATIC_IMPL void aws_linked_list_insert_after( struct aws_linked_list_node *after, struct aws_linked_list_node *to_add);
```
"""
function aws_linked_list_insert_after(after, to_add)
    ccall((:aws_linked_list_insert_after, libawscrt), Cvoid, (Ptr{aws_linked_list_node}, Ptr{aws_linked_list_node}), after, to_add)
end

"""
    aws_linked_list_swap_nodes(a, b)

Swaps the order two nodes in the linked list.

### Prototype
```c
AWS_STATIC_IMPL void aws_linked_list_swap_nodes(struct aws_linked_list_node *a, struct aws_linked_list_node *b);
```
"""
function aws_linked_list_swap_nodes(a, b)
    ccall((:aws_linked_list_swap_nodes, libawscrt), Cvoid, (Ptr{aws_linked_list_node}, Ptr{aws_linked_list_node}), a, b)
end

"""
    aws_linked_list_insert_before(before, to_add)

Inserts to\\_add immediately before before.

### Prototype
```c
AWS_STATIC_IMPL void aws_linked_list_insert_before( struct aws_linked_list_node *before, struct aws_linked_list_node *to_add);
```
"""
function aws_linked_list_insert_before(before, to_add)
    ccall((:aws_linked_list_insert_before, libawscrt), Cvoid, (Ptr{aws_linked_list_node}, Ptr{aws_linked_list_node}), before, to_add)
end

"""
    aws_linked_list_remove(node)

Removes the specified node from the list (prev/next point to each other) and returns the next node in the list.

### Prototype
```c
AWS_STATIC_IMPL void aws_linked_list_remove(struct aws_linked_list_node *node);
```
"""
function aws_linked_list_remove(node)
    ccall((:aws_linked_list_remove, libawscrt), Cvoid, (Ptr{aws_linked_list_node},), node)
end

"""
    aws_linked_list_push_back(list, node)

Append new\\_node.

### Prototype
```c
AWS_STATIC_IMPL void aws_linked_list_push_back(struct aws_linked_list *list, struct aws_linked_list_node *node);
```
"""
function aws_linked_list_push_back(list, node)
    ccall((:aws_linked_list_push_back, libawscrt), Cvoid, (Ptr{aws_linked_list}, Ptr{aws_linked_list_node}), list, node)
end

"""
    aws_linked_list_back(list)

Returns the element in the back of the list.

### Prototype
```c
AWS_STATIC_IMPL struct aws_linked_list_node *aws_linked_list_back(const struct aws_linked_list *list);
```
"""
function aws_linked_list_back(list)
    ccall((:aws_linked_list_back, libawscrt), Ptr{aws_linked_list_node}, (Ptr{aws_linked_list},), list)
end

"""
    aws_linked_list_pop_back(list)

Returns the element in the back of the list and removes it

### Prototype
```c
AWS_STATIC_IMPL struct aws_linked_list_node *aws_linked_list_pop_back(struct aws_linked_list *list);
```
"""
function aws_linked_list_pop_back(list)
    ccall((:aws_linked_list_pop_back, libawscrt), Ptr{aws_linked_list_node}, (Ptr{aws_linked_list},), list)
end

"""
    aws_linked_list_push_front(list, node)

Prepend new\\_node.

### Prototype
```c
AWS_STATIC_IMPL void aws_linked_list_push_front(struct aws_linked_list *list, struct aws_linked_list_node *node);
```
"""
function aws_linked_list_push_front(list, node)
    ccall((:aws_linked_list_push_front, libawscrt), Cvoid, (Ptr{aws_linked_list}, Ptr{aws_linked_list_node}), list, node)
end

"""
    aws_linked_list_front(list)

Returns the element in the front of the list.

### Prototype
```c
AWS_STATIC_IMPL struct aws_linked_list_node *aws_linked_list_front(const struct aws_linked_list *list);
```
"""
function aws_linked_list_front(list)
    ccall((:aws_linked_list_front, libawscrt), Ptr{aws_linked_list_node}, (Ptr{aws_linked_list},), list)
end

"""
    aws_linked_list_pop_front(list)

Returns the element in the front of the list and removes it

### Prototype
```c
AWS_STATIC_IMPL struct aws_linked_list_node *aws_linked_list_pop_front(struct aws_linked_list *list);
```
"""
function aws_linked_list_pop_front(list)
    ccall((:aws_linked_list_pop_front, libawscrt), Ptr{aws_linked_list_node}, (Ptr{aws_linked_list},), list)
end

"""
    aws_linked_list_swap_contents(a, b)

### Prototype
```c
AWS_STATIC_IMPL void aws_linked_list_swap_contents( struct aws_linked_list *AWS_RESTRICT a, struct aws_linked_list *AWS_RESTRICT b);
```
"""
function aws_linked_list_swap_contents(a, b)
    ccall((:aws_linked_list_swap_contents, libawscrt), Cvoid, (Ptr{aws_linked_list}, Ptr{aws_linked_list}), a, b)
end

"""
    aws_linked_list_move_all_back(dst, src)

Remove all nodes from one list, and add them to the back of another.

Example: if dst={1,2} and src={3,4}, they become dst={1,2,3,4} and src={}

### Prototype
```c
AWS_STATIC_IMPL void aws_linked_list_move_all_back( struct aws_linked_list *AWS_RESTRICT dst, struct aws_linked_list *AWS_RESTRICT src);
```
"""
function aws_linked_list_move_all_back(dst, src)
    ccall((:aws_linked_list_move_all_back, libawscrt), Cvoid, (Ptr{aws_linked_list}, Ptr{aws_linked_list}), dst, src)
end

"""
    aws_linked_list_move_all_front(dst, src)

Remove all nodes from one list, and add them to the front of another.

Example: if dst={2,1} and src={4,3}, they become dst={4,3,2,1} and src={}

### Prototype
```c
AWS_STATIC_IMPL void aws_linked_list_move_all_front( struct aws_linked_list *AWS_RESTRICT dst, struct aws_linked_list *AWS_RESTRICT src);
```
"""
function aws_linked_list_move_all_front(dst, src)
    ccall((:aws_linked_list_move_all_front, libawscrt), Cvoid, (Ptr{aws_linked_list}, Ptr{aws_linked_list}), dst, src)
end

"""
    aws_atomic_var

struct [`aws_atomic_var`](@ref) represents an atomic variable - a value which can hold an integer or pointer that can be manipulated atomically. struct aws\\_atomic\\_vars should normally only be manipulated with atomics methods defined in this header.
"""
struct aws_atomic_var
    value::Ptr{Cvoid}
end

"""
    aws_atomic_load_int(var)

Reads an atomic var as an integer, using sequentially consistent ordering, and returns the result.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_atomic_load_int(volatile const struct aws_atomic_var *var);
```
"""
function aws_atomic_load_int(var)
    ccall((:aws_atomic_load_int, libawscrt), Csize_t, (Ptr{aws_atomic_var},), var)
end

"""
    aws_atomic_load_ptr(var)

Reads an atomic var as a pointer, using sequentially consistent ordering, and returns the result.

### Prototype
```c
AWS_STATIC_IMPL void *aws_atomic_load_ptr(volatile const struct aws_atomic_var *var);
```
"""
function aws_atomic_load_ptr(var)
    ccall((:aws_atomic_load_ptr, libawscrt), Ptr{Cvoid}, (Ptr{aws_atomic_var},), var)
end

"""
    aws_atomic_store_int(var, n)

Stores an integer into an atomic var, using sequentially consistent ordering.

### Prototype
```c
AWS_STATIC_IMPL void aws_atomic_store_int(volatile struct aws_atomic_var *var, size_t n);
```
"""
function aws_atomic_store_int(var, n)
    ccall((:aws_atomic_store_int, libawscrt), Cvoid, (Ptr{aws_atomic_var}, Csize_t), var, n)
end

"""
    aws_atomic_store_ptr(var, p)

Stores a pointer into an atomic var, using sequentially consistent ordering.

### Prototype
```c
AWS_STATIC_IMPL void aws_atomic_store_ptr(volatile struct aws_atomic_var *var, void *p);
```
"""
function aws_atomic_store_ptr(var, p)
    ccall((:aws_atomic_store_ptr, libawscrt), Cvoid, (Ptr{aws_atomic_var}, Ptr{Cvoid}), var, p)
end

"""
    aws_atomic_exchange_int(var, n)

Exchanges an integer with the value in an atomic\\_var, using sequentially consistent ordering. Returns the value that was previously in the atomic\\_var.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_atomic_exchange_int(volatile struct aws_atomic_var *var, size_t n);
```
"""
function aws_atomic_exchange_int(var, n)
    ccall((:aws_atomic_exchange_int, libawscrt), Csize_t, (Ptr{aws_atomic_var}, Csize_t), var, n)
end

"""
    aws_atomic_exchange_ptr(var, p)

Exchanges an integer with the value in an atomic\\_var, using sequentially consistent ordering. Returns the value that was previously in the atomic\\_var.

### Prototype
```c
AWS_STATIC_IMPL void *aws_atomic_exchange_ptr(volatile struct aws_atomic_var *var, void *p);
```
"""
function aws_atomic_exchange_ptr(var, p)
    ccall((:aws_atomic_exchange_ptr, libawscrt), Ptr{Cvoid}, (Ptr{aws_atomic_var}, Ptr{Cvoid}), var, p)
end

"""
    aws_atomic_compare_exchange_int(var, expected, desired)

Atomically compares *var to *expected; if they are equal, atomically sets *var = desired. Otherwise, *expected is set to the value in *var. Uses sequentially consistent memory ordering, regardless of success or failure. Returns true if the compare was successful and the variable updated to desired.

### Prototype
```c
AWS_STATIC_IMPL bool aws_atomic_compare_exchange_int(volatile struct aws_atomic_var *var, size_t *expected, size_t desired);
```
"""
function aws_atomic_compare_exchange_int(var, expected, desired)
    ccall((:aws_atomic_compare_exchange_int, libawscrt), Bool, (Ptr{aws_atomic_var}, Ptr{Csize_t}, Csize_t), var, expected, desired)
end

"""
    aws_atomic_compare_exchange_ptr(var, expected, desired)

Atomically compares *var to *expected; if they are equal, atomically sets *var = desired. Otherwise, *expected is set to the value in *var. Uses sequentially consistent memory ordering, regardless of success or failure. Returns true if the compare was successful and the variable updated to desired.

### Prototype
```c
AWS_STATIC_IMPL bool aws_atomic_compare_exchange_ptr(volatile struct aws_atomic_var *var, void **expected, void *desired);
```
"""
function aws_atomic_compare_exchange_ptr(var, expected, desired)
    ccall((:aws_atomic_compare_exchange_ptr, libawscrt), Bool, (Ptr{aws_atomic_var}, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}), var, expected, desired)
end

"""
    aws_atomic_fetch_add(var, n)

Atomically adds n to *var, and returns the previous value of *var. Uses sequentially consistent ordering.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_atomic_fetch_add(volatile struct aws_atomic_var *var, size_t n);
```
"""
function aws_atomic_fetch_add(var, n)
    ccall((:aws_atomic_fetch_add, libawscrt), Csize_t, (Ptr{aws_atomic_var}, Csize_t), var, n)
end

"""
    aws_atomic_fetch_sub(var, n)

Atomically subtracts n from *var, and returns the previous value of *var. Uses sequentially consistent ordering.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_atomic_fetch_sub(volatile struct aws_atomic_var *var, size_t n);
```
"""
function aws_atomic_fetch_sub(var, n)
    ccall((:aws_atomic_fetch_sub, libawscrt), Csize_t, (Ptr{aws_atomic_var}, Csize_t), var, n)
end

"""
    aws_atomic_fetch_and(var, n)

Atomically ands n into *var, and returns the previous value of *var. Uses sequentially consistent ordering.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_atomic_fetch_and(volatile struct aws_atomic_var *var, size_t n);
```
"""
function aws_atomic_fetch_and(var, n)
    ccall((:aws_atomic_fetch_and, libawscrt), Csize_t, (Ptr{aws_atomic_var}, Csize_t), var, n)
end

"""
    aws_atomic_fetch_or(var, n)

Atomically ors n into *var, and returns the previous value of *var. Uses sequentially consistent ordering.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_atomic_fetch_or(volatile struct aws_atomic_var *var, size_t n);
```
"""
function aws_atomic_fetch_or(var, n)
    ccall((:aws_atomic_fetch_or, libawscrt), Csize_t, (Ptr{aws_atomic_var}, Csize_t), var, n)
end

"""
    aws_atomic_fetch_xor(var, n)

Atomically xors n into *var, and returns the previous value of *var. Uses sequentially consistent ordering.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_atomic_fetch_xor(volatile struct aws_atomic_var *var, size_t n);
```
"""
function aws_atomic_fetch_xor(var, n)
    ccall((:aws_atomic_fetch_xor, libawscrt), Csize_t, (Ptr{aws_atomic_var}, Csize_t), var, n)
end

const aws_atomic_impl_int_t = Csize_t

@cenum aws_memory_order::UInt32 begin
    aws_memory_order_relaxed = 0
    aws_memory_order_acquire = 2
    aws_memory_order_release = 3
    aws_memory_order_acq_rel = 4
    aws_memory_order_seq_cst = 5
end

"""
    aws_atomic_priv_xlate_order(order)

### Prototype
```c
static inline int aws_atomic_priv_xlate_order(enum aws_memory_order order);
```
"""
function aws_atomic_priv_xlate_order(order)
    ccall((:aws_atomic_priv_xlate_order, libawscrt), Cint, (aws_memory_order,), order)
end

"""
    aws_atomic_init_int(var, n)

Initializes an atomic variable with an integer value. This operation should be done before any other operations on this atomic variable, and must be done before attempting any parallel operations.

### Prototype
```c
AWS_STATIC_IMPL void aws_atomic_init_int(volatile struct aws_atomic_var *var, size_t n);
```
"""
function aws_atomic_init_int(var, n)
    ccall((:aws_atomic_init_int, libawscrt), Cvoid, (Ptr{aws_atomic_var}, Csize_t), var, n)
end

"""
    aws_atomic_init_ptr(var, p)

Initializes an atomic variable with a pointer value. This operation should be done before any other operations on this atomic variable, and must be done before attempting any parallel operations.

### Prototype
```c
AWS_STATIC_IMPL void aws_atomic_init_ptr(volatile struct aws_atomic_var *var, void *p);
```
"""
function aws_atomic_init_ptr(var, p)
    ccall((:aws_atomic_init_ptr, libawscrt), Cvoid, (Ptr{aws_atomic_var}, Ptr{Cvoid}), var, p)
end

"""
    aws_atomic_load_int_explicit(var, memory_order)

Reads an atomic var as an integer, using the specified ordering, and returns the result.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_atomic_load_int_explicit(volatile const struct aws_atomic_var *var, enum aws_memory_order memory_order);
```
"""
function aws_atomic_load_int_explicit(var, memory_order)
    ccall((:aws_atomic_load_int_explicit, libawscrt), Csize_t, (Ptr{aws_atomic_var}, aws_memory_order), var, memory_order)
end

"""
    aws_atomic_load_ptr_explicit(var, memory_order)

Reads an atomic var as a pointer, using the specified ordering, and returns the result.

### Prototype
```c
AWS_STATIC_IMPL void *aws_atomic_load_ptr_explicit(volatile const struct aws_atomic_var *var, enum aws_memory_order memory_order);
```
"""
function aws_atomic_load_ptr_explicit(var, memory_order)
    ccall((:aws_atomic_load_ptr_explicit, libawscrt), Ptr{Cvoid}, (Ptr{aws_atomic_var}, aws_memory_order), var, memory_order)
end

"""
    aws_atomic_store_int_explicit(var, n, memory_order)

Stores an integer into an atomic var, using the specified ordering.

### Prototype
```c
AWS_STATIC_IMPL void aws_atomic_store_int_explicit(volatile struct aws_atomic_var *var, size_t n, enum aws_memory_order memory_order);
```
"""
function aws_atomic_store_int_explicit(var, n, memory_order)
    ccall((:aws_atomic_store_int_explicit, libawscrt), Cvoid, (Ptr{aws_atomic_var}, Csize_t, aws_memory_order), var, n, memory_order)
end

"""
    aws_atomic_store_ptr_explicit(var, p, memory_order)

Stores an pointer into an atomic var, using the specified ordering.

### Prototype
```c
AWS_STATIC_IMPL void aws_atomic_store_ptr_explicit(volatile struct aws_atomic_var *var, void *p, enum aws_memory_order memory_order);
```
"""
function aws_atomic_store_ptr_explicit(var, p, memory_order)
    ccall((:aws_atomic_store_ptr_explicit, libawscrt), Cvoid, (Ptr{aws_atomic_var}, Ptr{Cvoid}, aws_memory_order), var, p, memory_order)
end

"""
    aws_atomic_exchange_int_explicit(var, n, memory_order)

Exchanges an integer with the value in an atomic\\_var, using the specified ordering. Returns the value that was previously in the atomic\\_var.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_atomic_exchange_int_explicit( volatile struct aws_atomic_var *var, size_t n, enum aws_memory_order memory_order);
```
"""
function aws_atomic_exchange_int_explicit(var, n, memory_order)
    ccall((:aws_atomic_exchange_int_explicit, libawscrt), Csize_t, (Ptr{aws_atomic_var}, Csize_t, aws_memory_order), var, n, memory_order)
end

"""
    aws_atomic_exchange_ptr_explicit(var, p, memory_order)

Exchanges a pointer with the value in an atomic\\_var, using the specified ordering. Returns the value that was previously in the atomic\\_var.

### Prototype
```c
AWS_STATIC_IMPL void *aws_atomic_exchange_ptr_explicit( volatile struct aws_atomic_var *var, void *p, enum aws_memory_order memory_order);
```
"""
function aws_atomic_exchange_ptr_explicit(var, p, memory_order)
    ccall((:aws_atomic_exchange_ptr_explicit, libawscrt), Ptr{Cvoid}, (Ptr{aws_atomic_var}, Ptr{Cvoid}, aws_memory_order), var, p, memory_order)
end

"""
    aws_atomic_compare_exchange_int_explicit(var, expected, desired, order_success, order_failure)

Atomically compares *var to *expected; if they are equal, atomically sets *var = desired. Otherwise, *expected is set to the value in *var. On success, the memory ordering used was order\\_success; otherwise, it was order\\_failure. order\\_failure must be no stronger than order\\_success, and must not be release or acq\\_rel.

### Prototype
```c
AWS_STATIC_IMPL bool aws_atomic_compare_exchange_int_explicit( volatile struct aws_atomic_var *var, size_t *expected, size_t desired, enum aws_memory_order order_success, enum aws_memory_order order_failure);
```
"""
function aws_atomic_compare_exchange_int_explicit(var, expected, desired, order_success, order_failure)
    ccall((:aws_atomic_compare_exchange_int_explicit, libawscrt), Bool, (Ptr{aws_atomic_var}, Ptr{Csize_t}, Csize_t, aws_memory_order, aws_memory_order), var, expected, desired, order_success, order_failure)
end

"""
    aws_atomic_compare_exchange_ptr_explicit(var, expected, desired, order_success, order_failure)

Atomically compares *var to *expected; if they are equal, atomically sets *var = desired. Otherwise, *expected is set to the value in *var. On success, the memory ordering used was order\\_success; otherwise, it was order\\_failure. order\\_failure must be no stronger than order\\_success, and must not be release or acq\\_rel.

### Prototype
```c
AWS_STATIC_IMPL bool aws_atomic_compare_exchange_ptr_explicit( volatile struct aws_atomic_var *var, void **expected, void *desired, enum aws_memory_order order_success, enum aws_memory_order order_failure);
```
"""
function aws_atomic_compare_exchange_ptr_explicit(var, expected, desired, order_success, order_failure)
    ccall((:aws_atomic_compare_exchange_ptr_explicit, libawscrt), Bool, (Ptr{aws_atomic_var}, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, aws_memory_order, aws_memory_order), var, expected, desired, order_success, order_failure)
end

"""
    aws_atomic_fetch_add_explicit(var, n, order)

Atomically adds n to *var, and returns the previous value of *var.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_atomic_fetch_add_explicit(volatile struct aws_atomic_var *var, size_t n, enum aws_memory_order order);
```
"""
function aws_atomic_fetch_add_explicit(var, n, order)
    ccall((:aws_atomic_fetch_add_explicit, libawscrt), Csize_t, (Ptr{aws_atomic_var}, Csize_t, aws_memory_order), var, n, order)
end

"""
    aws_atomic_fetch_sub_explicit(var, n, order)

Atomically subtracts n from *var, and returns the previous value of *var.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_atomic_fetch_sub_explicit(volatile struct aws_atomic_var *var, size_t n, enum aws_memory_order order);
```
"""
function aws_atomic_fetch_sub_explicit(var, n, order)
    ccall((:aws_atomic_fetch_sub_explicit, libawscrt), Csize_t, (Ptr{aws_atomic_var}, Csize_t, aws_memory_order), var, n, order)
end

"""
    aws_atomic_fetch_or_explicit(var, n, order)

Atomically ORs n with *var, and returns the previous value of *var.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_atomic_fetch_or_explicit(volatile struct aws_atomic_var *var, size_t n, enum aws_memory_order order);
```
"""
function aws_atomic_fetch_or_explicit(var, n, order)
    ccall((:aws_atomic_fetch_or_explicit, libawscrt), Csize_t, (Ptr{aws_atomic_var}, Csize_t, aws_memory_order), var, n, order)
end

"""
    aws_atomic_fetch_and_explicit(var, n, order)

Atomically ANDs n with *var, and returns the previous value of *var.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_atomic_fetch_and_explicit(volatile struct aws_atomic_var *var, size_t n, enum aws_memory_order order);
```
"""
function aws_atomic_fetch_and_explicit(var, n, order)
    ccall((:aws_atomic_fetch_and_explicit, libawscrt), Csize_t, (Ptr{aws_atomic_var}, Csize_t, aws_memory_order), var, n, order)
end

"""
    aws_atomic_fetch_xor_explicit(var, n, order)

Atomically XORs n with *var, and returns the previous value of *var.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_atomic_fetch_xor_explicit(volatile struct aws_atomic_var *var, size_t n, enum aws_memory_order order);
```
"""
function aws_atomic_fetch_xor_explicit(var, n, order)
    ccall((:aws_atomic_fetch_xor_explicit, libawscrt), Csize_t, (Ptr{aws_atomic_var}, Csize_t, aws_memory_order), var, n, order)
end

"""
    aws_atomic_thread_fence(order)

Provides the same reordering guarantees as an atomic operation with the specified memory order, without needing to actually perform an atomic operation.

### Prototype
```c
AWS_STATIC_IMPL void aws_atomic_thread_fence(enum aws_memory_order order);
```
"""
function aws_atomic_thread_fence(order)
    ccall((:aws_atomic_thread_fence, libawscrt), Cvoid, (aws_memory_order,), order)
end

"""
    aws_auth_errors

Auth-specific error codes
"""
@cenum aws_auth_errors::UInt32 begin
    AWS_AUTH_PROFILE_PARSE_RECOVERABLE_ERROR = 15362
    AWS_AUTH_PROFILE_PARSE_FATAL_ERROR = 15361
    AWS_AUTH_SIGNING_UNSUPPORTED_ALGORITHM = 6144
    AWS_AUTH_SIGNING_MISMATCHED_CONFIGURATION = 6145
    AWS_AUTH_SIGNING_NO_CREDENTIALS = 6146
    AWS_AUTH_SIGNING_ILLEGAL_REQUEST_QUERY_PARAM = 6147
    AWS_AUTH_SIGNING_ILLEGAL_REQUEST_HEADER = 6148
    AWS_AUTH_SIGNING_INVALID_CONFIGURATION = 6149
    AWS_AUTH_CREDENTIALS_PROVIDER_INVALID_ENVIRONMENT = 6150
    AWS_AUTH_CREDENTIALS_PROVIDER_INVALID_DELEGATE = 6151
    AWS_AUTH_CREDENTIALS_PROVIDER_PROFILE_SOURCE_FAILURE = 6152
    AWS_AUTH_CREDENTIALS_PROVIDER_IMDS_SOURCE_FAILURE = 6153
    AWS_AUTH_CREDENTIALS_PROVIDER_STS_SOURCE_FAILURE = 6154
    AWS_AUTH_CREDENTIALS_PROVIDER_HTTP_STATUS_FAILURE = 6155
    AWS_AUTH_PROVIDER_PARSER_UNEXPECTED_RESPONSE = 6156
    AWS_AUTH_CREDENTIALS_PROVIDER_ECS_SOURCE_FAILURE = 6157
    AWS_AUTH_CREDENTIALS_PROVIDER_X509_SOURCE_FAILURE = 6158
    AWS_AUTH_CREDENTIALS_PROVIDER_PROCESS_SOURCE_FAILURE = 6159
    AWS_AUTH_CREDENTIALS_PROVIDER_STS_WEB_IDENTITY_SOURCE_FAILURE = 6160
    AWS_AUTH_SIGNING_UNSUPPORTED_SIGNATURE_TYPE = 6161
    AWS_AUTH_SIGNING_MISSING_PREVIOUS_SIGNATURE = 6162
    AWS_AUTH_SIGNING_INVALID_CREDENTIALS = 6163
    AWS_AUTH_CANONICAL_REQUEST_MISMATCH = 6164
    AWS_AUTH_SIGV4A_SIGNATURE_VALIDATION_FAILURE = 6165
    AWS_AUTH_ERROR_END_RANGE = 7167
end

"""
    aws_auth_log_subject

Auth-specific logging subjects
"""
@cenum aws_auth_log_subject::UInt32 begin
    AWS_LS_AUTH_GENERAL = 6144
    AWS_LS_AUTH_PROFILE = 6145
    AWS_LS_AUTH_CREDENTIALS_PROVIDER = 6146
    AWS_LS_AUTH_SIGNING = 6147
    AWS_LS_IMDS_CLIENT = 6148
    AWS_LS_AUTH_LAST = 7167
end

"""
    aws_auth_library_init(allocator)

Initializes internal datastructures used by aws-c-auth. Must be called before using any functionality in aws-c-auth.

### Parameters
* `allocator`: memory allocator to use for any module-level memory allocation
### Prototype
```c
void aws_auth_library_init(struct aws_allocator *allocator);
```
"""
function aws_auth_library_init(allocator)
    ccall((:aws_auth_library_init, libawscrt), Cvoid, (Ptr{aws_allocator},), allocator)
end

"""
    aws_auth_library_clean_up()

Clean up internal datastructures used by aws-c-auth. Must not be called until application is done using functionality in aws-c-auth.

### Prototype
```c
void aws_auth_library_clean_up(void);
```
"""
function aws_auth_library_clean_up()
    ccall((:aws_auth_library_clean_up, libawscrt), Cvoid, ())
end

# typedef void ( aws_imds_client_shutdown_completed_fn ) ( void * user_data )
const aws_imds_client_shutdown_completed_fn = Cvoid

"""
    aws_imds_client_shutdown_options

Optional callback and user data to be invoked when an imds client has fully shut down
"""
struct aws_imds_client_shutdown_options
    shutdown_callback::Ptr{Cvoid}
    shutdown_user_data::Ptr{Cvoid}
end

struct aws_ref_count
    ref_count::aws_atomic_var
    object::Ptr{Cvoid}
    on_zero_fn::Ptr{Cvoid}
end

struct aws_shutdown_callback_options
    shutdown_callback_fn::Ptr{Cvoid}
    shutdown_callback_user_data::Ptr{Cvoid}
end

struct aws_event_loop_group
    allocator::Ptr{aws_allocator}
    event_loops::aws_array_list
    ref_count::aws_ref_count
    shutdown_options::aws_shutdown_callback_options
end

"""
    aws_host_resolver_vtable

should you absolutely disdain the default implementation, feel free to implement your own.
"""
struct aws_host_resolver_vtable
    destroy::Ptr{Cvoid}
    resolve_host::Ptr{Cvoid}
    record_connection_failure::Ptr{Cvoid}
    purge_cache::Ptr{Cvoid}
    get_host_address_count::Ptr{Cvoid}
    add_host_listener::Ptr{Cvoid}
    remove_host_listener::Ptr{Cvoid}
end

struct aws_host_resolver
    allocator::Ptr{aws_allocator}
    impl::Ptr{Cvoid}
    vtable::Ptr{aws_host_resolver_vtable}
    ref_count::aws_ref_count
    shutdown_options::aws_shutdown_callback_options
end

struct aws_host_resolution_config
    impl::Ptr{Cvoid}
    max_ttl::Csize_t
    impl_data::Ptr{Cvoid}
end

"""
    aws_client_bootstrap

[`aws_client_bootstrap`](@ref) handles creation and setup of channels that communicate via socket with a specific endpoint.
"""
struct aws_client_bootstrap
    allocator::Ptr{aws_allocator}
    event_loop_group::Ptr{aws_event_loop_group}
    host_resolver::Ptr{aws_host_resolver}
    host_resolver_config::aws_host_resolution_config
    on_protocol_negotiated::Ptr{Cvoid}
    ref_count::aws_ref_count
    on_shutdown_complete::Ptr{Cvoid}
    user_data::Ptr{Cvoid}
end

struct aws_retry_strategy_vtable
    destroy::Ptr{Cvoid}
    acquire_token::Ptr{Cvoid}
    schedule_retry::Ptr{Cvoid}
    record_success::Ptr{Cvoid}
    release_token::Ptr{Cvoid}
end

struct aws_retry_strategy
    allocator::Ptr{aws_allocator}
    vtable::Ptr{aws_retry_strategy_vtable}
    ref_count::aws_atomic_var
    impl::Ptr{Cvoid}
end

@cenum aws_imds_protocol_version::UInt32 begin
    IMDS_PROTOCOL_V2 = 0
    IMDS_PROTOCOL_V1 = 1
end

mutable struct aws_auth_http_system_vtable end

"""
    aws_imds_client_options

Configuration options when creating an imds client
"""
struct aws_imds_client_options
    shutdown_options::aws_imds_client_shutdown_options
    bootstrap::Ptr{aws_client_bootstrap}
    retry_strategy::Ptr{aws_retry_strategy}
    imds_version::aws_imds_protocol_version
    function_table::Ptr{aws_auth_http_system_vtable}
end

# typedef void ( aws_imds_client_on_get_resource_callback_fn ) ( const struct aws_byte_buf * resource , int error_code , void * user_data )
const aws_imds_client_on_get_resource_callback_fn = Cvoid

struct aws_date_time
    timestamp::time_t
    milliseconds::UInt16
    tz::NTuple{6, Cchar}
    gmt_time::tm
    local_time::tm
    utc_assumed::Bool
end

"""
    aws_byte_cursor

Represents a movable pointer within a larger binary string or buffer.

This structure is used to define buffers for reading.
"""
struct aws_byte_cursor
    len::Csize_t
    ptr::Ptr{UInt8}
end

"""
    aws_imds_iam_profile

https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instancedata-data-categories.html
"""
struct aws_imds_iam_profile
    last_updated::aws_date_time
    instance_profile_arn::aws_byte_cursor
    instance_profile_id::aws_byte_cursor
end

"""
    aws_imds_instance_info

Block of per-instance EC2-specific data

https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-identity-documents.html
"""
struct aws_imds_instance_info
    marketplace_product_codes::aws_array_list
    availability_zone::aws_byte_cursor
    private_ip::aws_byte_cursor
    version::aws_byte_cursor
    instance_id::aws_byte_cursor
    billing_products::aws_array_list
    instance_type::aws_byte_cursor
    account_id::aws_byte_cursor
    image_id::aws_byte_cursor
    pending_time::aws_date_time
    architecture::aws_byte_cursor
    kernel_id::aws_byte_cursor
    ramdisk_id::aws_byte_cursor
    region::aws_byte_cursor
end

# typedef void ( aws_imds_client_on_get_array_callback_fn ) ( const struct aws_array_list * array , int error_code , void * user_data )
const aws_imds_client_on_get_array_callback_fn = Cvoid

# typedef void ( aws_imds_client_on_get_credentials_callback_fn ) ( const struct aws_credentials * credentials , int error_code , void * user_data )
const aws_imds_client_on_get_credentials_callback_fn = Cvoid

# typedef void ( aws_imds_client_on_get_iam_profile_callback_fn ) ( const struct aws_imds_iam_profile * iam_profile_info , int error_code , void * user_data )
const aws_imds_client_on_get_iam_profile_callback_fn = Cvoid

# typedef void ( aws_imds_client_on_get_instance_info_callback_fn ) ( const struct aws_imds_instance_info * instance_info , int error_code , void * user_data )
const aws_imds_client_on_get_instance_info_callback_fn = Cvoid

"""
AWS EC2 Metadata Client is used to retrieve AWS EC2 Instance Metadata info.
"""
mutable struct aws_imds_client end

"""
    aws_imds_client_new(allocator, options)

Creates a new imds client

### Parameters
* `allocator`: memory allocator to use for creation and queries
* `options`: configuration options for the imds client
### Returns
a newly-constructed imds client, or NULL on failure
### Prototype
```c
struct aws_imds_client *aws_imds_client_new( struct aws_allocator *allocator, const struct aws_imds_client_options *options);
```
"""
function aws_imds_client_new(allocator, options)
    ccall((:aws_imds_client_new, libawscrt), Ptr{aws_imds_client}, (Ptr{aws_allocator}, Ptr{aws_imds_client_options}), allocator, options)
end

"""
    aws_imds_client_acquire(client)

Increments the ref count on the client

### Parameters
* `client`: imds client to acquire a reference to
### Prototype
```c
void aws_imds_client_acquire(struct aws_imds_client *client);
```
"""
function aws_imds_client_acquire(client)
    ccall((:aws_imds_client_acquire, libawscrt), Cvoid, (Ptr{aws_imds_client},), client)
end

"""
    aws_imds_client_release(client)

Decrements the ref count on the client

### Parameters
* `client`: imds client to release a reference to
### Prototype
```c
void aws_imds_client_release(struct aws_imds_client *client);
```
"""
function aws_imds_client_release(client)
    ccall((:aws_imds_client_release, libawscrt), Cvoid, (Ptr{aws_imds_client},), client)
end

"""
    aws_imds_client_get_resource_async(client, resource_path, callback, user_data)

Queries a generic resource (string) from the ec2 instance metadata document

### Parameters
* `client`: imds client to use for the query
* `resource_path`: path of the resource to query
* `callback`: callback function to invoke on query success or failure
* `user_data`: opaque data to invoke the completion callback with
### Returns
[`AWS_OP_SUCCESS`](@ref) if the query was successfully started, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_imds_client_get_resource_async( struct aws_imds_client *client, struct aws_byte_cursor resource_path, aws_imds_client_on_get_resource_callback_fn callback, void *user_data);
```
"""
function aws_imds_client_get_resource_async(client, resource_path, callback, user_data)
    ccall((:aws_imds_client_get_resource_async, libawscrt), Cint, (Ptr{aws_imds_client}, aws_byte_cursor, aws_imds_client_on_get_resource_callback_fn, Ptr{Cvoid}), client, resource_path, callback, user_data)
end

"""
    aws_imds_client_get_ami_id(client, callback, user_data)

Gets the ami id of the ec2 instance from the instance metadata document

### Parameters
* `client`: imds client to use for the query
* `callback`: callback function to invoke on query success or failure
* `user_data`: opaque data to invoke the completion callback with
### Returns
[`AWS_OP_SUCCESS`](@ref) if the query was successfully started, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_imds_client_get_ami_id( struct aws_imds_client *client, aws_imds_client_on_get_resource_callback_fn callback, void *user_data);
```
"""
function aws_imds_client_get_ami_id(client, callback, user_data)
    ccall((:aws_imds_client_get_ami_id, libawscrt), Cint, (Ptr{aws_imds_client}, aws_imds_client_on_get_resource_callback_fn, Ptr{Cvoid}), client, callback, user_data)
end

"""
    aws_imds_client_get_ami_launch_index(client, callback, user_data)

Gets the ami launch index of the ec2 instance from the instance metadata document

### Parameters
* `client`: imds client to use for the query
* `callback`: callback function to invoke on query success or failure
* `user_data`: opaque data to invoke the completion callback with
### Returns
[`AWS_OP_SUCCESS`](@ref) if the query was successfully started, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_imds_client_get_ami_launch_index( struct aws_imds_client *client, aws_imds_client_on_get_resource_callback_fn callback, void *user_data);
```
"""
function aws_imds_client_get_ami_launch_index(client, callback, user_data)
    ccall((:aws_imds_client_get_ami_launch_index, libawscrt), Cint, (Ptr{aws_imds_client}, aws_imds_client_on_get_resource_callback_fn, Ptr{Cvoid}), client, callback, user_data)
end

"""
    aws_imds_client_get_ami_manifest_path(client, callback, user_data)

Gets the ami manifest path of the ec2 instance from the instance metadata document

### Parameters
* `client`: imds client to use for the query
* `callback`: callback function to invoke on query success or failure
* `user_data`: opaque data to invoke the completion callback with
### Returns
[`AWS_OP_SUCCESS`](@ref) if the query was successfully started, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_imds_client_get_ami_manifest_path( struct aws_imds_client *client, aws_imds_client_on_get_resource_callback_fn callback, void *user_data);
```
"""
function aws_imds_client_get_ami_manifest_path(client, callback, user_data)
    ccall((:aws_imds_client_get_ami_manifest_path, libawscrt), Cint, (Ptr{aws_imds_client}, aws_imds_client_on_get_resource_callback_fn, Ptr{Cvoid}), client, callback, user_data)
end

"""
    aws_imds_client_get_ancestor_ami_ids(client, callback, user_data)

Gets the list of ancestor ami ids of the ec2 instance from the instance metadata document

### Parameters
* `client`: imds client to use for the query
* `callback`: callback function to invoke on query success or failure
* `user_data`: opaque data to invoke the completion callback with
### Returns
[`AWS_OP_SUCCESS`](@ref) if the query was successfully started, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_imds_client_get_ancestor_ami_ids( struct aws_imds_client *client, aws_imds_client_on_get_array_callback_fn callback, void *user_data);
```
"""
function aws_imds_client_get_ancestor_ami_ids(client, callback, user_data)
    ccall((:aws_imds_client_get_ancestor_ami_ids, libawscrt), Cint, (Ptr{aws_imds_client}, aws_imds_client_on_get_array_callback_fn, Ptr{Cvoid}), client, callback, user_data)
end

"""
    aws_imds_client_get_instance_action(client, callback, user_data)

Gets the instance-action of the ec2 instance from the instance metadata document

### Parameters
* `client`: imds client to use for the query
* `callback`: callback function to invoke on query success or failure
* `user_data`: opaque data to invoke the completion callback with
### Returns
[`AWS_OP_SUCCESS`](@ref) if the query was successfully started, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_imds_client_get_instance_action( struct aws_imds_client *client, aws_imds_client_on_get_resource_callback_fn callback, void *user_data);
```
"""
function aws_imds_client_get_instance_action(client, callback, user_data)
    ccall((:aws_imds_client_get_instance_action, libawscrt), Cint, (Ptr{aws_imds_client}, aws_imds_client_on_get_resource_callback_fn, Ptr{Cvoid}), client, callback, user_data)
end

"""
    aws_imds_client_get_instance_id(client, callback, user_data)

Gets the instance id of the ec2 instance from the instance metadata document

### Parameters
* `client`: imds client to use for the query
* `callback`: callback function to invoke on query success or failure
* `user_data`: opaque data to invoke the completion callback with
### Returns
[`AWS_OP_SUCCESS`](@ref) if the query was successfully started, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_imds_client_get_instance_id( struct aws_imds_client *client, aws_imds_client_on_get_resource_callback_fn callback, void *user_data);
```
"""
function aws_imds_client_get_instance_id(client, callback, user_data)
    ccall((:aws_imds_client_get_instance_id, libawscrt), Cint, (Ptr{aws_imds_client}, aws_imds_client_on_get_resource_callback_fn, Ptr{Cvoid}), client, callback, user_data)
end

"""
    aws_imds_client_get_instance_type(client, callback, user_data)

Gets the instance type of the ec2 instance from the instance metadata document

### Parameters
* `client`: imds client to use for the query
* `callback`: callback function to invoke on query success or failure
* `user_data`: opaque data to invoke the completion callback with
### Returns
[`AWS_OP_SUCCESS`](@ref) if the query was successfully started, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_imds_client_get_instance_type( struct aws_imds_client *client, aws_imds_client_on_get_resource_callback_fn callback, void *user_data);
```
"""
function aws_imds_client_get_instance_type(client, callback, user_data)
    ccall((:aws_imds_client_get_instance_type, libawscrt), Cint, (Ptr{aws_imds_client}, aws_imds_client_on_get_resource_callback_fn, Ptr{Cvoid}), client, callback, user_data)
end

"""
    aws_imds_client_get_mac_address(client, callback, user_data)

Gets the mac address of the ec2 instance from the instance metadata document

### Parameters
* `client`: imds client to use for the query
* `callback`: callback function to invoke on query success or failure
* `user_data`: opaque data to invoke the completion callback with
### Returns
[`AWS_OP_SUCCESS`](@ref) if the query was successfully started, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_imds_client_get_mac_address( struct aws_imds_client *client, aws_imds_client_on_get_resource_callback_fn callback, void *user_data);
```
"""
function aws_imds_client_get_mac_address(client, callback, user_data)
    ccall((:aws_imds_client_get_mac_address, libawscrt), Cint, (Ptr{aws_imds_client}, aws_imds_client_on_get_resource_callback_fn, Ptr{Cvoid}), client, callback, user_data)
end

"""
    aws_imds_client_get_private_ip_address(client, callback, user_data)

Gets the private ip address of the ec2 instance from the instance metadata document

### Parameters
* `client`: imds client to use for the query
* `callback`: callback function to invoke on query success or failure
* `user_data`: opaque data to invoke the completion callback with
### Returns
[`AWS_OP_SUCCESS`](@ref) if the query was successfully started, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_imds_client_get_private_ip_address( struct aws_imds_client *client, aws_imds_client_on_get_resource_callback_fn callback, void *user_data);
```
"""
function aws_imds_client_get_private_ip_address(client, callback, user_data)
    ccall((:aws_imds_client_get_private_ip_address, libawscrt), Cint, (Ptr{aws_imds_client}, aws_imds_client_on_get_resource_callback_fn, Ptr{Cvoid}), client, callback, user_data)
end

"""
    aws_imds_client_get_availability_zone(client, callback, user_data)

Gets the availability zone of the ec2 instance from the instance metadata document

### Parameters
* `client`: imds client to use for the query
* `callback`: callback function to invoke on query success or failure
* `user_data`: opaque data to invoke the completion callback with
### Returns
[`AWS_OP_SUCCESS`](@ref) if the query was successfully started, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_imds_client_get_availability_zone( struct aws_imds_client *client, aws_imds_client_on_get_resource_callback_fn callback, void *user_data);
```
"""
function aws_imds_client_get_availability_zone(client, callback, user_data)
    ccall((:aws_imds_client_get_availability_zone, libawscrt), Cint, (Ptr{aws_imds_client}, aws_imds_client_on_get_resource_callback_fn, Ptr{Cvoid}), client, callback, user_data)
end

"""
    aws_imds_client_get_product_codes(client, callback, user_data)

Gets the product codes of the ec2 instance from the instance metadata document

### Parameters
* `client`: imds client to use for the query
* `callback`: callback function to invoke on query success or failure
* `user_data`: opaque data to invoke the completion callback with
### Returns
[`AWS_OP_SUCCESS`](@ref) if the query was successfully started, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_imds_client_get_product_codes( struct aws_imds_client *client, aws_imds_client_on_get_resource_callback_fn callback, void *user_data);
```
"""
function aws_imds_client_get_product_codes(client, callback, user_data)
    ccall((:aws_imds_client_get_product_codes, libawscrt), Cint, (Ptr{aws_imds_client}, aws_imds_client_on_get_resource_callback_fn, Ptr{Cvoid}), client, callback, user_data)
end

"""
    aws_imds_client_get_public_key(client, callback, user_data)

Gets the public key of the ec2 instance from the instance metadata document

### Parameters
* `client`: imds client to use for the query
* `callback`: callback function to invoke on query success or failure
* `user_data`: opaque data to invoke the completion callback with
### Returns
[`AWS_OP_SUCCESS`](@ref) if the query was successfully started, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_imds_client_get_public_key( struct aws_imds_client *client, aws_imds_client_on_get_resource_callback_fn callback, void *user_data);
```
"""
function aws_imds_client_get_public_key(client, callback, user_data)
    ccall((:aws_imds_client_get_public_key, libawscrt), Cint, (Ptr{aws_imds_client}, aws_imds_client_on_get_resource_callback_fn, Ptr{Cvoid}), client, callback, user_data)
end

"""
    aws_imds_client_get_ramdisk_id(client, callback, user_data)

Gets the ramdisk id of the ec2 instance from the instance metadata document

### Parameters
* `client`: imds client to use for the query
* `callback`: callback function to invoke on query success or failure
* `user_data`: opaque data to invoke the completion callback with
### Returns
[`AWS_OP_SUCCESS`](@ref) if the query was successfully started, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_imds_client_get_ramdisk_id( struct aws_imds_client *client, aws_imds_client_on_get_resource_callback_fn callback, void *user_data);
```
"""
function aws_imds_client_get_ramdisk_id(client, callback, user_data)
    ccall((:aws_imds_client_get_ramdisk_id, libawscrt), Cint, (Ptr{aws_imds_client}, aws_imds_client_on_get_resource_callback_fn, Ptr{Cvoid}), client, callback, user_data)
end

"""
    aws_imds_client_get_reservation_id(client, callback, user_data)

Gets the reservation id of the ec2 instance from the instance metadata document

### Parameters
* `client`: imds client to use for the query
* `callback`: callback function to invoke on query success or failure
* `user_data`: opaque data to invoke the completion callback with
### Returns
[`AWS_OP_SUCCESS`](@ref) if the query was successfully started, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_imds_client_get_reservation_id( struct aws_imds_client *client, aws_imds_client_on_get_resource_callback_fn callback, void *user_data);
```
"""
function aws_imds_client_get_reservation_id(client, callback, user_data)
    ccall((:aws_imds_client_get_reservation_id, libawscrt), Cint, (Ptr{aws_imds_client}, aws_imds_client_on_get_resource_callback_fn, Ptr{Cvoid}), client, callback, user_data)
end

"""
    aws_imds_client_get_security_groups(client, callback, user_data)

Gets the list of the security groups of the ec2 instance from the instance metadata document

### Parameters
* `client`: imds client to use for the query
* `callback`: callback function to invoke on query success or failure
* `user_data`: opaque data to invoke the completion callback with
### Returns
[`AWS_OP_SUCCESS`](@ref) if the query was successfully started, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_imds_client_get_security_groups( struct aws_imds_client *client, aws_imds_client_on_get_array_callback_fn callback, void *user_data);
```
"""
function aws_imds_client_get_security_groups(client, callback, user_data)
    ccall((:aws_imds_client_get_security_groups, libawscrt), Cint, (Ptr{aws_imds_client}, aws_imds_client_on_get_array_callback_fn, Ptr{Cvoid}), client, callback, user_data)
end

"""
    aws_imds_client_get_block_device_mapping(client, callback, user_data)

Gets the list of block device mappings of the ec2 instance from the instance metadata document

### Parameters
* `client`: imds client to use for the query
* `callback`: callback function to invoke on query success or failure
* `user_data`: opaque data to invoke the completion callback with
### Returns
[`AWS_OP_SUCCESS`](@ref) if the query was successfully started, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_imds_client_get_block_device_mapping( struct aws_imds_client *client, aws_imds_client_on_get_array_callback_fn callback, void *user_data);
```
"""
function aws_imds_client_get_block_device_mapping(client, callback, user_data)
    ccall((:aws_imds_client_get_block_device_mapping, libawscrt), Cint, (Ptr{aws_imds_client}, aws_imds_client_on_get_array_callback_fn, Ptr{Cvoid}), client, callback, user_data)
end

"""
    aws_imds_client_get_attached_iam_role(client, callback, user_data)

Gets the attached iam role of the ec2 instance from the instance metadata document

### Parameters
* `client`: imds client to use for the query
* `callback`: callback function to invoke on query success or failure
* `user_data`: opaque data to invoke the completion callback with
### Returns
[`AWS_OP_SUCCESS`](@ref) if the query was successfully started, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_imds_client_get_attached_iam_role( struct aws_imds_client *client, aws_imds_client_on_get_resource_callback_fn callback, void *user_data);
```
"""
function aws_imds_client_get_attached_iam_role(client, callback, user_data)
    ccall((:aws_imds_client_get_attached_iam_role, libawscrt), Cint, (Ptr{aws_imds_client}, aws_imds_client_on_get_resource_callback_fn, Ptr{Cvoid}), client, callback, user_data)
end

"""
    aws_imds_client_get_credentials(client, iam_role_name, callback, user_data)

Gets temporary credentials based on the attached iam role of the ec2 instance

### Parameters
* `client`: imds client to use for the query
* `iam_role_name`: iam role name to get temporary credentials through
* `callback`: callback function to invoke on query success or failure
* `user_data`: opaque data to invoke the completion callback with
### Returns
[`AWS_OP_SUCCESS`](@ref) if the query was successfully started, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_imds_client_get_credentials( struct aws_imds_client *client, struct aws_byte_cursor iam_role_name, aws_imds_client_on_get_credentials_callback_fn callback, void *user_data);
```
"""
function aws_imds_client_get_credentials(client, iam_role_name, callback, user_data)
    ccall((:aws_imds_client_get_credentials, libawscrt), Cint, (Ptr{aws_imds_client}, aws_byte_cursor, aws_imds_client_on_get_credentials_callback_fn, Ptr{Cvoid}), client, iam_role_name, callback, user_data)
end

"""
    aws_imds_client_get_iam_profile(client, callback, user_data)

Gets the iam profile information of the ec2 instance from the instance metadata document

### Parameters
* `client`: imds client to use for the query
* `callback`: callback function to invoke on query success or failure
* `user_data`: opaque data to invoke the completion callback with
### Returns
[`AWS_OP_SUCCESS`](@ref) if the query was successfully started, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_imds_client_get_iam_profile( struct aws_imds_client *client, aws_imds_client_on_get_iam_profile_callback_fn callback, void *user_data);
```
"""
function aws_imds_client_get_iam_profile(client, callback, user_data)
    ccall((:aws_imds_client_get_iam_profile, libawscrt), Cint, (Ptr{aws_imds_client}, aws_imds_client_on_get_iam_profile_callback_fn, Ptr{Cvoid}), client, callback, user_data)
end

"""
    aws_imds_client_get_user_data(client, callback, user_data)

Gets the user data of the ec2 instance from the instance metadata document

### Parameters
* `client`: imds client to use for the query
* `callback`: callback function to invoke on query success or failure
* `user_data`: opaque data to invoke the completion callback with
### Returns
[`AWS_OP_SUCCESS`](@ref) if the query was successfully started, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_imds_client_get_user_data( struct aws_imds_client *client, aws_imds_client_on_get_resource_callback_fn callback, void *user_data);
```
"""
function aws_imds_client_get_user_data(client, callback, user_data)
    ccall((:aws_imds_client_get_user_data, libawscrt), Cint, (Ptr{aws_imds_client}, aws_imds_client_on_get_resource_callback_fn, Ptr{Cvoid}), client, callback, user_data)
end

"""
    aws_imds_client_get_instance_signature(client, callback, user_data)

Gets the signature of the ec2 instance from the instance metadata document

### Parameters
* `client`: imds client to use for the query
* `callback`: callback function to invoke on query success or failure
* `user_data`: opaque data to invoke the completion callback with
### Returns
[`AWS_OP_SUCCESS`](@ref) if the query was successfully started, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_imds_client_get_instance_signature( struct aws_imds_client *client, aws_imds_client_on_get_resource_callback_fn callback, void *user_data);
```
"""
function aws_imds_client_get_instance_signature(client, callback, user_data)
    ccall((:aws_imds_client_get_instance_signature, libawscrt), Cint, (Ptr{aws_imds_client}, aws_imds_client_on_get_resource_callback_fn, Ptr{Cvoid}), client, callback, user_data)
end

"""
    aws_imds_client_get_instance_info(client, callback, user_data)

Gets the instance information data block of the ec2 instance from the instance metadata document

### Parameters
* `client`: imds client to use for the query
* `callback`: callback function to invoke on query success or failure
* `user_data`: opaque data to invoke the completion callback with
### Returns
[`AWS_OP_SUCCESS`](@ref) if the query was successfully started, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_imds_client_get_instance_info( struct aws_imds_client *client, aws_imds_client_on_get_instance_info_callback_fn callback, void *user_data);
```
"""
function aws_imds_client_get_instance_info(client, callback, user_data)
    ccall((:aws_imds_client_get_instance_info, libawscrt), Cint, (Ptr{aws_imds_client}, aws_imds_client_on_get_instance_info_callback_fn, Ptr{Cvoid}), client, callback, user_data)
end

# typedef void ( aws_on_get_credentials_callback_fn ) ( struct aws_credentials * credentials , int error_code , void * user_data )
const aws_on_get_credentials_callback_fn = Cvoid

# typedef int ( aws_credentials_provider_get_credentials_fn ) ( struct aws_credentials_provider * provider , aws_on_get_credentials_callback_fn callback , void * user_data )
const aws_credentials_provider_get_credentials_fn = Cvoid

# typedef void ( aws_credentials_provider_destroy_fn ) ( struct aws_credentials_provider * provider )
const aws_credentials_provider_destroy_fn = Cvoid

struct aws_credentials_provider_vtable
    get_credentials::Ptr{Cvoid}
    destroy::Ptr{Cvoid}
end

# typedef void ( aws_credentials_provider_shutdown_completed_fn ) ( void * user_data )
const aws_credentials_provider_shutdown_completed_fn = Cvoid

struct aws_credentials_provider_shutdown_options
    shutdown_callback::Ptr{Cvoid}
    shutdown_user_data::Ptr{Cvoid}
end

"""
    aws_credentials_provider

A baseclass for credentials providers. A credentials provider is an object that has an asynchronous query function for retrieving AWS credentials.

Ref-counted. Thread-safe.
"""
struct aws_credentials_provider
    vtable::Ptr{aws_credentials_provider_vtable}
    allocator::Ptr{aws_allocator}
    shutdown_options::aws_credentials_provider_shutdown_options
    impl::Ptr{Cvoid}
    ref_count::aws_atomic_var
end

"""
    aws_credentials_provider_static_options

Configuration options for a provider that returns a fixed set of credentials
"""
struct aws_credentials_provider_static_options
    shutdown_options::aws_credentials_provider_shutdown_options
    access_key_id::aws_byte_cursor
    secret_access_key::aws_byte_cursor
    session_token::aws_byte_cursor
end

"""
    aws_credentials_provider_environment_options

Configuration options for a provider that returns credentials based on environment variable values
"""
struct aws_credentials_provider_environment_options
    shutdown_options::aws_credentials_provider_shutdown_options
end

struct aws_tls_ctx
    alloc::Ptr{aws_allocator}
    impl::Ptr{Cvoid}
    ref_count::aws_ref_count
end

"""
    aws_credentials_provider_profile_options

Configuration options for a provider that sources credentials from the aws profile and credentials files (by default ~/.aws/profile and ~/.aws/credentials)
"""
struct aws_credentials_provider_profile_options
    shutdown_options::aws_credentials_provider_shutdown_options
    profile_name_override::aws_byte_cursor
    config_file_name_override::aws_byte_cursor
    credentials_file_name_override::aws_byte_cursor
    bootstrap::Ptr{aws_client_bootstrap}
    tls_ctx::Ptr{aws_tls_ctx}
    function_table::Ptr{aws_auth_http_system_vtable}
end

"""
    aws_credentials_provider_cached_options

Configuration options for a provider that functions as a caching decorator. Credentials sourced through this provider will be cached within it until their expiration time. When the cached credentials expire, new credentials will be fetched when next queried.
"""
struct aws_credentials_provider_cached_options
    shutdown_options::aws_credentials_provider_shutdown_options
    source::Ptr{aws_credentials_provider}
    refresh_time_in_milliseconds::UInt64
    high_res_clock_fn::Ptr{Cvoid}
    system_clock_fn::Ptr{Cvoid}
end

"""
    aws_credentials_provider_chain_options

Configuration options for a provider that queries, in order, a list of providers. This provider uses the first set of credentials successfully queried. Providers are queried one at a time; a provider is not queried until the preceding provider has failed to source credentials.
"""
struct aws_credentials_provider_chain_options
    shutdown_options::aws_credentials_provider_shutdown_options
    providers::Ptr{Ptr{aws_credentials_provider}}
    provider_count::Csize_t
end

"""
    aws_credentials_provider_imds_options

Configuration options for the provider that sources credentials from ec2 instance metadata
"""
struct aws_credentials_provider_imds_options
    shutdown_options::aws_credentials_provider_shutdown_options
    bootstrap::Ptr{aws_client_bootstrap}
    imds_version::aws_imds_protocol_version
    function_table::Ptr{aws_auth_http_system_vtable}
end

struct aws_credentials_provider_ecs_options
    shutdown_options::aws_credentials_provider_shutdown_options
    bootstrap::Ptr{aws_client_bootstrap}
    host::aws_byte_cursor
    path_and_query::aws_byte_cursor
    auth_token::aws_byte_cursor
    tls_ctx::Ptr{aws_tls_ctx}
    function_table::Ptr{aws_auth_http_system_vtable}
    port::UInt16
end

struct aws_string
    allocator::Ptr{aws_allocator}
    len::Csize_t
    bytes::NTuple{1, UInt8}
end

struct aws_tls_connection_options
    alpn_list::Ptr{aws_string}
    server_name::Ptr{aws_string}
    on_negotiation_result::Ptr{Cvoid}
    on_data_read::Ptr{Cvoid}
    on_error::Ptr{Cvoid}
    user_data::Ptr{Cvoid}
    ctx::Ptr{aws_tls_ctx}
    advertise_alpn_message::Bool
    timeout_ms::UInt32
end

"""
    aws_http_proxy_connection_type

Supported proxy connection types
"""
@cenum aws_http_proxy_connection_type::UInt32 begin
    AWS_HPCT_HTTP_LEGACY = 0
    AWS_HPCT_HTTP_FORWARD = 1
    AWS_HPCT_HTTP_TUNNEL = 2
end

struct aws_http_proxy_strategy_vtable
    create_negotiator::Ptr{Cvoid}
end

struct aws_http_proxy_strategy
    ref_count::aws_ref_count
    vtable::Ptr{aws_http_proxy_strategy_vtable}
    impl::Ptr{Cvoid}
    proxy_connection_type::aws_http_proxy_connection_type
end

"""
    aws_http_proxy_authentication_type

\\deprecated - Supported proxy authentication modes. Superceded by proxy strategy.
"""
@cenum aws_http_proxy_authentication_type::UInt32 begin
    AWS_HPAT_NONE = 0
    AWS_HPAT_BASIC = 1
end

"""
    aws_http_proxy_options

Options for http proxy server usage
"""
struct aws_http_proxy_options
    connection_type::aws_http_proxy_connection_type
    host::aws_byte_cursor
    port::UInt16
    tls_options::Ptr{aws_tls_connection_options}
    proxy_strategy::Ptr{aws_http_proxy_strategy}
    auth_type::aws_http_proxy_authentication_type
    auth_username::aws_byte_cursor
    auth_password::aws_byte_cursor
end

"""
    aws_credentials_provider_x509_options

Configuration options for the X509 credentials provider

The x509 credentials provider sources temporary credentials from AWS IoT Core using TLS mutual authentication. See details: https://docs.aws.amazon.com/iot/latest/developerguide/authorizing-direct-aws.html An end to end demo with detailed steps can be found here: https://aws.amazon.com/blogs/security/how-to-eliminate-the-need-for-hardcoded-aws-credentials-in-devices-by-using-the-aws-iot-credentials-provider/
"""
struct aws_credentials_provider_x509_options
    shutdown_options::aws_credentials_provider_shutdown_options
    bootstrap::Ptr{aws_client_bootstrap}
    tls_connection_options::Ptr{aws_tls_connection_options}
    thing_name::aws_byte_cursor
    role_alias::aws_byte_cursor
    endpoint::aws_byte_cursor
    proxy_options::Ptr{aws_http_proxy_options}
    function_table::Ptr{aws_auth_http_system_vtable}
end

"""
    aws_credentials_provider_sts_web_identity_options

Configuration options for the STS web identity provider

Sts with web identity credentials provider sources a set of temporary security credentials for users who have been authenticated in a mobile or web application with a web identity provider. Example providers include Amazon Cognito, Login with Amazon, Facebook, Google, or any OpenID Connect-compatible identity provider like Elastic Kubernetes Service https://docs.aws.amazon.com/STS/latest/APIReference/API\\_AssumeRoleWithWebIdentity.html The required parameters used in the request (region, roleArn, sessionName, tokenFilePath) are automatically resolved by SDK from envrionment variables or config file. --------------------------------------------------------------------------------- | Parameter | Environment Variable Name | Config File Property Name | ---------------------------------------------------------------------------------- | region | AWS\\_DEFAULT\\_REGION | region | | role\\_arn | AWS\\_ROLE\\_ARN | role\\_arn | | role\\_session\\_name | AWS\\_ROLE\\_SESSION\\_NAME | role\\_session\\_name | | token\\_file\\_path | AWS\\_WEB\\_IDENTITY\\_TOKEN\\_FILE | web\\_identity\\_token\\_file | |--------------------------------------------------------------------------------|
"""
struct aws_credentials_provider_sts_web_identity_options
    shutdown_options::aws_credentials_provider_shutdown_options
    bootstrap::Ptr{aws_client_bootstrap}
    tls_ctx::Ptr{aws_tls_ctx}
    function_table::Ptr{aws_auth_http_system_vtable}
end

"""
    aws_credentials_provider_sts_options

Configuration options for the STS credentials provider
"""
struct aws_credentials_provider_sts_options
    bootstrap::Ptr{aws_client_bootstrap}
    tls_ctx::Ptr{aws_tls_ctx}
    creds_provider::Ptr{aws_credentials_provider}
    role_arn::aws_byte_cursor
    session_name::aws_byte_cursor
    duration_seconds::UInt16
    shutdown_options::aws_credentials_provider_shutdown_options
    function_table::Ptr{aws_auth_http_system_vtable}
    system_clock_fn::Ptr{Cvoid}
end

"""
    aws_credentials_provider_process_options

Configuration options for the process credentials provider

The process credentials provider sources credentials from running a command or process. The command to run is sourced from a profile in the AWS config file, using the standard profile selection rules. The profile key the command is read from is "credential\\_process." E.g.: [default] credential\\_process=/opt/amazon/bin/my-credential-fetcher --argsA=abc On successfully running the command, the output should be a json data with the following format: { "Version": 1, "AccessKeyId": "accesskey", "SecretAccessKey": "secretAccessKey" "SessionToken": "....", "Expiration": "2019-05-29T00:21:43Z" } Version here identifies the command output format version. This provider is not part of the default provider chain.
"""
struct aws_credentials_provider_process_options
    shutdown_options::aws_credentials_provider_shutdown_options
    profile_to_use::aws_byte_cursor
end

"""
    aws_credentials_provider_chain_default_options

Configuration options for the default credentials provider chain.
"""
struct aws_credentials_provider_chain_default_options
    shutdown_options::aws_credentials_provider_shutdown_options
    bootstrap::Ptr{aws_client_bootstrap}
    tls_ctx::Ptr{aws_tls_ctx}
end

# typedef int ( aws_credentials_provider_delegate_get_credentials_fn ) ( void * delegate_user_data , aws_on_get_credentials_callback_fn callback , void * callback_user_data )
const aws_credentials_provider_delegate_get_credentials_fn = Cvoid

"""
    aws_credentials_provider_delegate_options

Configuration options for the delegate credentials provider.
"""
struct aws_credentials_provider_delegate_options
    shutdown_options::aws_credentials_provider_shutdown_options
    get_credentials::Ptr{Cvoid}
    delegate_user_data::Ptr{Cvoid}
end

mutable struct aws_credentials end

"""
    aws_credentials_new(allocator, access_key_id_cursor, secret_access_key_cursor, session_token_cursor, expiration_timepoint_seconds)

Creates a new set of aws credentials

### Parameters
* `allocator`: memory allocator to use
* `access_key_id_cursor`: value for the aws access key id field
* `secret_access_key_cursor`: value for the secret access key field
* `session_token_cursor`: (optional) security token associated with the credentials
* `expiration_timepoint_seconds`: timepoint, in seconds since epoch, that the credentials will no longer be valid past. For credentials that do not expire, use UINT64\\_MAX
### Returns
a valid credentials object, or NULL
### Prototype
```c
struct aws_credentials *aws_credentials_new( struct aws_allocator *allocator, struct aws_byte_cursor access_key_id_cursor, struct aws_byte_cursor secret_access_key_cursor, struct aws_byte_cursor session_token_cursor, uint64_t expiration_timepoint_seconds);
```
"""
function aws_credentials_new(allocator, access_key_id_cursor, secret_access_key_cursor, session_token_cursor, expiration_timepoint_seconds)
    ccall((:aws_credentials_new, libawscrt), Ptr{aws_credentials}, (Ptr{aws_allocator}, aws_byte_cursor, aws_byte_cursor, aws_byte_cursor, UInt64), allocator, access_key_id_cursor, secret_access_key_cursor, session_token_cursor, expiration_timepoint_seconds)
end

"""
    aws_credentials_new_from_string(allocator, access_key_id, secret_access_key, session_token, expiration_timepoint_seconds)

Creates a new set of AWS credentials

### Parameters
* `allocator`: memory allocator to use
* `access_key_id`: value for the aws access key id field
* `secret_access_key`: value for the secret access key field
* `session_token`: (optional) security token associated with the credentials
* `expiration_timepoint_seconds`: timepoint, in seconds since epoch, that the credentials will no longer be valid past. For credentials that do not expire, use UINT64\\_MAX
### Returns
a valid credentials object, or NULL
### Prototype
```c
struct aws_credentials *aws_credentials_new_from_string( struct aws_allocator *allocator, const struct aws_string *access_key_id, const struct aws_string *secret_access_key, const struct aws_string *session_token, uint64_t expiration_timepoint_seconds);
```
"""
function aws_credentials_new_from_string(allocator, access_key_id, secret_access_key, session_token, expiration_timepoint_seconds)
    ccall((:aws_credentials_new_from_string, libawscrt), Ptr{aws_credentials}, (Ptr{aws_allocator}, Ptr{aws_string}, Ptr{aws_string}, Ptr{aws_string}, UInt64), allocator, access_key_id, secret_access_key, session_token, expiration_timepoint_seconds)
end

"""
    aws_credentials_acquire(credentials)

Add a reference to some credentials

### Parameters
* `credentials`: credentials to increment the ref count on
### Prototype
```c
void aws_credentials_acquire(const struct aws_credentials *credentials);
```
"""
function aws_credentials_acquire(credentials)
    ccall((:aws_credentials_acquire, libawscrt), Cvoid, (Ptr{aws_credentials},), credentials)
end

"""
    aws_credentials_release(credentials)

Remove a reference to some credentials

### Parameters
* `credentials`: credentials to decrement the ref count on
### Prototype
```c
void aws_credentials_release(const struct aws_credentials *credentials);
```
"""
function aws_credentials_release(credentials)
    ccall((:aws_credentials_release, libawscrt), Cvoid, (Ptr{aws_credentials},), credentials)
end

"""
    aws_credentials_get_access_key_id(credentials)

Get the AWS access key id from a set of credentials

### Parameters
* `credentials`: credentials to get the access key id from
### Returns
a byte cursor to the access key id
### Prototype
```c
struct aws_byte_cursor aws_credentials_get_access_key_id(const struct aws_credentials *credentials);
```
"""
function aws_credentials_get_access_key_id(credentials)
    ccall((:aws_credentials_get_access_key_id, libawscrt), aws_byte_cursor, (Ptr{aws_credentials},), credentials)
end

"""
    aws_credentials_get_secret_access_key(credentials)

Get the AWS secret access key from a set of credentials

### Parameters
* `credentials`: credentials to get the secret access key from
### Returns
a byte cursor to the secret access key
### Prototype
```c
struct aws_byte_cursor aws_credentials_get_secret_access_key(const struct aws_credentials *credentials);
```
"""
function aws_credentials_get_secret_access_key(credentials)
    ccall((:aws_credentials_get_secret_access_key, libawscrt), aws_byte_cursor, (Ptr{aws_credentials},), credentials)
end

"""
    aws_credentials_get_session_token(credentials)

Get the AWS session token from a set of credentials

### Parameters
* `credentials`: credentials to get the session token from
### Returns
a byte cursor to the session token or an empty byte cursor if there is no session token
### Prototype
```c
struct aws_byte_cursor aws_credentials_get_session_token(const struct aws_credentials *credentials);
```
"""
function aws_credentials_get_session_token(credentials)
    ccall((:aws_credentials_get_session_token, libawscrt), aws_byte_cursor, (Ptr{aws_credentials},), credentials)
end

"""
    aws_credentials_get_expiration_timepoint_seconds(credentials)

Get the expiration timepoint (in seconds since epoch) associated with a set of credentials

### Parameters
* `credentials`: credentials to get the expiration timepoint for
### Returns
the time, in seconds since epoch, the credentials will expire; UINT64\\_MAX for credentials without a specific expiration time
### Prototype
```c
uint64_t aws_credentials_get_expiration_timepoint_seconds(const struct aws_credentials *credentials);
```
"""
function aws_credentials_get_expiration_timepoint_seconds(credentials)
    ccall((:aws_credentials_get_expiration_timepoint_seconds, libawscrt), UInt64, (Ptr{aws_credentials},), credentials)
end

@cenum aws_ecc_curve_name::UInt32 begin
    AWS_CAL_ECDSA_P256 = 0
    AWS_CAL_ECDSA_P384 = 1
end

"""
    aws_byte_buf

Represents a length-delimited binary string or buffer. If byte buffer points to constant memory or memory that should otherwise not be freed by this struct, set allocator to NULL and free function will be a no-op.

This structure used to define the output for all functions that write to a buffer.

Note that this structure allocates memory at the buffer pointer only. The struct itself does not get dynamically allocated and must be either maintained or copied to avoid losing access to the memory.
"""
struct aws_byte_buf
    len::Csize_t
    buffer::Ptr{UInt8}
    capacity::Csize_t
    allocator::Ptr{aws_allocator}
end

struct aws_ecc_key_pair_vtable
    destroy::Ptr{Cvoid}
    derive_pub_key::Ptr{Cvoid}
    sign_message::Ptr{Cvoid}
    verify_signature::Ptr{Cvoid}
    signature_length::Ptr{Cvoid}
end

struct aws_ecc_key_pair
    allocator::Ptr{aws_allocator}
    ref_count::aws_atomic_var
    curve_name::aws_ecc_curve_name
    key_buf::aws_byte_buf
    pub_x::aws_byte_buf
    pub_y::aws_byte_buf
    priv_d::aws_byte_buf
    vtable::Ptr{aws_ecc_key_pair_vtable}
    impl::Ptr{Cvoid}
end

"""
    aws_credentials_get_ecc_key_pair(credentials)

Get the elliptic curve key associated with this set of credentials

### Parameters
* `credentials`: credentials to get the the elliptic curve key for
### Returns
the elliptic curve key associated with the credentials, or NULL if no key is associated with these credentials
### Prototype
```c
struct aws_ecc_key_pair *aws_credentials_get_ecc_key_pair(const struct aws_credentials *credentials);
```
"""
function aws_credentials_get_ecc_key_pair(credentials)
    ccall((:aws_credentials_get_ecc_key_pair, libawscrt), Ptr{aws_ecc_key_pair}, (Ptr{aws_credentials},), credentials)
end

"""
    aws_credentials_provider_release(provider)

Release a reference to a credentials provider

### Parameters
* `provider`: provider to increment the ref count on
### Prototype
```c
void aws_credentials_provider_release(struct aws_credentials_provider *provider);
```
"""
function aws_credentials_provider_release(provider)
    ccall((:aws_credentials_provider_release, libawscrt), Cvoid, (Ptr{aws_credentials_provider},), provider)
end

"""
    aws_credentials_provider_acquire(provider)

### Prototype
```c
void aws_credentials_provider_acquire(struct aws_credentials_provider *provider);
```
"""
function aws_credentials_provider_acquire(provider)
    ccall((:aws_credentials_provider_acquire, libawscrt), Cvoid, (Ptr{aws_credentials_provider},), provider)
end

"""
    aws_credentials_provider_get_credentials(provider, callback, user_data)

### Prototype
```c
int aws_credentials_provider_get_credentials( struct aws_credentials_provider *provider, aws_on_get_credentials_callback_fn callback, void *user_data);
```
"""
function aws_credentials_provider_get_credentials(provider, callback, user_data)
    ccall((:aws_credentials_provider_get_credentials, libawscrt), Cint, (Ptr{aws_credentials_provider}, aws_on_get_credentials_callback_fn, Ptr{Cvoid}), provider, callback, user_data)
end

"""
    aws_credentials_provider_new_static(allocator, options)

Creates a simple provider that just returns a fixed set of credentials

### Parameters
* `allocator`: memory allocator to use for all memory allocation
* `options`: provider-specific configuration options
### Returns
the newly-constructed credentials provider, or NULL if an error occurred.
### Prototype
```c
struct aws_credentials_provider *aws_credentials_provider_new_static( struct aws_allocator *allocator, const struct aws_credentials_provider_static_options *options);
```
"""
function aws_credentials_provider_new_static(allocator, options)
    ccall((:aws_credentials_provider_new_static, libawscrt), Ptr{aws_credentials_provider}, (Ptr{aws_allocator}, Ptr{aws_credentials_provider_static_options}), allocator, options)
end

"""
    aws_credentials_provider_new_environment(allocator, options)

Creates a provider that returns credentials sourced from the environment variables:

AWS\\_ACCESS\\_KEY\\_ID AWS\\_SECRET\\_ACCESS\\_KEY AWS\\_SESSION\\_TOKEN

### Parameters
* `allocator`: memory allocator to use for all memory allocation
* `options`: provider-specific configuration options
### Returns
the newly-constructed credentials provider, or NULL if an error occurred.
### Prototype
```c
struct aws_credentials_provider *aws_credentials_provider_new_environment( struct aws_allocator *allocator, const struct aws_credentials_provider_environment_options *options);
```
"""
function aws_credentials_provider_new_environment(allocator, options)
    ccall((:aws_credentials_provider_new_environment, libawscrt), Ptr{aws_credentials_provider}, (Ptr{aws_allocator}, Ptr{aws_credentials_provider_environment_options}), allocator, options)
end

"""
    aws_credentials_provider_new_cached(allocator, options)

Creates a provider that functions as a caching decorating of another provider.

For example, the default chain is implemented as:

CachedProvider -> ProviderChain(EnvironmentProvider -> ProfileProvider -> ECS/EC2IMD etc...)

A reference is taken on the target provider

### Parameters
* `allocator`: memory allocator to use for all memory allocation
* `options`: provider-specific configuration options
### Returns
the newly-constructed credentials provider, or NULL if an error occurred.
### Prototype
```c
struct aws_credentials_provider *aws_credentials_provider_new_cached( struct aws_allocator *allocator, const struct aws_credentials_provider_cached_options *options);
```
"""
function aws_credentials_provider_new_cached(allocator, options)
    ccall((:aws_credentials_provider_new_cached, libawscrt), Ptr{aws_credentials_provider}, (Ptr{aws_allocator}, Ptr{aws_credentials_provider_cached_options}), allocator, options)
end

"""
    aws_credentials_provider_new_profile(allocator, options)

Creates a provider that sources credentials from key-value profiles loaded from the aws credentials file ("~/.aws/credentials" by default) and the aws config file ("~/.aws/config" by default)

### Parameters
* `allocator`: memory allocator to use for all memory allocation
* `options`: provider-specific configuration options
### Returns
the newly-constructed credentials provider, or NULL if an error occurred.
### Prototype
```c
struct aws_credentials_provider *aws_credentials_provider_new_profile( struct aws_allocator *allocator, const struct aws_credentials_provider_profile_options *options);
```
"""
function aws_credentials_provider_new_profile(allocator, options)
    ccall((:aws_credentials_provider_new_profile, libawscrt), Ptr{aws_credentials_provider}, (Ptr{aws_allocator}, Ptr{aws_credentials_provider_profile_options}), allocator, options)
end

"""
    aws_credentials_provider_new_sts(allocator, options)

Creates a provider that assumes an IAM role via. STS AssumeRole() API. This provider will fetch new credentials upon each call to [`aws_credentials_provider_get_credentials`](@ref)().

### Parameters
* `allocator`: memory allocator to use for all memory allocation
* `options`: provider-specific configuration options
### Returns
the newly-constructed credentials provider, or NULL if an error occurred.
### Prototype
```c
struct aws_credentials_provider *aws_credentials_provider_new_sts( struct aws_allocator *allocator, struct aws_credentials_provider_sts_options *options);
```
"""
function aws_credentials_provider_new_sts(allocator, options)
    ccall((:aws_credentials_provider_new_sts, libawscrt), Ptr{aws_credentials_provider}, (Ptr{aws_allocator}, Ptr{aws_credentials_provider_sts_options}), allocator, options)
end

"""
    aws_credentials_provider_new_chain(allocator, options)

Creates a provider that sources credentials from an ordered sequence of providers, with the overall result being from the first provider to return a valid set of credentials

References are taken on all supplied providers

### Parameters
* `allocator`: memory allocator to use for all memory allocation
* `options`: provider-specific configuration options
### Returns
the newly-constructed credentials provider, or NULL if an error occurred.
### Prototype
```c
struct aws_credentials_provider *aws_credentials_provider_new_chain( struct aws_allocator *allocator, const struct aws_credentials_provider_chain_options *options);
```
"""
function aws_credentials_provider_new_chain(allocator, options)
    ccall((:aws_credentials_provider_new_chain, libawscrt), Ptr{aws_credentials_provider}, (Ptr{aws_allocator}, Ptr{aws_credentials_provider_chain_options}), allocator, options)
end

"""
    aws_credentials_provider_new_imds(allocator, options)

Creates a provider that sources credentials from the ec2 instance metadata service

### Parameters
* `allocator`: memory allocator to use for all memory allocation
* `options`: provider-specific configuration options
### Returns
the newly-constructed credentials provider, or NULL if an error occurred.
### Prototype
```c
struct aws_credentials_provider *aws_credentials_provider_new_imds( struct aws_allocator *allocator, const struct aws_credentials_provider_imds_options *options);
```
"""
function aws_credentials_provider_new_imds(allocator, options)
    ccall((:aws_credentials_provider_new_imds, libawscrt), Ptr{aws_credentials_provider}, (Ptr{aws_allocator}, Ptr{aws_credentials_provider_imds_options}), allocator, options)
end

"""
    aws_credentials_provider_new_ecs(allocator, options)

Creates a provider that sources credentials from the ecs role credentials service

### Parameters
* `allocator`: memory allocator to use for all memory allocation
* `options`: provider-specific configuration options
### Returns
the newly-constructed credentials provider, or NULL if an error occurred.
### Prototype
```c
struct aws_credentials_provider *aws_credentials_provider_new_ecs( struct aws_allocator *allocator, const struct aws_credentials_provider_ecs_options *options);
```
"""
function aws_credentials_provider_new_ecs(allocator, options)
    ccall((:aws_credentials_provider_new_ecs, libawscrt), Ptr{aws_credentials_provider}, (Ptr{aws_allocator}, Ptr{aws_credentials_provider_ecs_options}), allocator, options)
end

"""
    aws_credentials_provider_new_x509(allocator, options)

Creates a provider that sources credentials from IoT Core

### Parameters
* `allocator`: memory allocator to use for all memory allocation
* `options`: provider-specific configuration options
### Returns
the newly-constructed credentials provider, or NULL if an error occurred.
### Prototype
```c
struct aws_credentials_provider *aws_credentials_provider_new_x509( struct aws_allocator *allocator, const struct aws_credentials_provider_x509_options *options);
```
"""
function aws_credentials_provider_new_x509(allocator, options)
    ccall((:aws_credentials_provider_new_x509, libawscrt), Ptr{aws_credentials_provider}, (Ptr{aws_allocator}, Ptr{aws_credentials_provider_x509_options}), allocator, options)
end

"""
    aws_credentials_provider_new_sts_web_identity(allocator, options)

Creates a provider that sources credentials from STS using AssumeRoleWithWebIdentity

### Parameters
* `allocator`: memory allocator to use for all memory allocation
* `options`: provider-specific configuration options
### Returns
the newly-constructed credentials provider, or NULL if an error occurred.
### Prototype
```c
struct aws_credentials_provider *aws_credentials_provider_new_sts_web_identity( struct aws_allocator *allocator, const struct aws_credentials_provider_sts_web_identity_options *options);
```
"""
function aws_credentials_provider_new_sts_web_identity(allocator, options)
    ccall((:aws_credentials_provider_new_sts_web_identity, libawscrt), Ptr{aws_credentials_provider}, (Ptr{aws_allocator}, Ptr{aws_credentials_provider_sts_web_identity_options}), allocator, options)
end

"""
    aws_credentials_provider_new_process(allocator, options)

### Prototype
```c
struct aws_credentials_provider *aws_credentials_provider_new_process( struct aws_allocator *allocator, const struct aws_credentials_provider_process_options *options);
```
"""
function aws_credentials_provider_new_process(allocator, options)
    ccall((:aws_credentials_provider_new_process, libawscrt), Ptr{aws_credentials_provider}, (Ptr{aws_allocator}, Ptr{aws_credentials_provider_process_options}), allocator, options)
end

"""
    aws_credentials_provider_new_delegate(allocator, options)

Create a credentials provider depends on provided vtable to fetch the credentials.

### Parameters
* `allocator`: memory allocator to use for all memory allocation
* `options`: provider-specific configuration options
### Returns
the newly-constructed credentials provider, or NULL if an error occurred.
### Prototype
```c
struct aws_credentials_provider *aws_credentials_provider_new_delegate( struct aws_allocator *allocator, struct aws_credentials_provider_delegate_options *options);
```
"""
function aws_credentials_provider_new_delegate(allocator, options)
    ccall((:aws_credentials_provider_new_delegate, libawscrt), Ptr{aws_credentials_provider}, (Ptr{aws_allocator}, Ptr{aws_credentials_provider_delegate_options}), allocator, options)
end

"""
    aws_credentials_provider_new_chain_default(allocator, options)

Creates the default provider chain used by most AWS SDKs.

Generally:

(1) Environment (2) Profile (3) (conditional, off by default) ECS (4) (conditional, on by default) EC2 Instance Metadata

Support for environmental control of the default provider chain is not yet implemented.

### Parameters
* `allocator`: memory allocator to use for all memory allocation
* `options`: provider-specific configuration options
### Returns
the newly-constructed credentials provider, or NULL if an error occurred.
### Prototype
```c
struct aws_credentials_provider *aws_credentials_provider_new_chain_default( struct aws_allocator *allocator, const struct aws_credentials_provider_chain_default_options *options);
```
"""
function aws_credentials_provider_new_chain_default(allocator, options)
    ccall((:aws_credentials_provider_new_chain_default, libawscrt), Ptr{aws_credentials_provider}, (Ptr{aws_allocator}, Ptr{aws_credentials_provider_chain_default_options}), allocator, options)
end

"""
    aws_credentials_new_ecc(allocator, access_key_id, ecc_key, session_token, expiration_timepoint_in_seconds)

### Prototype
```c
struct aws_credentials *aws_credentials_new_ecc( struct aws_allocator *allocator, struct aws_byte_cursor access_key_id, struct aws_ecc_key_pair *ecc_key, struct aws_byte_cursor session_token, uint64_t expiration_timepoint_in_seconds);
```
"""
function aws_credentials_new_ecc(allocator, access_key_id, ecc_key, session_token, expiration_timepoint_in_seconds)
    ccall((:aws_credentials_new_ecc, libawscrt), Ptr{aws_credentials}, (Ptr{aws_allocator}, aws_byte_cursor, Ptr{aws_ecc_key_pair}, aws_byte_cursor, UInt64), allocator, access_key_id, ecc_key, session_token, expiration_timepoint_in_seconds)
end

"""
    aws_credentials_new_ecc_from_aws_credentials(allocator, credentials)

### Prototype
```c
struct aws_credentials *aws_credentials_new_ecc_from_aws_credentials( struct aws_allocator *allocator, const struct aws_credentials *credentials);
```
"""
function aws_credentials_new_ecc_from_aws_credentials(allocator, credentials)
    ccall((:aws_credentials_new_ecc_from_aws_credentials, libawscrt), Ptr{aws_credentials}, (Ptr{aws_allocator}, Ptr{aws_credentials}), allocator, credentials)
end

"""
    aws_ecc_key_pair_new_ecdsa_p256_key_from_aws_credentials(allocator, credentials)

### Prototype
```c
struct aws_ecc_key_pair *aws_ecc_key_pair_new_ecdsa_p256_key_from_aws_credentials( struct aws_allocator *allocator, const struct aws_credentials *credentials);
```
"""
function aws_ecc_key_pair_new_ecdsa_p256_key_from_aws_credentials(allocator, credentials)
    ccall((:aws_ecc_key_pair_new_ecdsa_p256_key_from_aws_credentials, libawscrt), Ptr{aws_ecc_key_pair}, (Ptr{aws_allocator}, Ptr{aws_credentials}), allocator, credentials)
end

struct aws_signable_property_list_pair
    name::aws_byte_cursor
    value::aws_byte_cursor
end

# typedef int ( aws_signable_get_property_fn ) ( const struct aws_signable * signable , const struct aws_string * name , struct aws_byte_cursor * out_value )
const aws_signable_get_property_fn = Cvoid

# typedef int ( aws_signable_get_property_list_fn ) ( const struct aws_signable * signable , const struct aws_string * name , struct aws_array_list * * out_list )
const aws_signable_get_property_list_fn = Cvoid

# typedef int ( aws_signable_get_payload_stream_fn ) ( const struct aws_signable * signable , struct aws_input_stream * * out_input_stream )
const aws_signable_get_payload_stream_fn = Cvoid

# typedef void ( aws_signable_destroy_fn ) ( struct aws_signable * signable )
const aws_signable_destroy_fn = Cvoid

struct aws_signable_vtable
    get_property::Ptr{Cvoid}
    get_property_list::Ptr{Cvoid}
    get_payload_stream::Ptr{Cvoid}
    destroy::Ptr{Cvoid}
end

"""
    aws_signable

Signable is a generic interface for any kind of object that can be cryptographically signed.

Like signing\\_result, the signable interface presents

(1) Properties - A set of key-value pairs (2) Property Lists - A set of named key-value pair lists

as well as

(3) A message payload modeled as a stream

When creating a signable "subclass" the query interface should map to retrieving the properties of the underlying object needed by signing algorithms that can operate on it.

As an example, if a signable implementation wrapped an http request, you would query request elements like method and uri from the property interface, headers would be queried via the property list interface, and the request body would map to the payload stream.

String constants that map to agreed on keys for particular signable types ("METHOD", "URI", "HEADERS", etc...) are exposed in appropriate header files.
"""
struct aws_signable
    allocator::Ptr{aws_allocator}
    impl::Ptr{Cvoid}
    vtable::Ptr{aws_signable_vtable}
end

"""
    aws_signable_destroy(signable)

Cleans up and frees all resources associated with a signable instance

### Parameters
* `signable`: signable object to destroy
### Prototype
```c
void aws_signable_destroy(struct aws_signable *signable);
```
"""
function aws_signable_destroy(signable)
    ccall((:aws_signable_destroy, libawscrt), Cvoid, (Ptr{aws_signable},), signable)
end

"""
    aws_signable_get_property(signable, name, out_value)

Retrieves a property (key-value pair) from a signable. Global property name constants are included below.

### Parameters
* `signable`: signable object to retrieve a property from
* `name`: name of the property to query
* `out_value`: output parameter for the property's value
### Returns
[`AWS_OP_SUCCESS`](@ref) if the property was successfully fetched, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_signable_get_property( const struct aws_signable *signable, const struct aws_string *name, struct aws_byte_cursor *out_value);
```
"""
function aws_signable_get_property(signable, name, out_value)
    ccall((:aws_signable_get_property, libawscrt), Cint, (Ptr{aws_signable}, Ptr{aws_string}, Ptr{aws_byte_cursor}), signable, name, out_value)
end

"""
    aws_signable_get_property_list(signable, name, out_property_list)

Retrieves a named property list (list of key-value pairs) from a signable. Global property list name constants are included below.

### Parameters
* `signable`: signable object to retrieve a property list from
* `name`: name of the property list to fetch
* `out_property_list`: output parameter for the fetched property list
### Returns
[`AWS_OP_SUCCESS`](@ref) if the property list was successfully fetched, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_signable_get_property_list( const struct aws_signable *signable, const struct aws_string *name, struct aws_array_list **out_property_list);
```
"""
function aws_signable_get_property_list(signable, name, out_property_list)
    ccall((:aws_signable_get_property_list, libawscrt), Cint, (Ptr{aws_signable}, Ptr{aws_string}, Ptr{Ptr{aws_array_list}}), signable, name, out_property_list)
end

struct aws_input_stream_vtable
    seek::Ptr{Cvoid}
    read::Ptr{Cvoid}
    get_status::Ptr{Cvoid}
    get_length::Ptr{Cvoid}
    destroy::Ptr{Cvoid}
end

struct aws_input_stream
    allocator::Ptr{aws_allocator}
    impl::Ptr{Cvoid}
    vtable::Ptr{aws_input_stream_vtable}
end

"""
    aws_signable_get_payload_stream(signable, out_input_stream)

Retrieves the signable's message payload as a stream.

### Parameters
* `signable`: signable to get the payload of
* `out_input_stream`: output parameter for the payload stream
### Returns
[`AWS_OP_SUCCESS`](@ref) if successful, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_signable_get_payload_stream(const struct aws_signable *signable, struct aws_input_stream **out_input_stream);
```
"""
function aws_signable_get_payload_stream(signable, out_input_stream)
    ccall((:aws_signable_get_payload_stream, libawscrt), Cint, (Ptr{aws_signable}, Ptr{Ptr{aws_input_stream}}), signable, out_input_stream)
end

mutable struct aws_http_message end

"""
    aws_signable_new_http_request(allocator, request)

Creates a signable wrapper around an http request.

### Parameters
* `allocator`: memory allocator to use to create the signable
* `request`: http request to create a signable for
### Returns
the new signable object, or NULL if failure
### Prototype
```c
struct aws_signable *aws_signable_new_http_request(struct aws_allocator *allocator, struct aws_http_message *request);
```
"""
function aws_signable_new_http_request(allocator, request)
    ccall((:aws_signable_new_http_request, libawscrt), Ptr{aws_signable}, (Ptr{aws_allocator}, Ptr{aws_http_message}), allocator, request)
end

"""
    aws_signable_new_chunk(allocator, chunk_data, previous_signature)

Creates a signable that represents a unit of chunked encoding within an http request.

### Parameters
* `allocator`: memory allocator use to create the signable
* `chunk_data`: stream representing the data in the chunk; it should be in its final, encoded form
* `previous_signature`: the signature computed in the most recent signing that preceded this one. It can be found by copying the "signature" property from the signing\\_result of that most recent signing.
### Returns
the new signable object, or NULL if failure
### Prototype
```c
struct aws_signable *aws_signable_new_chunk( struct aws_allocator *allocator, struct aws_input_stream *chunk_data, struct aws_byte_cursor previous_signature);
```
"""
function aws_signable_new_chunk(allocator, chunk_data, previous_signature)
    ccall((:aws_signable_new_chunk, libawscrt), Ptr{aws_signable}, (Ptr{aws_allocator}, Ptr{aws_input_stream}, aws_byte_cursor), allocator, chunk_data, previous_signature)
end

mutable struct aws_http_headers end

"""
    aws_signable_new_trailing_headers(allocator, trailing_headers, previous_signature)

Creates a signable wrapper around a set of headers.

### Parameters
* `allocator`: memory allocator use to create the signable
* `trailing_headers`: http headers to create a signable for
* `previous_signature`: the signature computed in the most recent signing that preceded this one. It can be found by copying the "signature" property from the signing\\_result of that most recent signing.
### Returns
the new signable object, or NULL if failure
### Prototype
```c
struct aws_signable *aws_signable_new_trailing_headers( struct aws_allocator *allocator, struct aws_http_headers *trailing_headers, struct aws_byte_cursor previous_signature);
```
"""
function aws_signable_new_trailing_headers(allocator, trailing_headers, previous_signature)
    ccall((:aws_signable_new_trailing_headers, libawscrt), Ptr{aws_signable}, (Ptr{aws_allocator}, Ptr{aws_http_headers}, aws_byte_cursor), allocator, trailing_headers, previous_signature)
end

"""
    aws_signable_new_canonical_request(allocator, canonical_request)

Creates a signable that represents a pre-computed canonical request from an http request

### Parameters
* `allocator`: memory allocator use to create the signable
* `canonical_request`: text of the canonical request
### Returns
the new signable object, or NULL if failure
### Prototype
```c
struct aws_signable *aws_signable_new_canonical_request( struct aws_allocator *allocator, struct aws_byte_cursor canonical_request);
```
"""
function aws_signable_new_canonical_request(allocator, canonical_request)
    ccall((:aws_signable_new_canonical_request, libawscrt), Ptr{aws_signable}, (Ptr{aws_allocator}, aws_byte_cursor), allocator, canonical_request)
end

# typedef void ( aws_signing_complete_fn ) ( struct aws_signing_result * result , int error_code , void * userdata )
"""
Gets called by the signing function when the signing is complete.

Note that result will be destroyed after this function returns, so either copy it, or do all necessary adjustments inside the callback.

When performing event or chunk signing, you will need to copy out the signature value in order to correctly configure the signable that wraps the event or chunk you want signed next. The signature is found in the "signature" property on the signing result. This value must be added as the "previous-signature" property on the next signable.
"""
const aws_signing_complete_fn = Cvoid

"""
    aws_signing_config_type

A primitive RTTI indicator for signing configuration structs

There must be one entry per config structure type and it's a fatal error to put the wrong value in the "config\\_type" member of your config structure.
"""
@cenum aws_signing_config_type::UInt32 begin
    AWS_SIGNING_CONFIG_AWS = 1
end

"""
    aws_signing_config_base

All signing configuration structs must match this by having the config\\_type member as the first member.
"""
struct aws_signing_config_base
    config_type::aws_signing_config_type
end

"""
    aws_sign_request_aws(allocator, signable, base_config, on_complete, userdata)

(Asynchronous) entry point to sign something (a request, a chunk, an event) with an AWS signing process. Depending on the configuration, the signing process may or may not complete synchronously.

### Parameters
* `allocator`: memory allocator to use throughout the signing process
* `signable`: the thing to be signed. See signable.h for common constructors for signables that wrap different types.
* `base_config`: pointer to a signing configuration, currently this must be of type [`aws_signing_config_aws`](@ref)
* `on_complete`: completion callback to be invoked when signing has finished
* `user_data`: opaque user data that will be passed to the completion callback
### Returns
[`AWS_OP_SUCCESS`](@ref) if the signing attempt was *initiated* successfully, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_sign_request_aws( struct aws_allocator *allocator, const struct aws_signable *signable, const struct aws_signing_config_base *base_config, aws_signing_complete_fn *on_complete, void *userdata);
```
"""
function aws_sign_request_aws(allocator, signable, base_config, on_complete, userdata)
    ccall((:aws_sign_request_aws, libawscrt), Cint, (Ptr{aws_allocator}, Ptr{aws_signable}, Ptr{aws_signing_config_base}, Ptr{Cvoid}, Ptr{Cvoid}), allocator, signable, base_config, on_complete, userdata)
end

"""
    aws_verify_sigv4a_signing(allocator, signable, base_config, expected_canonical_request_cursor, signature_cursor, ecc_key_pub_x, ecc_key_pub_y)

Test-only API used for cross-library signing verification tests

Verifies: (1) The canonical request generated during sigv4a signing of the request matches what is passed in (2) The signature passed in is a valid ECDSA signature of the hashed string-to-sign derived from the canonical request

### Parameters
* `allocator`: memory allocator to use throughout the signing verification process
* `signable`: the thing to be signed. See signable.h for common constructors for signables that wrap different types.
* `base_config`: pointer to a signing configuration, currently this must be of type [`aws_signing_config_aws`](@ref)
* `expected_canonical_request_cursor`: expected result when building the canonical request
* `signature_cursor`: the actual signature computed from a previous signing of the signable
* `ecc_key_pub_x`: the x coordinate of the public part of the ecc key to verify the signature
* `ecc_key_pub_y`: the y coordinate of the public part of the ecc key to verify the signature
### Returns
[`AWS_OP_SUCCESS`](@ref) if the signing attempt was *initiated* successfully, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_verify_sigv4a_signing( struct aws_allocator *allocator, const struct aws_signable *signable, const struct aws_signing_config_base *base_config, struct aws_byte_cursor expected_canonical_request_cursor, struct aws_byte_cursor signature_cursor, struct aws_byte_cursor ecc_key_pub_x, struct aws_byte_cursor ecc_key_pub_y);
```
"""
function aws_verify_sigv4a_signing(allocator, signable, base_config, expected_canonical_request_cursor, signature_cursor, ecc_key_pub_x, ecc_key_pub_y)
    ccall((:aws_verify_sigv4a_signing, libawscrt), Cint, (Ptr{aws_allocator}, Ptr{aws_signable}, Ptr{aws_signing_config_base}, aws_byte_cursor, aws_byte_cursor, aws_byte_cursor, aws_byte_cursor), allocator, signable, base_config, expected_canonical_request_cursor, signature_cursor, ecc_key_pub_x, ecc_key_pub_y)
end

"""
    aws_validate_v4a_authorization_value(allocator, ecc_key, string_to_sign_cursor, signature_value_cursor)

Another helper function to check a computed sigv4a signature.

### Prototype
```c
int aws_validate_v4a_authorization_value( struct aws_allocator *allocator, struct aws_ecc_key_pair *ecc_key, struct aws_byte_cursor string_to_sign_cursor, struct aws_byte_cursor signature_value_cursor);
```
"""
function aws_validate_v4a_authorization_value(allocator, ecc_key, string_to_sign_cursor, signature_value_cursor)
    ccall((:aws_validate_v4a_authorization_value, libawscrt), Cint, (Ptr{aws_allocator}, Ptr{aws_ecc_key_pair}, aws_byte_cursor, aws_byte_cursor), allocator, ecc_key, string_to_sign_cursor, signature_value_cursor)
end

"""
    aws_trim_padded_sigv4a_signature(signature)

Removes any padding added to the end of a sigv4a signature. Signature must be hex-encoded.

### Parameters
* `signature`: signature to remove padding from
### Returns
cursor that ranges over only the valid hex encoding of the sigv4a signature
### Prototype
```c
struct aws_byte_cursor aws_trim_padded_sigv4a_signature(struct aws_byte_cursor signature);
```
"""
function aws_trim_padded_sigv4a_signature(signature)
    ccall((:aws_trim_padded_sigv4a_signature, libawscrt), aws_byte_cursor, (aws_byte_cursor,), signature)
end

# typedef bool ( aws_should_sign_header_fn ) ( const struct aws_byte_cursor * name , void * userdata )
const aws_should_sign_header_fn = Cvoid

"""
    aws_signing_algorithm

What version of the AWS signing process should we use.
"""
@cenum aws_signing_algorithm::UInt32 begin
    AWS_SIGNING_ALGORITHM_V4 = 0
    AWS_SIGNING_ALGORITHM_V4_ASYMMETRIC = 1
end

"""
    aws_signature_type

What sort of signature should be computed from the signable?
"""
@cenum aws_signature_type::UInt32 begin
    AWS_ST_HTTP_REQUEST_HEADERS = 0
    AWS_ST_HTTP_REQUEST_QUERY_PARAMS = 1
    AWS_ST_HTTP_REQUEST_CHUNK = 2
    AWS_ST_HTTP_REQUEST_EVENT = 3
    AWS_ST_CANONICAL_REQUEST_HEADERS = 4
    AWS_ST_CANONICAL_REQUEST_QUERY_PARAMS = 5
    AWS_ST_HTTP_REQUEST_TRAILING_HEADERS = 6
end

"""
    aws_signed_body_header_type

Controls if signing adds a header containing the canonical request's body value
"""
@cenum aws_signed_body_header_type::UInt32 begin
    AWS_SBHT_NONE = 0
    AWS_SBHT_X_AMZ_CONTENT_SHA256 = 1
end

struct var"##Ctag#6002"
    use_double_uri_encode::UInt32
    should_normalize_uri_path::UInt32
    omit_session_token::UInt32
end
function Base.getproperty(x::Ptr{var"##Ctag#6002"}, f::Symbol)
    f === :use_double_uri_encode && return (Ptr{UInt32}(x + 0), 0, 1)
    f === :should_normalize_uri_path && return (Ptr{UInt32}(x + 0), 1, 1)
    f === :omit_session_token && return (Ptr{UInt32}(x + 0), 2, 1)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#6002", f::Symbol)
    r = Ref{var"##Ctag#6002"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#6002"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#6002"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


"""
    aws_signing_config_aws

A configuration structure for use in AWS-related signing. Currently covers sigv4 only, but is not required to.
"""
struct aws_signing_config_aws
    data::NTuple{256, UInt8}
end

function Base.getproperty(x::Ptr{aws_signing_config_aws}, f::Symbol)
    f === :config_type && return Ptr{aws_signing_config_type}(x + 0)
    f === :algorithm && return Ptr{aws_signing_algorithm}(x + 4)
    f === :signature_type && return Ptr{aws_signature_type}(x + 8)
    f === :region && return Ptr{aws_byte_cursor}(x + 16)
    f === :service && return Ptr{aws_byte_cursor}(x + 32)
    f === :date && return Ptr{aws_date_time}(x + 48)
    f === :should_sign_header && return Ptr{Ptr{Cvoid}}(x + 184)
    f === :should_sign_header_ud && return Ptr{Ptr{Cvoid}}(x + 192)
    f === :flags && return Ptr{var"##Ctag#6002"}(x + 200)
    f === :signed_body_value && return Ptr{aws_byte_cursor}(x + 208)
    f === :signed_body_header && return Ptr{aws_signed_body_header_type}(x + 224)
    f === :credentials && return Ptr{Ptr{aws_credentials}}(x + 232)
    f === :credentials_provider && return Ptr{Ptr{aws_credentials_provider}}(x + 240)
    f === :expiration_in_seconds && return Ptr{UInt64}(x + 248)
    return getfield(x, f)
end

function Base.getproperty(x::aws_signing_config_aws, f::Symbol)
    r = Ref{aws_signing_config_aws}(x)
    ptr = Base.unsafe_convert(Ptr{aws_signing_config_aws}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{aws_signing_config_aws}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    aws_signing_algorithm_to_string(algorithm)

Returns a c-string that describes the supplied signing algorithm

### Parameters
* `algorithm`: signing algorithm to get a friendly string name for
### Returns
friendly string name of the supplied algorithm, or "Unknown" if the algorithm is not recognized
### Prototype
```c
const char *aws_signing_algorithm_to_string(enum aws_signing_algorithm algorithm);
```
"""
function aws_signing_algorithm_to_string(algorithm)
    ccall((:aws_signing_algorithm_to_string, libawscrt), Ptr{Cchar}, (aws_signing_algorithm,), algorithm)
end

"""
    aws_validate_aws_signing_config_aws(config)

Checks a signing configuration for invalid settings combinations.

### Parameters
* `config`: signing configuration to validate
### Returns
- [`AWS_OP_SUCCESS`](@ref) if the configuration is valid, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_validate_aws_signing_config_aws(const struct aws_signing_config_aws *config);
```
"""
function aws_validate_aws_signing_config_aws(config)
    ccall((:aws_validate_aws_signing_config_aws, libawscrt), Cint, (Ptr{aws_signing_config_aws},), config)
end

struct aws_signing_result_property
    name::Ptr{aws_string}
    value::Ptr{aws_string}
end

"""
Hash table data structure. This module provides an automatically resizing hash table implementation for general purpose use. The hash table stores a mapping between void * keys and values; it is expected that in most cases, these will point to a structure elsewhere in the heap, instead of inlining a key or value into the hash table element itself.

Currently, this hash table implements a variant of robin hood hashing, but we do not guarantee that this won't change in the future.

Associated with each hash function are four callbacks:

hash\\_fn - A hash function from the keys to a uint64\\_t. It is critical that the hash function for a key does not change while the key is in the hash table; violating this results in undefined behavior. Collisions are tolerated, though naturally with reduced performance.

equals\\_fn - An equality comparison function. This function must be reflexive and consistent with hash\\_fn.

destroy\\_key\\_fn, destroy\\_value\\_fn - Optional callbacks invoked when the table is cleared or cleaned up and at the caller's option when an element is removed from the table. Either or both may be set to NULL, which has the same effect as a no-op destroy function.

This datastructure can be safely moved between threads, subject to the requirements of the underlying allocator. It is also safe to invoke non-mutating operations on the hash table from multiple threads. A suitable memory barrier must be used when transitioning from single-threaded mutating usage to multithreaded usage.
"""
mutable struct hash_table_state end

struct aws_hash_table
    p_impl::Ptr{hash_table_state}
end

"""
    aws_signing_result

A structure for tracking all the signer-requested changes to a signable. Interpreting these changes is signing-algorithm specific.

A signing result consists of

(1) Properties - A set of key-value pairs (2) Property Lists - A set of named key-value pair lists

The hope is that these two generic structures are enough to model the changes required by any generic message-signing algorithm.

Note that the key-value pairs of a signing\\_result are different types (but same intent) as the key-value pairs in the signable interface. This is because the signing result stands alone and owns its own copies of all values, whereas a signable can wrap an existing object and thus use non-owning references (like byte cursors) if appropriate to its implementation.
"""
struct aws_signing_result
    allocator::Ptr{aws_allocator}
    properties::aws_hash_table
    property_lists::aws_hash_table
end

"""
    aws_signing_result_init(result, allocator)

Initialize a signing result to its starting state

### Parameters
* `result`: signing result to initialize
* `allocator`: allocator to use for all memory allocation
### Returns
[`AWS_OP_SUCCESS`](@ref) if initialization was successful, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_signing_result_init(struct aws_signing_result *result, struct aws_allocator *allocator);
```
"""
function aws_signing_result_init(result, allocator)
    ccall((:aws_signing_result_init, libawscrt), Cint, (Ptr{aws_signing_result}, Ptr{aws_allocator}), result, allocator)
end

"""
    aws_signing_result_clean_up(result)

Clean up all resources held by the signing result

### Parameters
* `result`: signing result to clean up resources for
### Prototype
```c
void aws_signing_result_clean_up(struct aws_signing_result *result);
```
"""
function aws_signing_result_clean_up(result)
    ccall((:aws_signing_result_clean_up, libawscrt), Cvoid, (Ptr{aws_signing_result},), result)
end

"""
    aws_signing_result_set_property(result, property_name, property_value)

Sets the value of a property on a signing result

### Parameters
* `result`: signing result to modify
* `property_name`: name of the property to set
* `property_value`: value that the property should assume
### Returns
[`AWS_OP_SUCCESS`](@ref) if the set was successful, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_signing_result_set_property( struct aws_signing_result *result, const struct aws_string *property_name, const struct aws_byte_cursor *property_value);
```
"""
function aws_signing_result_set_property(result, property_name, property_value)
    ccall((:aws_signing_result_set_property, libawscrt), Cint, (Ptr{aws_signing_result}, Ptr{aws_string}, Ptr{aws_byte_cursor}), result, property_name, property_value)
end

"""
    aws_signing_result_get_property(result, property_name, out_property_value)

Gets the value of a property on a signing result

### Parameters
* `result`: signing result to query from
* `property_name`: name of the property to query the value of
* `out_property_value`: output parameter for the property value
### Returns
[`AWS_OP_SUCCESS`](@ref) if the get was successful, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_signing_result_get_property( const struct aws_signing_result *result, const struct aws_string *property_name, struct aws_string **out_property_value);
```
"""
function aws_signing_result_get_property(result, property_name, out_property_value)
    ccall((:aws_signing_result_get_property, libawscrt), Cint, (Ptr{aws_signing_result}, Ptr{aws_string}, Ptr{Ptr{aws_string}}), result, property_name, out_property_value)
end

"""
    aws_signing_result_append_property_list(result, list_name, property_name, property_value)

Adds a key-value pair to a named property list. If the named list does not yet exist, it will be created as an empty list before the pair is added. No uniqueness checks are made against existing pairs.

### Parameters
* `result`: signing result to modify
* `list_name`: name of the list to add the property key-value pair to
* `property_name`: key value of the key-value pair to append
* `property_value`: property value of the key-value pair to append
### Returns
[`AWS_OP_SUCCESS`](@ref) if the operation was successful, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_signing_result_append_property_list( struct aws_signing_result *result, const struct aws_string *list_name, const struct aws_byte_cursor *property_name, const struct aws_byte_cursor *property_value);
```
"""
function aws_signing_result_append_property_list(result, list_name, property_name, property_value)
    ccall((:aws_signing_result_append_property_list, libawscrt), Cint, (Ptr{aws_signing_result}, Ptr{aws_string}, Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}), result, list_name, property_name, property_value)
end

"""
    aws_signing_result_get_property_list(result, list_name, out_list)

Gets a named property list on the signing result. If the list does not exist, *out\\_list will be set to null

### Parameters
* `result`: signing result to query
* `list_name`: name of the list of key-value pairs to get
* `out_list`: output parameter for the list of key-value pairs
### Prototype
```c
void aws_signing_result_get_property_list( const struct aws_signing_result *result, const struct aws_string *list_name, struct aws_array_list **out_list);
```
"""
function aws_signing_result_get_property_list(result, list_name, out_list)
    ccall((:aws_signing_result_get_property_list, libawscrt), Cvoid, (Ptr{aws_signing_result}, Ptr{aws_string}, Ptr{Ptr{aws_array_list}}), result, list_name, out_list)
end

"""
    aws_signing_result_get_property_value_in_property_list(result, list_name, property_name, out_value)

Looks for a property within a named property list on the signing result. If the list does not exist, or the property does not exist within the list, *out\\_value will be set to NULL.

### Parameters
* `result`: signing result to query
* `list_name`: name of the list of key-value pairs to search through for the property
* `property_name`: name of the property to search for within the list
* `out_value`: output parameter for the property value, if found
### Prototype
```c
void aws_signing_result_get_property_value_in_property_list( const struct aws_signing_result *result, const struct aws_string *list_name, const struct aws_string *property_name, struct aws_string **out_value);
```
"""
function aws_signing_result_get_property_value_in_property_list(result, list_name, property_name, out_value)
    ccall((:aws_signing_result_get_property_value_in_property_list, libawscrt), Cvoid, (Ptr{aws_signing_result}, Ptr{aws_string}, Ptr{aws_string}, Ptr{Ptr{aws_string}}), result, list_name, property_name, out_value)
end

"""
    aws_apply_signing_result_to_http_request(request, allocator, result)

### Prototype
```c
int aws_apply_signing_result_to_http_request( struct aws_http_message *request, struct aws_allocator *allocator, const struct aws_signing_result *result);
```
"""
function aws_apply_signing_result_to_http_request(request, allocator, result)
    ccall((:aws_apply_signing_result_to_http_request, libawscrt), Cint, (Ptr{aws_http_message}, Ptr{aws_allocator}, Ptr{aws_signing_result}), request, allocator, result)
end

@cenum aws_cal_errors::UInt32 begin
    AWS_ERROR_CAL_SIGNATURE_VALIDATION_FAILED = 7168
    AWS_ERROR_CAL_MISSING_REQUIRED_KEY_COMPONENT = 7169
    AWS_ERROR_CAL_INVALID_KEY_LENGTH_FOR_ALGORITHM = 7170
    AWS_ERROR_CAL_UNKNOWN_OBJECT_IDENTIFIER = 7171
    AWS_ERROR_CAL_MALFORMED_ASN1_ENCOUNTERED = 7172
    AWS_ERROR_CAL_MISMATCHED_DER_TYPE = 7173
    AWS_ERROR_CAL_UNSUPPORTED_ALGORITHM = 7174
    AWS_ERROR_CAL_END_RANGE = 8191
end

@cenum aws_cal_log_subject::UInt32 begin
    AWS_LS_CAL_GENERAL = 7168
    AWS_LS_CAL_ECC = 7169
    AWS_LS_CAL_HASH = 7170
    AWS_LS_CAL_HMAC = 7171
    AWS_LS_CAL_DER = 7172
    AWS_LS_CAL_LIBCRYPTO_RESOLVE = 7173
    AWS_LS_CAL_LAST = 8191
end

"""
    aws_cal_library_init(allocator)

### Prototype
```c
void aws_cal_library_init(struct aws_allocator *allocator);
```
"""
function aws_cal_library_init(allocator)
    ccall((:aws_cal_library_init, libawscrt), Cvoid, (Ptr{aws_allocator},), allocator)
end

"""
    aws_cal_library_clean_up()

### Prototype
```c
void aws_cal_library_clean_up(void);
```
"""
function aws_cal_library_clean_up()
    ccall((:aws_cal_library_clean_up, libawscrt), Cvoid, ())
end

# typedef void aws_ecc_key_pair_destroy_fn ( struct aws_ecc_key_pair * key_pair )
const aws_ecc_key_pair_destroy_fn = Cvoid

# typedef int aws_ecc_key_pair_sign_message_fn ( const struct aws_ecc_key_pair * key_pair , const struct aws_byte_cursor * message , struct aws_byte_buf * signature_output )
const aws_ecc_key_pair_sign_message_fn = Cvoid

# typedef int aws_ecc_key_pair_derive_public_key_fn ( struct aws_ecc_key_pair * key_pair )
const aws_ecc_key_pair_derive_public_key_fn = Cvoid

# typedef int aws_ecc_key_pair_verify_signature_fn ( const struct aws_ecc_key_pair * signer , const struct aws_byte_cursor * message , const struct aws_byte_cursor * signature )
const aws_ecc_key_pair_verify_signature_fn = Cvoid

# typedef size_t aws_ecc_key_pair_signature_length_fn ( const struct aws_ecc_key_pair * signer )
const aws_ecc_key_pair_signature_length_fn = Cvoid

"""
    aws_ecc_key_pair_acquire(key_pair)

Adds one to an ecc key pair's ref count.

### Prototype
```c
void aws_ecc_key_pair_acquire(struct aws_ecc_key_pair *key_pair);
```
"""
function aws_ecc_key_pair_acquire(key_pair)
    ccall((:aws_ecc_key_pair_acquire, libawscrt), Cvoid, (Ptr{aws_ecc_key_pair},), key_pair)
end

"""
    aws_ecc_key_pair_release(key_pair)

Subtracts one from an ecc key pair's ref count. If ref count reaches zero, the key pair is destroyed.

### Prototype
```c
void aws_ecc_key_pair_release(struct aws_ecc_key_pair *key_pair);
```
"""
function aws_ecc_key_pair_release(key_pair)
    ccall((:aws_ecc_key_pair_release, libawscrt), Cvoid, (Ptr{aws_ecc_key_pair},), key_pair)
end

"""
    aws_ecc_key_pair_new_from_private_key(allocator, curve_name, priv_key)

Creates a Eliptic Curve private key that can be used for signing. Returns a new instance of [`aws_ecc_key_pair`](@ref) if the key was successfully built. Otherwise returns NULL. Note: priv\\_key::len must match the appropriate length for the selected curve\\_name.

### Prototype
```c
struct aws_ecc_key_pair *aws_ecc_key_pair_new_from_private_key( struct aws_allocator *allocator, enum aws_ecc_curve_name curve_name, const struct aws_byte_cursor *priv_key);
```
"""
function aws_ecc_key_pair_new_from_private_key(allocator, curve_name, priv_key)
    ccall((:aws_ecc_key_pair_new_from_private_key, libawscrt), Ptr{aws_ecc_key_pair}, (Ptr{aws_allocator}, aws_ecc_curve_name, Ptr{aws_byte_cursor}), allocator, curve_name, priv_key)
end

"""
    aws_ecc_key_pair_new_generate_random(allocator, curve_name)

Creates a Eliptic Curve public/private key pair that can be used for signing and verifying. Returns a new instance of [`aws_ecc_key_pair`](@ref) if the key was successfully built. Otherwise returns NULL.

### Prototype
```c
struct aws_ecc_key_pair *aws_ecc_key_pair_new_generate_random( struct aws_allocator *allocator, enum aws_ecc_curve_name curve_name);
```
"""
function aws_ecc_key_pair_new_generate_random(allocator, curve_name)
    ccall((:aws_ecc_key_pair_new_generate_random, libawscrt), Ptr{aws_ecc_key_pair}, (Ptr{aws_allocator}, aws_ecc_curve_name), allocator, curve_name)
end

"""
    aws_ecc_key_pair_new_from_public_key(allocator, curve_name, public_key_x, public_key_y)

Creates a Eliptic Curve public key that can be used for verifying. Returns a new instance of [`aws_ecc_key_pair`](@ref) if the key was successfully built. Otherwise returns NULL. Note: public\\_key\\_x::len and public\\_key\\_y::len must match the appropriate length for the selected curve\\_name.

### Prototype
```c
struct aws_ecc_key_pair *aws_ecc_key_pair_new_from_public_key( struct aws_allocator *allocator, enum aws_ecc_curve_name curve_name, const struct aws_byte_cursor *public_key_x, const struct aws_byte_cursor *public_key_y);
```
"""
function aws_ecc_key_pair_new_from_public_key(allocator, curve_name, public_key_x, public_key_y)
    ccall((:aws_ecc_key_pair_new_from_public_key, libawscrt), Ptr{aws_ecc_key_pair}, (Ptr{aws_allocator}, aws_ecc_curve_name, Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}), allocator, curve_name, public_key_x, public_key_y)
end

"""
    aws_ecc_key_pair_new_from_asn1(allocator, encoded_keys)

Creates a Eliptic Curve public/private key pair from a DER encoded key pair. Returns a new instance of [`aws_ecc_key_pair`](@ref) if the key was successfully built. Otherwise returns NULL. Whether or not signing or verification can be perform depends on if encoded\\_keys is a public/private pair or a public key.

### Prototype
```c
struct aws_ecc_key_pair *aws_ecc_key_pair_new_from_asn1( struct aws_allocator *allocator, const struct aws_byte_cursor *encoded_keys);
```
"""
function aws_ecc_key_pair_new_from_asn1(allocator, encoded_keys)
    ccall((:aws_ecc_key_pair_new_from_asn1, libawscrt), Ptr{aws_ecc_key_pair}, (Ptr{aws_allocator}, Ptr{aws_byte_cursor}), allocator, encoded_keys)
end

"""
    aws_ecc_key_new_from_hex_coordinates(allocator, curve_name, pub_x_hex_cursor, pub_y_hex_cursor)

Creates an Elliptic curve public key from x and y coordinates encoded as hex strings Returns a new instance of [`aws_ecc_key_pair`](@ref) if the key was successfully built. Otherwise returns NULL.

### Prototype
```c
struct aws_ecc_key_pair *aws_ecc_key_new_from_hex_coordinates( struct aws_allocator *allocator, enum aws_ecc_curve_name curve_name, struct aws_byte_cursor pub_x_hex_cursor, struct aws_byte_cursor pub_y_hex_cursor);
```
"""
function aws_ecc_key_new_from_hex_coordinates(allocator, curve_name, pub_x_hex_cursor, pub_y_hex_cursor)
    ccall((:aws_ecc_key_new_from_hex_coordinates, libawscrt), Ptr{aws_ecc_key_pair}, (Ptr{aws_allocator}, aws_ecc_curve_name, aws_byte_cursor, aws_byte_cursor), allocator, curve_name, pub_x_hex_cursor, pub_y_hex_cursor)
end

"""
    aws_ecc_key_pair_derive_public_key(key_pair)

Derives a public key from the private key if supported by this operating system (not supported on OSX). key\\_pair::pub\\_x and key\\_pair::pub\\_y will be set with the raw key buffers.

### Prototype
```c
int aws_ecc_key_pair_derive_public_key(struct aws_ecc_key_pair *key_pair);
```
"""
function aws_ecc_key_pair_derive_public_key(key_pair)
    ccall((:aws_ecc_key_pair_derive_public_key, libawscrt), Cint, (Ptr{aws_ecc_key_pair},), key_pair)
end

"""
    aws_ecc_curve_name_from_oid(oid, curve_name)

Get the curve name from the oid. OID here is the payload of the DER encoded ASN.1 part (doesn't include type specifier or length. On success, the value of curve\\_name will be set.

### Prototype
```c
int aws_ecc_curve_name_from_oid(struct aws_byte_cursor *oid, enum aws_ecc_curve_name *curve_name);
```
"""
function aws_ecc_curve_name_from_oid(oid, curve_name)
    ccall((:aws_ecc_curve_name_from_oid, libawscrt), Cint, (Ptr{aws_byte_cursor}, Ptr{aws_ecc_curve_name}), oid, curve_name)
end

"""
    aws_ecc_oid_from_curve_name(curve_name, oid)

Get the DER encoded OID from the curve\\_name. The OID in this case will not contain the type or the length specifier.

### Prototype
```c
int aws_ecc_oid_from_curve_name(enum aws_ecc_curve_name curve_name, struct aws_byte_cursor *oid);
```
"""
function aws_ecc_oid_from_curve_name(curve_name, oid)
    ccall((:aws_ecc_oid_from_curve_name, libawscrt), Cint, (aws_ecc_curve_name, Ptr{aws_byte_cursor}), curve_name, oid)
end

"""
    aws_ecc_key_pair_sign_message(key_pair, message, signature)

Uses the key\\_pair's private key to sign message. The output will be in signature. Signature must be large enough to hold the signature. Check [`aws_ecc_key_pair_signature_length`](@ref)() for the appropriate size. Signature will be DER encoded.

It is the callers job to make sure message is the appropriate cryptographic digest for this operation. It's usually something like a SHA256.

### Prototype
```c
int aws_ecc_key_pair_sign_message( const struct aws_ecc_key_pair *key_pair, const struct aws_byte_cursor *message, struct aws_byte_buf *signature);
```
"""
function aws_ecc_key_pair_sign_message(key_pair, message, signature)
    ccall((:aws_ecc_key_pair_sign_message, libawscrt), Cint, (Ptr{aws_ecc_key_pair}, Ptr{aws_byte_cursor}, Ptr{aws_byte_buf}), key_pair, message, signature)
end

"""
    aws_ecc_key_pair_verify_signature(key_pair, message, signature)

Uses the key\\_pair's public key to verify signature of message. Signature should be DER encoded.

It is the callers job to make sure message is the appropriate cryptographic digest for this operation. It's usually something like a SHA256.

returns [`AWS_OP_SUCCESS`](@ref) if the signature is valid.

### Prototype
```c
int aws_ecc_key_pair_verify_signature( const struct aws_ecc_key_pair *key_pair, const struct aws_byte_cursor *message, const struct aws_byte_cursor *signature);
```
"""
function aws_ecc_key_pair_verify_signature(key_pair, message, signature)
    ccall((:aws_ecc_key_pair_verify_signature, libawscrt), Cint, (Ptr{aws_ecc_key_pair}, Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}), key_pair, message, signature)
end

"""
    aws_ecc_key_pair_signature_length(key_pair)

### Prototype
```c
size_t aws_ecc_key_pair_signature_length(const struct aws_ecc_key_pair *key_pair);
```
"""
function aws_ecc_key_pair_signature_length(key_pair)
    ccall((:aws_ecc_key_pair_signature_length, libawscrt), Csize_t, (Ptr{aws_ecc_key_pair},), key_pair)
end

"""
    aws_ecc_key_pair_get_public_key(key_pair, pub_x, pub_y)

### Prototype
```c
void aws_ecc_key_pair_get_public_key( const struct aws_ecc_key_pair *key_pair, struct aws_byte_cursor *pub_x, struct aws_byte_cursor *pub_y);
```
"""
function aws_ecc_key_pair_get_public_key(key_pair, pub_x, pub_y)
    ccall((:aws_ecc_key_pair_get_public_key, libawscrt), Cvoid, (Ptr{aws_ecc_key_pair}, Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}), key_pair, pub_x, pub_y)
end

"""
    aws_ecc_key_pair_get_private_key(key_pair, private_d)

### Prototype
```c
void aws_ecc_key_pair_get_private_key( const struct aws_ecc_key_pair *key_pair, struct aws_byte_cursor *private_d);
```
"""
function aws_ecc_key_pair_get_private_key(key_pair, private_d)
    ccall((:aws_ecc_key_pair_get_private_key, libawscrt), Cvoid, (Ptr{aws_ecc_key_pair}, Ptr{aws_byte_cursor}), key_pair, private_d)
end

"""
    aws_ecc_key_coordinate_byte_size_from_curve_name(curve_name)

### Prototype
```c
size_t aws_ecc_key_coordinate_byte_size_from_curve_name(enum aws_ecc_curve_name curve_name);
```
"""
function aws_ecc_key_coordinate_byte_size_from_curve_name(curve_name)
    ccall((:aws_ecc_key_coordinate_byte_size_from_curve_name, libawscrt), Csize_t, (aws_ecc_curve_name,), curve_name)
end

struct aws_hash_vtable
    alg_name::Ptr{Cchar}
    provider::Ptr{Cchar}
    destroy::Ptr{Cvoid}
    update::Ptr{Cvoid}
    finalize::Ptr{Cvoid}
end

struct aws_hash
    allocator::Ptr{aws_allocator}
    vtable::Ptr{aws_hash_vtable}
    digest_size::Csize_t
    good::Bool
    impl::Ptr{Cvoid}
end

# typedef struct aws_hash * ( aws_hash_new_fn ) ( struct aws_allocator * allocator )
const aws_hash_new_fn = Cvoid

"""
    aws_sha256_new(allocator)

Allocates and initializes a sha256 hash instance.

### Prototype
```c
struct aws_hash *aws_sha256_new(struct aws_allocator *allocator);
```
"""
function aws_sha256_new(allocator)
    ccall((:aws_sha256_new, libawscrt), Ptr{aws_hash}, (Ptr{aws_allocator},), allocator)
end

"""
    aws_sha1_new(allocator)

Allocates and initializes a sha1 hash instance.

### Prototype
```c
struct aws_hash *aws_sha1_new(struct aws_allocator *allocator);
```
"""
function aws_sha1_new(allocator)
    ccall((:aws_sha1_new, libawscrt), Ptr{aws_hash}, (Ptr{aws_allocator},), allocator)
end

"""
    aws_md5_new(allocator)

Allocates and initializes an md5 hash instance.

### Prototype
```c
struct aws_hash *aws_md5_new(struct aws_allocator *allocator);
```
"""
function aws_md5_new(allocator)
    ccall((:aws_md5_new, libawscrt), Ptr{aws_hash}, (Ptr{aws_allocator},), allocator)
end

"""
    aws_hash_destroy(hash)

Cleans up and deallocates hash.

### Prototype
```c
void aws_hash_destroy(struct aws_hash *hash);
```
"""
function aws_hash_destroy(hash)
    ccall((:aws_hash_destroy, libawscrt), Cvoid, (Ptr{aws_hash},), hash)
end

"""
    aws_hash_update(hash, to_hash)

Updates the running hash with to\\_hash. this can be called multiple times.

### Prototype
```c
int aws_hash_update(struct aws_hash *hash, const struct aws_byte_cursor *to_hash);
```
"""
function aws_hash_update(hash, to_hash)
    ccall((:aws_hash_update, libawscrt), Cint, (Ptr{aws_hash}, Ptr{aws_byte_cursor}), hash, to_hash)
end

"""
    aws_hash_finalize(hash, output, truncate_to)

Completes the hash computation and writes the final digest to output. Allocation of output is the caller's responsibility. If you specify truncate\\_to to something other than 0, the output will be truncated to that number of bytes. For example, if you want a SHA256 digest as the first 16 bytes, set truncate\\_to to 16. If you want the full digest size, just set this to 0.

### Prototype
```c
int aws_hash_finalize(struct aws_hash *hash, struct aws_byte_buf *output, size_t truncate_to);
```
"""
function aws_hash_finalize(hash, output, truncate_to)
    ccall((:aws_hash_finalize, libawscrt), Cint, (Ptr{aws_hash}, Ptr{aws_byte_buf}, Csize_t), hash, output, truncate_to)
end

"""
    aws_md5_compute(allocator, input, output, truncate_to)

Computes the md5 hash over input and writes the digest output to 'output'. Use this if you don't need to stream the data you're hashing and you can load the entire input to hash into memory.

### Prototype
```c
int aws_md5_compute( struct aws_allocator *allocator, const struct aws_byte_cursor *input, struct aws_byte_buf *output, size_t truncate_to);
```
"""
function aws_md5_compute(allocator, input, output, truncate_to)
    ccall((:aws_md5_compute, libawscrt), Cint, (Ptr{aws_allocator}, Ptr{aws_byte_cursor}, Ptr{aws_byte_buf}, Csize_t), allocator, input, output, truncate_to)
end

"""
    aws_sha256_compute(allocator, input, output, truncate_to)

Computes the sha256 hash over input and writes the digest output to 'output'. Use this if you don't need to stream the data you're hashing and you can load the entire input to hash into memory. If you specify truncate\\_to to something other than 0, the output will be truncated to that number of bytes. For example, if you want a SHA256 digest as the first 16 bytes, set truncate\\_to to 16. If you want the full digest size, just set this to 0.

### Prototype
```c
int aws_sha256_compute( struct aws_allocator *allocator, const struct aws_byte_cursor *input, struct aws_byte_buf *output, size_t truncate_to);
```
"""
function aws_sha256_compute(allocator, input, output, truncate_to)
    ccall((:aws_sha256_compute, libawscrt), Cint, (Ptr{aws_allocator}, Ptr{aws_byte_cursor}, Ptr{aws_byte_buf}, Csize_t), allocator, input, output, truncate_to)
end

"""
    aws_sha1_compute(allocator, input, output, truncate_to)

Computes the sha1 hash over input and writes the digest output to 'output'. Use this if you don't need to stream the data you're hashing and you can load the entire input to hash into memory. If you specify truncate\\_to to something other than 0, the output will be truncated to that number of bytes. For example, if you want a SHA1 digest as the first 16 bytes, set truncate\\_to to 16. If you want the full digest size, just set this to 0.

### Prototype
```c
int aws_sha1_compute( struct aws_allocator *allocator, const struct aws_byte_cursor *input, struct aws_byte_buf *output, size_t truncate_to);
```
"""
function aws_sha1_compute(allocator, input, output, truncate_to)
    ccall((:aws_sha1_compute, libawscrt), Cint, (Ptr{aws_allocator}, Ptr{aws_byte_cursor}, Ptr{aws_byte_buf}, Csize_t), allocator, input, output, truncate_to)
end

"""
    aws_set_md5_new_fn(fn)

Set the implementation of md5 to use. If you compiled without BYO\\_CRYPTO, you do not need to call this. However, if use this, we will honor it, regardless of compile options. This may be useful for testing purposes. If you did set BYO\\_CRYPTO, and you do not call this function you will segfault.

### Prototype
```c
void aws_set_md5_new_fn(aws_hash_new_fn *fn);
```
"""
function aws_set_md5_new_fn(fn)
    ccall((:aws_set_md5_new_fn, libawscrt), Cvoid, (Ptr{Cvoid},), fn)
end

"""
    aws_set_sha256_new_fn(fn)

Set the implementation of sha256 to use. If you compiled without BYO\\_CRYPTO, you do not need to call this. However, if use this, we will honor it, regardless of compile options. This may be useful for testing purposes. If you did set BYO\\_CRYPTO, and you do not call this function you will segfault.

### Prototype
```c
void aws_set_sha256_new_fn(aws_hash_new_fn *fn);
```
"""
function aws_set_sha256_new_fn(fn)
    ccall((:aws_set_sha256_new_fn, libawscrt), Cvoid, (Ptr{Cvoid},), fn)
end

"""
    aws_set_sha1_new_fn(fn)

Set the implementation of sha1 to use. If you compiled without BYO\\_CRYPTO, you do not need to call this. However, if use this, we will honor it, regardless of compile options. This may be useful for testing purposes. If you did set BYO\\_CRYPTO, and you do not call this function you will segfault.

### Prototype
```c
void aws_set_sha1_new_fn(aws_hash_new_fn *fn);
```
"""
function aws_set_sha1_new_fn(fn)
    ccall((:aws_set_sha1_new_fn, libawscrt), Cvoid, (Ptr{Cvoid},), fn)
end

struct aws_hmac_vtable
    alg_name::Ptr{Cchar}
    provider::Ptr{Cchar}
    destroy::Ptr{Cvoid}
    update::Ptr{Cvoid}
    finalize::Ptr{Cvoid}
end

struct aws_hmac
    allocator::Ptr{aws_allocator}
    vtable::Ptr{aws_hmac_vtable}
    digest_size::Csize_t
    good::Bool
    impl::Ptr{Cvoid}
end

# typedef struct aws_hmac * ( aws_hmac_new_fn ) ( struct aws_allocator * allocator , const struct aws_byte_cursor * secret )
const aws_hmac_new_fn = Cvoid

"""
    aws_sha256_hmac_new(allocator, secret)

Allocates and initializes a sha256 hmac instance. Secret is the key to be used for the hmac process.

### Prototype
```c
struct aws_hmac *aws_sha256_hmac_new(struct aws_allocator *allocator, const struct aws_byte_cursor *secret);
```
"""
function aws_sha256_hmac_new(allocator, secret)
    ccall((:aws_sha256_hmac_new, libawscrt), Ptr{aws_hmac}, (Ptr{aws_allocator}, Ptr{aws_byte_cursor}), allocator, secret)
end

"""
    aws_hmac_destroy(hmac)

Cleans up and deallocates hmac.

### Prototype
```c
void aws_hmac_destroy(struct aws_hmac *hmac);
```
"""
function aws_hmac_destroy(hmac)
    ccall((:aws_hmac_destroy, libawscrt), Cvoid, (Ptr{aws_hmac},), hmac)
end

"""
    aws_hmac_update(hmac, to_hmac)

Updates the running hmac with to\\_hash. this can be called multiple times.

### Prototype
```c
int aws_hmac_update(struct aws_hmac *hmac, const struct aws_byte_cursor *to_hmac);
```
"""
function aws_hmac_update(hmac, to_hmac)
    ccall((:aws_hmac_update, libawscrt), Cint, (Ptr{aws_hmac}, Ptr{aws_byte_cursor}), hmac, to_hmac)
end

"""
    aws_hmac_finalize(hmac, output, truncate_to)

Completes the hmac computation and writes the final digest to output. Allocation of output is the caller's responsibility. If you specify truncate\\_to to something other than 0, the output will be truncated to that number of bytes. For example if you want a SHA256 digest as the first 16 bytes, set truncate\\_to to 16. If you want the full digest size, just set this to 0.

### Prototype
```c
int aws_hmac_finalize(struct aws_hmac *hmac, struct aws_byte_buf *output, size_t truncate_to);
```
"""
function aws_hmac_finalize(hmac, output, truncate_to)
    ccall((:aws_hmac_finalize, libawscrt), Cint, (Ptr{aws_hmac}, Ptr{aws_byte_buf}, Csize_t), hmac, output, truncate_to)
end

"""
    aws_sha256_hmac_compute(allocator, secret, to_hmac, output, truncate_to)

Computes the sha256 hmac over input and writes the digest output to 'output'. Use this if you don't need to stream the data you're hashing and you can load the entire input to hash into memory. If you specify truncate\\_to to something other than 0, the output will be truncated to that number of bytes. For example if you want a SHA256 HMAC digest as the first 16 bytes, set truncate\\_to to 16. If you want the full digest size, just set this to 0.

### Prototype
```c
int aws_sha256_hmac_compute( struct aws_allocator *allocator, const struct aws_byte_cursor *secret, const struct aws_byte_cursor *to_hmac, struct aws_byte_buf *output, size_t truncate_to);
```
"""
function aws_sha256_hmac_compute(allocator, secret, to_hmac, output, truncate_to)
    ccall((:aws_sha256_hmac_compute, libawscrt), Cint, (Ptr{aws_allocator}, Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}, Ptr{aws_byte_buf}, Csize_t), allocator, secret, to_hmac, output, truncate_to)
end

"""
    aws_set_sha256_hmac_new_fn(fn)

Set the implementation of sha256 hmac to use. If you compiled without BYO\\_CRYPTO, you do not need to call this. However, if use this, we will honor it, regardless of compile options. This may be useful for testing purposes. If you did set BYO\\_CRYPTO, and you do not call this function you will segfault.

### Prototype
```c
void aws_set_sha256_hmac_new_fn(aws_hmac_new_fn *fn);
```
"""
function aws_set_sha256_hmac_new_fn(fn)
    ccall((:aws_set_sha256_hmac_new_fn, libawscrt), Cvoid, (Ptr{Cvoid},), fn)
end

"""
    aws_checksums_crc32(input, length, previousCrc32)

The entry point function to perform a CRC32 (Ethernet, gzip) computation. Selects a suitable implementation based on hardware capabilities. Pass 0 in the previousCrc32 parameter as an initial value unless continuing to update a running crc in a subsequent call.

### Prototype
```c
uint32_t aws_checksums_crc32(const uint8_t *input, int length, uint32_t previousCrc32);
```
"""
function aws_checksums_crc32(input, length, previousCrc32)
    ccall((:aws_checksums_crc32, libawscrt), UInt32, (Ptr{UInt8}, Cint, UInt32), input, length, previousCrc32)
end

"""
    aws_checksums_crc32c(input, length, previousCrc32)

The entry point function to perform a Castagnoli CRC32c (iSCSI) computation. Selects a suitable implementation based on hardware capabilities. Pass 0 in the previousCrc32 parameter as an initial value unless continuing to update a running crc in a subsequent call.

### Prototype
```c
uint32_t aws_checksums_crc32c(const uint8_t *input, int length, uint32_t previousCrc32);
```
"""
function aws_checksums_crc32c(input, length, previousCrc32)
    ccall((:aws_checksums_crc32c, libawscrt), UInt32, (Ptr{UInt8}, Cint, UInt32), input, length, previousCrc32)
end

"""
    aws_allocator_is_valid(alloc)

Inexpensive (constant time) check of data-structure invariants.

### Prototype
```c
bool aws_allocator_is_valid(const struct aws_allocator *alloc);
```
"""
function aws_allocator_is_valid(alloc)
    ccall((:aws_allocator_is_valid, libawscrt), Bool, (Ptr{aws_allocator},), alloc)
end

"""
    aws_default_allocator()

### Prototype
```c
struct aws_allocator *aws_default_allocator(void);
```
"""
function aws_default_allocator()
    ccall((:aws_default_allocator, libawscrt), Ptr{aws_allocator}, ())
end

"""
    aws_mem_acquire(allocator, size)

Returns at least `size` of memory ready for usage. In versions v0.6.8 and prior, this function was allowed to return NULL. In later versions, if allocator->mem\\_acquire() returns NULL, this function will assert and exit. To handle conditions where OOM is not a fatal error, allocator->mem\\_acquire() is responsible for finding/reclaiming/running a GC etc...before returning.

### Prototype
```c
void *aws_mem_acquire(struct aws_allocator *allocator, size_t size);
```
"""
function aws_mem_acquire(allocator, size)
    ccall((:aws_mem_acquire, libawscrt), Ptr{Cvoid}, (Ptr{aws_allocator}, Csize_t), allocator, size)
end

"""
    aws_mem_calloc(allocator, num, size)

Allocates a block of memory for an array of num elements, each of them size bytes long, and initializes all its bits to zero. In versions v0.6.8 and prior, this function was allowed to return NULL. In later versions, if allocator->mem\\_calloc() returns NULL, this function will assert and exit. To handle conditions where OOM is not a fatal error, allocator->mem\\_calloc() is responsible for finding/reclaiming/running a GC etc...before returning.

### Prototype
```c
void *aws_mem_calloc(struct aws_allocator *allocator, size_t num, size_t size);
```
"""
function aws_mem_calloc(allocator, num, size)
    ccall((:aws_mem_calloc, libawscrt), Ptr{Cvoid}, (Ptr{aws_allocator}, Csize_t, Csize_t), allocator, num, size)
end

"""
    aws_mem_release(allocator, ptr)

Releases ptr back to whatever allocated it. Nothing happens if ptr is NULL.

### Prototype
```c
void aws_mem_release(struct aws_allocator *allocator, void *ptr);
```
"""
function aws_mem_release(allocator, ptr)
    ccall((:aws_mem_release, libawscrt), Cvoid, (Ptr{aws_allocator}, Ptr{Cvoid}), allocator, ptr)
end

"""
    aws_mem_realloc(allocator, ptr, oldsize, newsize)

Attempts to adjust the size of the pointed-to memory buffer from oldsize to newsize. The pointer (*ptr) may be changed if the memory needs to be reallocated.

In versions v0.6.8 and prior, this function was allowed to return NULL. In later versions, if allocator->mem\\_realloc() returns NULL, this function will assert and exit. To handle conditions where OOM is not a fatal error, allocator->mem\\_realloc() is responsible for finding/reclaiming/running a GC etc...before returning.

### Prototype
```c
int aws_mem_realloc(struct aws_allocator *allocator, void **ptr, size_t oldsize, size_t newsize);
```
"""
function aws_mem_realloc(allocator, ptr, oldsize, newsize)
    ccall((:aws_mem_realloc, libawscrt), Cint, (Ptr{aws_allocator}, Ptr{Ptr{Cvoid}}, Csize_t, Csize_t), allocator, ptr, oldsize, newsize)
end

@cenum aws_mem_trace_level::UInt32 begin
    AWS_MEMTRACE_NONE = 0
    AWS_MEMTRACE_BYTES = 1
    AWS_MEMTRACE_STACKS = 2
end

"""
    aws_mem_tracer_new(allocator, deprecated, level, frames_per_stack)

### Prototype
```c
struct aws_allocator *aws_mem_tracer_new( struct aws_allocator *allocator, struct aws_allocator *deprecated, enum aws_mem_trace_level level, size_t frames_per_stack);
```
"""
function aws_mem_tracer_new(allocator, deprecated, level, frames_per_stack)
    ccall((:aws_mem_tracer_new, libawscrt), Ptr{aws_allocator}, (Ptr{aws_allocator}, Ptr{aws_allocator}, aws_mem_trace_level, Csize_t), allocator, deprecated, level, frames_per_stack)
end

"""
    aws_mem_tracer_destroy(trace_allocator)

### Prototype
```c
struct aws_allocator *aws_mem_tracer_destroy(struct aws_allocator *trace_allocator);
```
"""
function aws_mem_tracer_destroy(trace_allocator)
    ccall((:aws_mem_tracer_destroy, libawscrt), Ptr{aws_allocator}, (Ptr{aws_allocator},), trace_allocator)
end

"""
    aws_mem_tracer_dump(trace_allocator)

### Prototype
```c
void aws_mem_tracer_dump(struct aws_allocator *trace_allocator);
```
"""
function aws_mem_tracer_dump(trace_allocator)
    ccall((:aws_mem_tracer_dump, libawscrt), Cvoid, (Ptr{aws_allocator},), trace_allocator)
end

"""
    aws_mem_tracer_bytes(trace_allocator)

### Prototype
```c
size_t aws_mem_tracer_bytes(struct aws_allocator *trace_allocator);
```
"""
function aws_mem_tracer_bytes(trace_allocator)
    ccall((:aws_mem_tracer_bytes, libawscrt), Csize_t, (Ptr{aws_allocator},), trace_allocator)
end

"""
    aws_mem_tracer_count(trace_allocator)

### Prototype
```c
size_t aws_mem_tracer_count(struct aws_allocator *trace_allocator);
```
"""
function aws_mem_tracer_count(trace_allocator)
    ccall((:aws_mem_tracer_count, libawscrt), Csize_t, (Ptr{aws_allocator},), trace_allocator)
end

"""
    aws_small_block_allocator_new(allocator, multi_threaded)

### Prototype
```c
struct aws_allocator *aws_small_block_allocator_new(struct aws_allocator *allocator, bool multi_threaded);
```
"""
function aws_small_block_allocator_new(allocator, multi_threaded)
    ccall((:aws_small_block_allocator_new, libawscrt), Ptr{aws_allocator}, (Ptr{aws_allocator}, Bool), allocator, multi_threaded)
end

"""
    aws_small_block_allocator_destroy(sba_allocator)

### Prototype
```c
void aws_small_block_allocator_destroy(struct aws_allocator *sba_allocator);
```
"""
function aws_small_block_allocator_destroy(sba_allocator)
    ccall((:aws_small_block_allocator_destroy, libawscrt), Cvoid, (Ptr{aws_allocator},), sba_allocator)
end

"""
    aws_small_block_allocator_bytes_active(sba_allocator)

### Prototype
```c
size_t aws_small_block_allocator_bytes_active(struct aws_allocator *sba_allocator);
```
"""
function aws_small_block_allocator_bytes_active(sba_allocator)
    ccall((:aws_small_block_allocator_bytes_active, libawscrt), Csize_t, (Ptr{aws_allocator},), sba_allocator)
end

"""
    aws_small_block_allocator_bytes_reserved(sba_allocator)

### Prototype
```c
size_t aws_small_block_allocator_bytes_reserved(struct aws_allocator *sba_allocator);
```
"""
function aws_small_block_allocator_bytes_reserved(sba_allocator)
    ccall((:aws_small_block_allocator_bytes_reserved, libawscrt), Csize_t, (Ptr{aws_allocator},), sba_allocator)
end

"""
    aws_small_block_allocator_page_size(sba_allocator)

### Prototype
```c
size_t aws_small_block_allocator_page_size(struct aws_allocator *sba_allocator);
```
"""
function aws_small_block_allocator_page_size(sba_allocator)
    ccall((:aws_small_block_allocator_page_size, libawscrt), Csize_t, (Ptr{aws_allocator},), sba_allocator)
end

# typedef int ( aws_array_list_comparator_fn ) ( const void * a , const void * b )
"""
Prototype for a comparator function for sorting elements.

a and b should be cast to pointers to the element type held in the list before being dereferenced. The function should compare the elements and return a positive number if a > b, zero if a = b, and a negative number if a < b.
"""
const aws_array_list_comparator_fn = Cvoid

"""
    aws_array_list_shrink_to_fit(list)

If in dynamic mode, shrinks the allocated array size to the minimum amount necessary to store its elements.

### Prototype
```c
int aws_array_list_shrink_to_fit(struct aws_array_list *AWS_RESTRICT list);
```
"""
function aws_array_list_shrink_to_fit(list)
    ccall((:aws_array_list_shrink_to_fit, libawscrt), Cint, (Ptr{aws_array_list},), list)
end

"""
    aws_array_list_copy(from, to)

Copies the elements from from to to. If to is in static mode, it must at least be the same length as from. Any data in to will be overwritten in this copy.

### Prototype
```c
int aws_array_list_copy(const struct aws_array_list *AWS_RESTRICT from, struct aws_array_list *AWS_RESTRICT to);
```
"""
function aws_array_list_copy(from, to)
    ccall((:aws_array_list_copy, libawscrt), Cint, (Ptr{aws_array_list}, Ptr{aws_array_list}), from, to)
end

"""
    aws_array_list_ensure_capacity(list, index)

Ensures that the array list has enough capacity to store a value at the specified index. If there is not already enough capacity, and the list is in dynamic mode, this function will attempt to allocate more memory, expanding the list. In static mode, if 'index' is beyond the maximum index, AWS\\_ERROR\\_INVALID\\_INDEX will be raised.

### Prototype
```c
int aws_array_list_ensure_capacity(struct aws_array_list *AWS_RESTRICT list, size_t index);
```
"""
function aws_array_list_ensure_capacity(list, index)
    ccall((:aws_array_list_ensure_capacity, libawscrt), Cint, (Ptr{aws_array_list}, Csize_t), list, index)
end

"""
    aws_array_list_swap(list, a, b)

Swap elements at the specified indices, which must be within the bounds of the array.

### Prototype
```c
void aws_array_list_swap(struct aws_array_list *AWS_RESTRICT list, size_t a, size_t b);
```
"""
function aws_array_list_swap(list, a, b)
    ccall((:aws_array_list_swap, libawscrt), Cvoid, (Ptr{aws_array_list}, Csize_t, Csize_t), list, a, b)
end

"""
    aws_fatal_assert(cond_str, file, line)

### Prototype
```c
void aws_fatal_assert(const char *cond_str, const char *file, int line) AWS_ATTRIBUTE_NORETURN;
```
"""
function aws_fatal_assert(cond_str, file, line)
    ccall((:aws_fatal_assert, libawscrt), Cvoid, (Ptr{Cchar}, Ptr{Cchar}, Cint), cond_str, file, line)
end

mutable struct aws_bus end

@cenum aws_bus_policy::UInt32 begin
    AWS_BUS_ASYNC_RELIABLE = 0
    AWS_BUS_ASYNC_UNRELIABLE = 1
    AWS_BUS_SYNC_RELIABLE = 2
end

struct aws_bus_options
    policy::aws_bus_policy
    buffer_size::Csize_t
    event_loop_group::Ptr{aws_event_loop_group}
end

# typedef void ( aws_bus_listener_fn ) ( uint64_t address , const void * payload , void * user_data )
const aws_bus_listener_fn = Cvoid

"""
    aws_bus_new(allocator, options)

Allocates and initializes a message bus

### Prototype
```c
struct aws_bus *aws_bus_new(struct aws_allocator *allocator, const struct aws_bus_options *options);
```
"""
function aws_bus_new(allocator, options)
    ccall((:aws_bus_new, libawscrt), Ptr{aws_bus}, (Ptr{aws_allocator}, Ptr{aws_bus_options}), allocator, options)
end

"""
    aws_bus_destroy(bus)

Cleans up a message bus, including notifying all remaining listeners to close

### Prototype
```c
void aws_bus_destroy(struct aws_bus *bus);
```
"""
function aws_bus_destroy(bus)
    ccall((:aws_bus_destroy, libawscrt), Cvoid, (Ptr{aws_bus},), bus)
end

"""
    aws_bus_subscribe(bus, address, listener, user_data)

Subscribes a listener to a message type. user\\_data's lifetime is the responsibility of the subscriber.

### Prototype
```c
int aws_bus_subscribe(struct aws_bus *bus, uint64_t address, aws_bus_listener_fn *listener, void *user_data);
```
"""
function aws_bus_subscribe(bus, address, listener, user_data)
    ccall((:aws_bus_subscribe, libawscrt), Cint, (Ptr{aws_bus}, UInt64, Ptr{Cvoid}, Ptr{Cvoid}), bus, address, listener, user_data)
end

"""
    aws_bus_unsubscribe(bus, address, listener, user_data)

Unsubscribe a listener from a specific message. This is only necessary if the listener has lifetime concerns. Otherwise, the listener will be called with an address of [`AWS_BUS_ADDRESS_CLOSE`](@ref), which indicates that user\\_data can be cleaned up if necessary and the listener will never be called again.

### Prototype
```c
void aws_bus_unsubscribe(struct aws_bus *bus, uint64_t address, aws_bus_listener_fn *listener, void *user_data);
```
"""
function aws_bus_unsubscribe(bus, address, listener, user_data)
    ccall((:aws_bus_unsubscribe, libawscrt), Cvoid, (Ptr{aws_bus}, UInt64, Ptr{Cvoid}, Ptr{Cvoid}), bus, address, listener, user_data)
end

"""
    aws_bus_send(bus, address, payload, destructor)

Sends a message to any listeners. payload will live until delivered, and then the destructor (if provided) will be called. Note that anything payload references must also live at least until it is destroyed. Will return [`AWS_OP_ERR`](@ref) if the bus is closing/has been closed

### Prototype
```c
int aws_bus_send(struct aws_bus *bus, uint64_t address, void *payload, void (*destructor)(void *));
```
"""
function aws_bus_send(bus, address, payload, destructor)
    ccall((:aws_bus_send, libawscrt), Cint, (Ptr{aws_bus}, UInt64, Ptr{Cvoid}, Ptr{Cvoid}), bus, address, payload, destructor)
end

# typedef bool ( aws_byte_predicate_fn ) ( uint8_t value )
"""
Signature for function argument to trim APIs
"""
const aws_byte_predicate_fn = Cvoid

"""
    aws_array_eq(array_a, len_a, array_b, len_b)

Compare two arrays. Return whether their contents are equivalent. NULL may be passed as the array pointer if its length is declared to be 0.

### Prototype
```c
bool aws_array_eq(const void *const array_a, const size_t len_a, const void *array_b, const size_t len_b);
```
"""
function aws_array_eq(array_a, len_a, array_b, len_b)
    ccall((:aws_array_eq, libawscrt), Bool, (Ptr{Cvoid}, Csize_t, Ptr{Cvoid}, Csize_t), array_a, len_a, array_b, len_b)
end

"""
    aws_array_eq_ignore_case(array_a, len_a, array_b, len_b)

Perform a case-insensitive string comparison of two arrays. Return whether their contents are equivalent. NULL may be passed as the array pointer if its length is declared to be 0. The "C" locale is used for comparing upper and lowercase letters. Data is assumed to be ASCII text, UTF-8 will work fine too.

### Prototype
```c
bool aws_array_eq_ignore_case( const void *const array_a, const size_t len_a, const void *const array_b, const size_t len_b);
```
"""
function aws_array_eq_ignore_case(array_a, len_a, array_b, len_b)
    ccall((:aws_array_eq_ignore_case, libawscrt), Bool, (Ptr{Cvoid}, Csize_t, Ptr{Cvoid}, Csize_t), array_a, len_a, array_b, len_b)
end

"""
    aws_array_eq_c_str(array, array_len, c_str)

Compare an array and a null-terminated string. Returns true if their contents are equivalent. The array should NOT contain a null-terminator, or the comparison will always return false. NULL may be passed as the array pointer if its length is declared to be 0.

### Prototype
```c
bool aws_array_eq_c_str(const void *const array, const size_t array_len, const char *const c_str);
```
"""
function aws_array_eq_c_str(array, array_len, c_str)
    ccall((:aws_array_eq_c_str, libawscrt), Bool, (Ptr{Cvoid}, Csize_t, Ptr{Cchar}), array, array_len, c_str)
end

"""
    aws_array_eq_c_str_ignore_case(array, array_len, c_str)

Perform a case-insensitive string comparison of an array and a null-terminated string. Return whether their contents are equivalent. The array should NOT contain a null-terminator, or the comparison will always return false. NULL may be passed as the array pointer if its length is declared to be 0. The "C" locale is used for comparing upper and lowercase letters. Data is assumed to be ASCII text, UTF-8 will work fine too.

### Prototype
```c
bool aws_array_eq_c_str_ignore_case(const void *const array, const size_t array_len, const char *const c_str);
```
"""
function aws_array_eq_c_str_ignore_case(array, array_len, c_str)
    ccall((:aws_array_eq_c_str_ignore_case, libawscrt), Bool, (Ptr{Cvoid}, Csize_t, Ptr{Cchar}), array, array_len, c_str)
end

"""
    aws_byte_buf_init(buf, allocator, capacity)

### Prototype
```c
int aws_byte_buf_init(struct aws_byte_buf *buf, struct aws_allocator *allocator, size_t capacity);
```
"""
function aws_byte_buf_init(buf, allocator, capacity)
    ccall((:aws_byte_buf_init, libawscrt), Cint, (Ptr{aws_byte_buf}, Ptr{aws_allocator}, Csize_t), buf, allocator, capacity)
end

"""
    aws_byte_buf_init_copy(dest, allocator, src)

Initializes an [`aws_byte_buf`](@ref) structure base on another valid one. Requires: *src and *allocator are valid objects. Ensures: *dest is a valid [`aws_byte_buf`](@ref) with a new backing array dest->buffer which is a copy of the elements from src->buffer.

### Prototype
```c
int aws_byte_buf_init_copy( struct aws_byte_buf *dest, struct aws_allocator *allocator, const struct aws_byte_buf *src);
```
"""
function aws_byte_buf_init_copy(dest, allocator, src)
    ccall((:aws_byte_buf_init_copy, libawscrt), Cint, (Ptr{aws_byte_buf}, Ptr{aws_allocator}, Ptr{aws_byte_buf}), dest, allocator, src)
end

"""
    aws_byte_buf_init_from_file(out_buf, alloc, filename)

Reads 'filename' into 'out\\_buf'. If successful, 'out\\_buf' is allocated and filled with the data; It is your responsibility to call '[`aws_byte_buf_clean_up`](@ref)()' on it. Otherwise, 'out\\_buf' remains unused. In the very unfortunate case where some API needs to treat out\\_buf as a c\\_string, a null terminator is appended, but is not included as part of the length field.

### Prototype
```c
int aws_byte_buf_init_from_file(struct aws_byte_buf *out_buf, struct aws_allocator *alloc, const char *filename);
```
"""
function aws_byte_buf_init_from_file(out_buf, alloc, filename)
    ccall((:aws_byte_buf_init_from_file, libawscrt), Cint, (Ptr{aws_byte_buf}, Ptr{aws_allocator}, Ptr{Cchar}), out_buf, alloc, filename)
end

"""
    aws_byte_buf_is_valid(buf)

Evaluates the set of properties that define the shape of all valid [`aws_byte_buf`](@ref) structures. It is also a cheap check, in the sense it run in constant time (i.e., no loops or recursion).

### Prototype
```c
bool aws_byte_buf_is_valid(const struct aws_byte_buf *const buf);
```
"""
function aws_byte_buf_is_valid(buf)
    ccall((:aws_byte_buf_is_valid, libawscrt), Bool, (Ptr{aws_byte_buf},), buf)
end

"""
    aws_byte_cursor_is_valid(cursor)

Evaluates the set of properties that define the shape of all valid [`aws_byte_cursor`](@ref) structures. It is also a cheap check, in the sense it runs in constant time (i.e., no loops or recursion).

### Prototype
```c
bool aws_byte_cursor_is_valid(const struct aws_byte_cursor *cursor);
```
"""
function aws_byte_cursor_is_valid(cursor)
    ccall((:aws_byte_cursor_is_valid, libawscrt), Bool, (Ptr{aws_byte_cursor},), cursor)
end

"""
    aws_byte_buf_init_copy_from_cursor(dest, allocator, src)

Copies src buffer into dest and sets the correct len and capacity. A new memory zone is allocated for dest->buffer. When dest is no longer needed it will have to be cleaned-up using [`aws_byte_buf_clean_up`](@ref)(dest). Dest capacity and len will be equal to the src len. Allocator of the dest will be identical with parameter allocator. If src buffer is null the dest will have a null buffer with a len and a capacity of 0 Returns [`AWS_OP_SUCCESS`](@ref) in case of success or [`AWS_OP_ERR`](@ref) when memory can't be allocated.

### Prototype
```c
int aws_byte_buf_init_copy_from_cursor( struct aws_byte_buf *dest, struct aws_allocator *allocator, struct aws_byte_cursor src);
```
"""
function aws_byte_buf_init_copy_from_cursor(dest, allocator, src)
    ccall((:aws_byte_buf_init_copy_from_cursor, libawscrt), Cint, (Ptr{aws_byte_buf}, Ptr{aws_allocator}, aws_byte_cursor), dest, allocator, src)
end

"""
    aws_byte_buf_clean_up(buf)

### Prototype
```c
void aws_byte_buf_clean_up(struct aws_byte_buf *buf);
```
"""
function aws_byte_buf_clean_up(buf)
    ccall((:aws_byte_buf_clean_up, libawscrt), Cvoid, (Ptr{aws_byte_buf},), buf)
end

"""
    aws_byte_buf_clean_up_secure(buf)

Equivalent to calling [`aws_byte_buf_secure_zero`](@ref) and then [`aws_byte_buf_clean_up`](@ref) on the buffer.

### Prototype
```c
void aws_byte_buf_clean_up_secure(struct aws_byte_buf *buf);
```
"""
function aws_byte_buf_clean_up_secure(buf)
    ccall((:aws_byte_buf_clean_up_secure, libawscrt), Cvoid, (Ptr{aws_byte_buf},), buf)
end

"""
    aws_byte_buf_reset(buf, zero_contents)

Resets the len of the buffer to 0, but does not free the memory. The buffer can then be reused. Optionally zeroes the contents, if the "zero\\_contents" flag is true.

### Prototype
```c
void aws_byte_buf_reset(struct aws_byte_buf *buf, bool zero_contents);
```
"""
function aws_byte_buf_reset(buf, zero_contents)
    ccall((:aws_byte_buf_reset, libawscrt), Cvoid, (Ptr{aws_byte_buf}, Bool), buf, zero_contents)
end

"""
    aws_byte_buf_secure_zero(buf)

Sets all bytes of buffer to zero and resets len to zero.

### Prototype
```c
void aws_byte_buf_secure_zero(struct aws_byte_buf *buf);
```
"""
function aws_byte_buf_secure_zero(buf)
    ccall((:aws_byte_buf_secure_zero, libawscrt), Cvoid, (Ptr{aws_byte_buf},), buf)
end

"""
    aws_byte_buf_eq(a, b)

Compare two [`aws_byte_buf`](@ref) structures. Return whether their contents are equivalent.

### Prototype
```c
bool aws_byte_buf_eq(const struct aws_byte_buf *const a, const struct aws_byte_buf *const b);
```
"""
function aws_byte_buf_eq(a, b)
    ccall((:aws_byte_buf_eq, libawscrt), Bool, (Ptr{aws_byte_buf}, Ptr{aws_byte_buf}), a, b)
end

"""
    aws_byte_buf_eq_ignore_case(a, b)

Perform a case-insensitive string comparison of two [`aws_byte_buf`](@ref) structures. Return whether their contents are equivalent. The "C" locale is used for comparing upper and lowercase letters. Data is assumed to be ASCII text, UTF-8 will work fine too.

### Prototype
```c
bool aws_byte_buf_eq_ignore_case(const struct aws_byte_buf *const a, const struct aws_byte_buf *const b);
```
"""
function aws_byte_buf_eq_ignore_case(a, b)
    ccall((:aws_byte_buf_eq_ignore_case, libawscrt), Bool, (Ptr{aws_byte_buf}, Ptr{aws_byte_buf}), a, b)
end

"""
    aws_byte_buf_eq_c_str(buf, c_str)

Compare an [`aws_byte_buf`](@ref) and a null-terminated string. Returns true if their contents are equivalent. The buffer should NOT contain a null-terminator, or the comparison will always return false.

### Prototype
```c
bool aws_byte_buf_eq_c_str(const struct aws_byte_buf *const buf, const char *const c_str);
```
"""
function aws_byte_buf_eq_c_str(buf, c_str)
    ccall((:aws_byte_buf_eq_c_str, libawscrt), Bool, (Ptr{aws_byte_buf}, Ptr{Cchar}), buf, c_str)
end

"""
    aws_byte_buf_eq_c_str_ignore_case(buf, c_str)

Perform a case-insensitive string comparison of an [`aws_byte_buf`](@ref) and a null-terminated string. Return whether their contents are equivalent. The buffer should NOT contain a null-terminator, or the comparison will always return false. The "C" locale is used for comparing upper and lowercase letters. Data is assumed to be ASCII text, UTF-8 will work fine too.

### Prototype
```c
bool aws_byte_buf_eq_c_str_ignore_case(const struct aws_byte_buf *const buf, const char *const c_str);
```
"""
function aws_byte_buf_eq_c_str_ignore_case(buf, c_str)
    ccall((:aws_byte_buf_eq_c_str_ignore_case, libawscrt), Bool, (Ptr{aws_byte_buf}, Ptr{Cchar}), buf, c_str)
end

"""
    aws_byte_cursor_next_split(input_str, split_on, substr)

No copies, no buffer allocations. Iterates over input\\_str, and returns the next substring between split\\_on instances.

Edge case rules are as follows: If the input is an empty string, an empty cursor will be the one entry returned. If the input begins with split\\_on, an empty cursor will be the first entry returned. If the input has two adjacent split\\_on tokens, an empty cursor will be returned. If the input ends with split\\_on, an empty cursor will be returned last.

It is the user's responsibility zero-initialize substr before the first call.

It is the user's responsibility to make sure the input buffer stays in memory long enough to use the results.

### Prototype
```c
bool aws_byte_cursor_next_split( const struct aws_byte_cursor *AWS_RESTRICT input_str, char split_on, struct aws_byte_cursor *AWS_RESTRICT substr);
```
"""
function aws_byte_cursor_next_split(input_str, split_on, substr)
    ccall((:aws_byte_cursor_next_split, libawscrt), Bool, (Ptr{aws_byte_cursor}, Cchar, Ptr{aws_byte_cursor}), input_str, split_on, substr)
end

"""
    aws_byte_cursor_split_on_char(input_str, split_on, output)

No copies, no buffer allocations. Fills in output with a list of [`aws_byte_cursor`](@ref) instances where buffer is an offset into the input\\_str and len is the length of that string in the original buffer.

Edge case rules are as follows: if the input begins with split\\_on, an empty cursor will be the first entry in output. if the input has two adjacent split\\_on tokens, an empty cursor will be inserted into the output. if the input ends with split\\_on, an empty cursor will be appended to the output.

It is the user's responsibility to properly initialize output. Recommended number of preallocated elements from output is your most likely guess for the upper bound of the number of elements resulting from the split.

The type that will be stored in output is struct [`aws_byte_cursor`](@ref) (you'll need this for the item size param).

It is the user's responsibility to make sure the input buffer stays in memory long enough to use the results.

### Prototype
```c
int aws_byte_cursor_split_on_char( const struct aws_byte_cursor *AWS_RESTRICT input_str, char split_on, struct aws_array_list *AWS_RESTRICT output);
```
"""
function aws_byte_cursor_split_on_char(input_str, split_on, output)
    ccall((:aws_byte_cursor_split_on_char, libawscrt), Cint, (Ptr{aws_byte_cursor}, Cchar, Ptr{aws_array_list}), input_str, split_on, output)
end

"""
    aws_byte_cursor_split_on_char_n(input_str, split_on, n, output)

No copies, no buffer allocations. Fills in output with a list of [`aws_byte_cursor`](@ref) instances where buffer is an offset into the input\\_str and len is the length of that string in the original buffer. N is the max number of splits, if this value is zero, it will add all splits to the output.

Edge case rules are as follows: if the input begins with split\\_on, an empty cursor will be the first entry in output if the input has two adjacent split\\_on tokens, an empty cursor will be inserted into the output. if the input ends with split\\_on, an empty cursor will be appended to the output.

It is the user's responsibility to properly initialize output. Recommended number of preallocated elements from output is your most likely guess for the upper bound of the number of elements resulting from the split.

If the output array is not large enough, input\\_str will be updated to point to the first character after the last processed split\\_on instance.

The type that will be stored in output is struct [`aws_byte_cursor`](@ref) (you'll need this for the item size param).

It is the user's responsibility to make sure the input buffer stays in memory long enough to use the results.

### Prototype
```c
int aws_byte_cursor_split_on_char_n( const struct aws_byte_cursor *AWS_RESTRICT input_str, char split_on, size_t n, struct aws_array_list *AWS_RESTRICT output);
```
"""
function aws_byte_cursor_split_on_char_n(input_str, split_on, n, output)
    ccall((:aws_byte_cursor_split_on_char_n, libawscrt), Cint, (Ptr{aws_byte_cursor}, Cchar, Csize_t, Ptr{aws_array_list}), input_str, split_on, n, output)
end

"""
    aws_byte_cursor_find_exact(input_str, to_find, first_find)

Search for an exact byte match inside a cursor. The first match will be returned. Returns [`AWS_OP_SUCCESS`](@ref) on successful match and first\\_find will be set to the offset in input\\_str, and length will be the remaining length from input\\_str past the returned offset. If the match was not found, [`AWS_OP_ERR`](@ref) will be returned and AWS\\_ERROR\\_STRING\\_MATCH\\_NOT\\_FOUND will be raised.

### Prototype
```c
int aws_byte_cursor_find_exact( const struct aws_byte_cursor *AWS_RESTRICT input_str, const struct aws_byte_cursor *AWS_RESTRICT to_find, struct aws_byte_cursor *first_find);
```
"""
function aws_byte_cursor_find_exact(input_str, to_find, first_find)
    ccall((:aws_byte_cursor_find_exact, libawscrt), Cint, (Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}), input_str, to_find, first_find)
end

"""
    aws_byte_cursor_right_trim_pred(source, predicate)

Shrinks a byte cursor from the right for as long as the supplied predicate is true

### Prototype
```c
struct aws_byte_cursor aws_byte_cursor_right_trim_pred( const struct aws_byte_cursor *source, aws_byte_predicate_fn *predicate);
```
"""
function aws_byte_cursor_right_trim_pred(source, predicate)
    ccall((:aws_byte_cursor_right_trim_pred, libawscrt), aws_byte_cursor, (Ptr{aws_byte_cursor}, Ptr{Cvoid}), source, predicate)
end

"""
    aws_byte_cursor_left_trim_pred(source, predicate)

Shrinks a byte cursor from the left for as long as the supplied predicate is true

### Prototype
```c
struct aws_byte_cursor aws_byte_cursor_left_trim_pred( const struct aws_byte_cursor *source, aws_byte_predicate_fn *predicate);
```
"""
function aws_byte_cursor_left_trim_pred(source, predicate)
    ccall((:aws_byte_cursor_left_trim_pred, libawscrt), aws_byte_cursor, (Ptr{aws_byte_cursor}, Ptr{Cvoid}), source, predicate)
end

"""
    aws_byte_cursor_trim_pred(source, predicate)

Shrinks a byte cursor from both sides for as long as the supplied predicate is true

### Prototype
```c
struct aws_byte_cursor aws_byte_cursor_trim_pred( const struct aws_byte_cursor *source, aws_byte_predicate_fn *predicate);
```
"""
function aws_byte_cursor_trim_pred(source, predicate)
    ccall((:aws_byte_cursor_trim_pred, libawscrt), aws_byte_cursor, (Ptr{aws_byte_cursor}, Ptr{Cvoid}), source, predicate)
end

"""
    aws_byte_cursor_satisfies_pred(source, predicate)

Returns true if the byte cursor's range of bytes all satisfy the predicate

### Prototype
```c
bool aws_byte_cursor_satisfies_pred(const struct aws_byte_cursor *source, aws_byte_predicate_fn *predicate);
```
"""
function aws_byte_cursor_satisfies_pred(source, predicate)
    ccall((:aws_byte_cursor_satisfies_pred, libawscrt), Bool, (Ptr{aws_byte_cursor}, Ptr{Cvoid}), source, predicate)
end

"""
    aws_byte_buf_append(to, from)

Copies from to to. If to is too small, AWS\\_ERROR\\_DEST\\_COPY\\_TOO\\_SMALL will be returned. dest->len will contain the amount of data actually copied to dest.

from and to may be the same buffer, permitting copying a buffer into itself.

### Prototype
```c
int aws_byte_buf_append(struct aws_byte_buf *to, const struct aws_byte_cursor *from);
```
"""
function aws_byte_buf_append(to, from)
    ccall((:aws_byte_buf_append, libawscrt), Cint, (Ptr{aws_byte_buf}, Ptr{aws_byte_cursor}), to, from)
end

"""
    aws_byte_buf_append_with_lookup(to, from, lookup_table)

Copies from to to while converting bytes via the passed in lookup table. If to is too small, AWS\\_ERROR\\_DEST\\_COPY\\_TOO\\_SMALL will be returned. to->len will contain its original size plus the amount of data actually copied to to.

from and to should not be the same buffer (overlap is not handled) lookup\\_table must be at least 256 bytes

### Prototype
```c
int aws_byte_buf_append_with_lookup( struct aws_byte_buf *AWS_RESTRICT to, const struct aws_byte_cursor *AWS_RESTRICT from, const uint8_t *lookup_table);
```
"""
function aws_byte_buf_append_with_lookup(to, from, lookup_table)
    ccall((:aws_byte_buf_append_with_lookup, libawscrt), Cint, (Ptr{aws_byte_buf}, Ptr{aws_byte_cursor}, Ptr{UInt8}), to, from, lookup_table)
end

"""
    aws_byte_buf_append_dynamic(to, from)

Copies from to to. If to is too small, the buffer will be grown appropriately and the old contents copied to, before the new contents are appended.

If the grow fails (overflow or OOM), then an error will be returned.

from and to may be the same buffer, permitting copying a buffer into itself.

### Prototype
```c
int aws_byte_buf_append_dynamic(struct aws_byte_buf *to, const struct aws_byte_cursor *from);
```
"""
function aws_byte_buf_append_dynamic(to, from)
    ccall((:aws_byte_buf_append_dynamic, libawscrt), Cint, (Ptr{aws_byte_buf}, Ptr{aws_byte_cursor}), to, from)
end

"""
    aws_byte_buf_append_dynamic_secure(to, from)

Copies `from` to `to`. If `to` is too small, the buffer will be grown appropriately and the old contents copied over, before the new contents are appended.

If the grow fails (overflow or OOM), then an error will be returned.

If the buffer is grown, the old buffer will be securely cleared before getting freed.

`from` and `to` may be the same buffer, permitting copying a buffer into itself.

### Prototype
```c
int aws_byte_buf_append_dynamic_secure(struct aws_byte_buf *to, const struct aws_byte_cursor *from);
```
"""
function aws_byte_buf_append_dynamic_secure(to, from)
    ccall((:aws_byte_buf_append_dynamic_secure, libawscrt), Cint, (Ptr{aws_byte_buf}, Ptr{aws_byte_cursor}), to, from)
end

"""
    aws_byte_buf_append_byte_dynamic(buffer, value)

Copies a single byte into `to`. If `to` is too small, the buffer will be grown appropriately and the old contents copied over, before the byte is appended.

If the grow fails (overflow or OOM), then an error will be returned.

### Prototype
```c
int aws_byte_buf_append_byte_dynamic(struct aws_byte_buf *buffer, uint8_t value);
```
"""
function aws_byte_buf_append_byte_dynamic(buffer, value)
    ccall((:aws_byte_buf_append_byte_dynamic, libawscrt), Cint, (Ptr{aws_byte_buf}, UInt8), buffer, value)
end

"""
    aws_byte_buf_append_byte_dynamic_secure(buffer, value)

Copies a single byte into `to`. If `to` is too small, the buffer will be grown appropriately and the old contents copied over, before the byte is appended.

If the grow fails (overflow or OOM), then an error will be returned.

If the buffer is grown, the old buffer will be securely cleared before getting freed.

### Prototype
```c
int aws_byte_buf_append_byte_dynamic_secure(struct aws_byte_buf *buffer, uint8_t value);
```
"""
function aws_byte_buf_append_byte_dynamic_secure(buffer, value)
    ccall((:aws_byte_buf_append_byte_dynamic_secure, libawscrt), Cint, (Ptr{aws_byte_buf}, UInt8), buffer, value)
end

"""
    aws_byte_buf_append_and_update(to, from_and_update)

Copy contents of cursor to buffer, then update cursor to reference the memory stored in the buffer. If buffer is too small, AWS\\_ERROR\\_DEST\\_COPY\\_TOO\\_SMALL will be returned.

The cursor is permitted to reference memory from earlier in the buffer.

### Prototype
```c
int aws_byte_buf_append_and_update(struct aws_byte_buf *to, struct aws_byte_cursor *from_and_update);
```
"""
function aws_byte_buf_append_and_update(to, from_and_update)
    ccall((:aws_byte_buf_append_and_update, libawscrt), Cint, (Ptr{aws_byte_buf}, Ptr{aws_byte_cursor}), to, from_and_update)
end

"""
    aws_byte_buf_append_null_terminator(buf)

Appends '\\0' at the end of the buffer.

### Prototype
```c
int aws_byte_buf_append_null_terminator(struct aws_byte_buf *buf);
```
"""
function aws_byte_buf_append_null_terminator(buf)
    ccall((:aws_byte_buf_append_null_terminator, libawscrt), Cint, (Ptr{aws_byte_buf},), buf)
end

"""
    aws_byte_buf_reserve(buffer, requested_capacity)

Attempts to increase the capacity of a buffer to the requested capacity

If the the buffer's capacity is currently larger than the request capacity, the function does nothing (no shrink is performed).

### Prototype
```c
int aws_byte_buf_reserve(struct aws_byte_buf *buffer, size_t requested_capacity);
```
"""
function aws_byte_buf_reserve(buffer, requested_capacity)
    ccall((:aws_byte_buf_reserve, libawscrt), Cint, (Ptr{aws_byte_buf}, Csize_t), buffer, requested_capacity)
end

"""
    aws_byte_buf_reserve_relative(buffer, additional_length)

Convenience function that attempts to increase the capacity of a buffer relative to the current length.

[`aws_byte_buf_reserve_relative`](@ref)(buf, x) ~~ [`aws_byte_buf_reserve`](@ref)(buf, buf->len + x)

### Prototype
```c
int aws_byte_buf_reserve_relative(struct aws_byte_buf *buffer, size_t additional_length);
```
"""
function aws_byte_buf_reserve_relative(buffer, additional_length)
    ccall((:aws_byte_buf_reserve_relative, libawscrt), Cint, (Ptr{aws_byte_buf}, Csize_t), buffer, additional_length)
end

"""
    aws_byte_cursor_eq(a, b)

Compare two [`aws_byte_cursor`](@ref) structures. Return whether their contents are equivalent.

### Prototype
```c
bool aws_byte_cursor_eq(const struct aws_byte_cursor *a, const struct aws_byte_cursor *b);
```
"""
function aws_byte_cursor_eq(a, b)
    ccall((:aws_byte_cursor_eq, libawscrt), Bool, (Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}), a, b)
end

"""
    aws_byte_cursor_eq_ignore_case(a, b)

Perform a case-insensitive string comparison of two [`aws_byte_cursor`](@ref) structures. Return whether their contents are equivalent. The "C" locale is used for comparing upper and lowercase letters. Data is assumed to be ASCII text, UTF-8 will work fine too.

### Prototype
```c
bool aws_byte_cursor_eq_ignore_case(const struct aws_byte_cursor *a, const struct aws_byte_cursor *b);
```
"""
function aws_byte_cursor_eq_ignore_case(a, b)
    ccall((:aws_byte_cursor_eq_ignore_case, libawscrt), Bool, (Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}), a, b)
end

"""
    aws_byte_cursor_eq_byte_buf(a, b)

Compare an [`aws_byte_cursor`](@ref) and an [`aws_byte_buf`](@ref). Return whether their contents are equivalent.

### Prototype
```c
bool aws_byte_cursor_eq_byte_buf(const struct aws_byte_cursor *const a, const struct aws_byte_buf *const b);
```
"""
function aws_byte_cursor_eq_byte_buf(a, b)
    ccall((:aws_byte_cursor_eq_byte_buf, libawscrt), Bool, (Ptr{aws_byte_cursor}, Ptr{aws_byte_buf}), a, b)
end

"""
    aws_byte_cursor_eq_byte_buf_ignore_case(a, b)

Perform a case-insensitive string comparison of an [`aws_byte_cursor`](@ref) and an [`aws_byte_buf`](@ref). Return whether their contents are equivalent. The "C" locale is used for comparing upper and lowercase letters. Data is assumed to be ASCII text, UTF-8 will work fine too.

### Prototype
```c
bool aws_byte_cursor_eq_byte_buf_ignore_case(const struct aws_byte_cursor *const a, const struct aws_byte_buf *const b);
```
"""
function aws_byte_cursor_eq_byte_buf_ignore_case(a, b)
    ccall((:aws_byte_cursor_eq_byte_buf_ignore_case, libawscrt), Bool, (Ptr{aws_byte_cursor}, Ptr{aws_byte_buf}), a, b)
end

"""
    aws_byte_cursor_eq_c_str(cursor, c_str)

Compare an [`aws_byte_cursor`](@ref) and a null-terminated string. Returns true if their contents are equivalent. The cursor should NOT contain a null-terminator, or the comparison will always return false.

### Prototype
```c
bool aws_byte_cursor_eq_c_str(const struct aws_byte_cursor *const cursor, const char *const c_str);
```
"""
function aws_byte_cursor_eq_c_str(cursor, c_str)
    ccall((:aws_byte_cursor_eq_c_str, libawscrt), Bool, (Ptr{aws_byte_cursor}, Ptr{Cchar}), cursor, c_str)
end

"""
    aws_byte_cursor_eq_c_str_ignore_case(cursor, c_str)

Perform a case-insensitive string comparison of an [`aws_byte_cursor`](@ref) and a null-terminated string. Return whether their contents are equivalent. The cursor should NOT contain a null-terminator, or the comparison will always return false. The "C" locale is used for comparing upper and lowercase letters. Data is assumed to be ASCII text, UTF-8 will work fine too.

### Prototype
```c
bool aws_byte_cursor_eq_c_str_ignore_case(const struct aws_byte_cursor *const cursor, const char *const c_str);
```
"""
function aws_byte_cursor_eq_c_str_ignore_case(cursor, c_str)
    ccall((:aws_byte_cursor_eq_c_str_ignore_case, libawscrt), Bool, (Ptr{aws_byte_cursor}, Ptr{Cchar}), cursor, c_str)
end

"""
    aws_hash_array_ignore_case(array, len)

Case-insensitive hash function for array containing ASCII or UTF-8 text.

### Prototype
```c
uint64_t aws_hash_array_ignore_case(const void *array, const size_t len);
```
"""
function aws_hash_array_ignore_case(array, len)
    ccall((:aws_hash_array_ignore_case, libawscrt), UInt64, (Ptr{Cvoid}, Csize_t), array, len)
end

"""
    aws_hash_byte_cursor_ptr_ignore_case(item)

Case-insensitive hash function for aws\\_byte\\_cursors stored in an [`aws_hash_table`](@ref). For case-sensitive hashing, use [`aws_hash_byte_cursor_ptr`](@ref)().

### Prototype
```c
uint64_t aws_hash_byte_cursor_ptr_ignore_case(const void *item);
```
"""
function aws_hash_byte_cursor_ptr_ignore_case(item)
    ccall((:aws_hash_byte_cursor_ptr_ignore_case, libawscrt), UInt64, (Ptr{Cvoid},), item)
end

"""
    aws_lookup_table_to_lower_get()

Returns a lookup table for bytes that is the identity transformation with the exception of uppercase ascii characters getting replaced with lowercase characters. Used in caseless comparisons.

### Prototype
```c
const uint8_t *aws_lookup_table_to_lower_get(void);
```
"""
function aws_lookup_table_to_lower_get()
    ccall((:aws_lookup_table_to_lower_get, libawscrt), Ptr{UInt8}, ())
end

"""
    aws_lookup_table_hex_to_num_get()

Returns lookup table to go from ASCII/UTF-8 hex character to a number (0-15). Non-hex characters map to 255. Valid examples: '0' -> 0 'F' -> 15 'f' -> 15 Invalid examples: ' ' -> 255 'Z' -> 255 '\\0' -> 255

### Prototype
```c
const uint8_t *aws_lookup_table_hex_to_num_get(void);
```
"""
function aws_lookup_table_hex_to_num_get()
    ccall((:aws_lookup_table_hex_to_num_get, libawscrt), Ptr{UInt8}, ())
end

"""
    aws_byte_cursor_compare_lexical(lhs, rhs)

Lexical (byte value) comparison of two byte cursors

### Prototype
```c
int aws_byte_cursor_compare_lexical(const struct aws_byte_cursor *lhs, const struct aws_byte_cursor *rhs);
```
"""
function aws_byte_cursor_compare_lexical(lhs, rhs)
    ccall((:aws_byte_cursor_compare_lexical, libawscrt), Cint, (Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}), lhs, rhs)
end

"""
    aws_byte_cursor_compare_lookup(lhs, rhs, lookup_table)

Lexical (byte value) comparison of two byte cursors where the raw values are sent through a lookup table first

### Prototype
```c
int aws_byte_cursor_compare_lookup( const struct aws_byte_cursor *lhs, const struct aws_byte_cursor *rhs, const uint8_t *lookup_table);
```
"""
function aws_byte_cursor_compare_lookup(lhs, rhs, lookup_table)
    ccall((:aws_byte_cursor_compare_lookup, libawscrt), Cint, (Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}, Ptr{UInt8}), lhs, rhs, lookup_table)
end

"""
    aws_byte_buf_from_c_str(c_str)

For creating a byte buffer from a null-terminated string literal.

### Prototype
```c
struct aws_byte_buf aws_byte_buf_from_c_str(const char *c_str);
```
"""
function aws_byte_buf_from_c_str(c_str)
    ccall((:aws_byte_buf_from_c_str, libawscrt), aws_byte_buf, (Ptr{Cchar},), c_str)
end

"""
    aws_byte_buf_from_array(bytes, len)

### Prototype
```c
struct aws_byte_buf aws_byte_buf_from_array(const void *bytes, size_t len);
```
"""
function aws_byte_buf_from_array(bytes, len)
    ccall((:aws_byte_buf_from_array, libawscrt), aws_byte_buf, (Ptr{Cvoid}, Csize_t), bytes, len)
end

"""
    aws_byte_buf_from_empty_array(bytes, capacity)

### Prototype
```c
struct aws_byte_buf aws_byte_buf_from_empty_array(const void *bytes, size_t capacity);
```
"""
function aws_byte_buf_from_empty_array(bytes, capacity)
    ccall((:aws_byte_buf_from_empty_array, libawscrt), aws_byte_buf, (Ptr{Cvoid}, Csize_t), bytes, capacity)
end

"""
    aws_byte_cursor_from_buf(buf)

### Prototype
```c
struct aws_byte_cursor aws_byte_cursor_from_buf(const struct aws_byte_buf *const buf);
```
"""
function aws_byte_cursor_from_buf(buf)
    ccall((:aws_byte_cursor_from_buf, libawscrt), aws_byte_cursor, (Ptr{aws_byte_buf},), buf)
end

"""
    aws_byte_cursor_from_c_str(c_str)

### Prototype
```c
struct aws_byte_cursor aws_byte_cursor_from_c_str(const char *c_str);
```
"""
function aws_byte_cursor_from_c_str(c_str)
    ccall((:aws_byte_cursor_from_c_str, libawscrt), aws_byte_cursor, (Ptr{Cchar},), c_str)
end

"""
    aws_byte_cursor_from_array(bytes, len)

### Prototype
```c
struct aws_byte_cursor aws_byte_cursor_from_array(const void *const bytes, const size_t len);
```
"""
function aws_byte_cursor_from_array(bytes, len)
    ccall((:aws_byte_cursor_from_array, libawscrt), aws_byte_cursor, (Ptr{Cvoid}, Csize_t), bytes, len)
end

"""
    aws_byte_cursor_advance(cursor, len)

Tests if the given [`aws_byte_cursor`](@ref) has at least len bytes remaining. If so, *buf is advanced by len bytes (incrementing ->ptr and decrementing ->len), and an [`aws_byte_cursor`](@ref) referring to the first len bytes of the original *buf is returned. Otherwise, an [`aws_byte_cursor`](@ref) with ->ptr = NULL, ->len = 0 is returned.

Note that if len is above (SIZE\\_MAX / 2), this function will also treat it as a buffer overflow, and return NULL without changing *buf.

### Prototype
```c
struct aws_byte_cursor aws_byte_cursor_advance(struct aws_byte_cursor *const cursor, const size_t len);
```
"""
function aws_byte_cursor_advance(cursor, len)
    ccall((:aws_byte_cursor_advance, libawscrt), aws_byte_cursor, (Ptr{aws_byte_cursor}, Csize_t), cursor, len)
end

"""
    aws_byte_cursor_advance_nospec(cursor, len)

Behaves identically to [`aws_byte_cursor_advance`](@ref), but avoids speculative execution potentially reading out-of-bounds pointers (by returning an empty ptr in such speculated paths).

This should generally be done when using an untrusted or data-dependent value for 'len', to avoid speculating into a path where cursor->ptr points outside the true ptr length.

### Prototype
```c
struct aws_byte_cursor aws_byte_cursor_advance_nospec(struct aws_byte_cursor *const cursor, size_t len);
```
"""
function aws_byte_cursor_advance_nospec(cursor, len)
    ccall((:aws_byte_cursor_advance_nospec, libawscrt), aws_byte_cursor, (Ptr{aws_byte_cursor}, Csize_t), cursor, len)
end

"""
    aws_byte_cursor_read(cur, dest, len)

Reads specified length of data from byte cursor and copies it to the destination array.

On success, returns true and updates the cursor pointer/length accordingly. If there is insufficient space in the cursor, returns false, leaving the cursor unchanged.

### Prototype
```c
bool aws_byte_cursor_read( struct aws_byte_cursor *AWS_RESTRICT cur, void *AWS_RESTRICT dest, const size_t len);
```
"""
function aws_byte_cursor_read(cur, dest, len)
    ccall((:aws_byte_cursor_read, libawscrt), Bool, (Ptr{aws_byte_cursor}, Ptr{Cvoid}, Csize_t), cur, dest, len)
end

"""
    aws_byte_cursor_read_and_fill_buffer(cur, dest)

Reads as many bytes from cursor as size of buffer, and copies them to buffer.

On success, returns true and updates the cursor pointer/length accordingly. If there is insufficient space in the cursor, returns false, leaving the cursor unchanged.

### Prototype
```c
bool aws_byte_cursor_read_and_fill_buffer( struct aws_byte_cursor *AWS_RESTRICT cur, struct aws_byte_buf *AWS_RESTRICT dest);
```
"""
function aws_byte_cursor_read_and_fill_buffer(cur, dest)
    ccall((:aws_byte_cursor_read_and_fill_buffer, libawscrt), Bool, (Ptr{aws_byte_cursor}, Ptr{aws_byte_buf}), cur, dest)
end

"""
    aws_byte_cursor_read_u8(cur, var)

Reads a single byte from cursor, placing it in *var.

On success, returns true and updates the cursor pointer/length accordingly. If there is insufficient space in the cursor, returns false, leaving the cursor unchanged.

### Prototype
```c
bool aws_byte_cursor_read_u8(struct aws_byte_cursor *AWS_RESTRICT cur, uint8_t *AWS_RESTRICT var);
```
"""
function aws_byte_cursor_read_u8(cur, var)
    ccall((:aws_byte_cursor_read_u8, libawscrt), Bool, (Ptr{aws_byte_cursor}, Ptr{UInt8}), cur, var)
end

"""
    aws_byte_cursor_read_be16(cur, var)

Reads a 16-bit value in network byte order from cur, and places it in host byte order into var.

On success, returns true and updates the cursor pointer/length accordingly. If there is insufficient space in the cursor, returns false, leaving the cursor unchanged.

### Prototype
```c
bool aws_byte_cursor_read_be16(struct aws_byte_cursor *cur, uint16_t *var);
```
"""
function aws_byte_cursor_read_be16(cur, var)
    ccall((:aws_byte_cursor_read_be16, libawscrt), Bool, (Ptr{aws_byte_cursor}, Ptr{UInt16}), cur, var)
end

"""
    aws_byte_cursor_read_be24(cur, var)

Reads an unsigned 24-bit value (3 bytes) in network byte order from cur, and places it in host byte order into 32-bit var. Ex: if cur's next 3 bytes are {0xAA, 0xBB, 0xCC}, then var becomes 0x00AABBCC.

On success, returns true and updates the cursor pointer/length accordingly. If there is insufficient space in the cursor, returns false, leaving the cursor unchanged.

### Prototype
```c
bool aws_byte_cursor_read_be24(struct aws_byte_cursor *cur, uint32_t *var);
```
"""
function aws_byte_cursor_read_be24(cur, var)
    ccall((:aws_byte_cursor_read_be24, libawscrt), Bool, (Ptr{aws_byte_cursor}, Ptr{UInt32}), cur, var)
end

"""
    aws_byte_cursor_read_be32(cur, var)

Reads a 32-bit value in network byte order from cur, and places it in host byte order into var.

On success, returns true and updates the cursor pointer/length accordingly. If there is insufficient space in the cursor, returns false, leaving the cursor unchanged.

### Prototype
```c
bool aws_byte_cursor_read_be32(struct aws_byte_cursor *cur, uint32_t *var);
```
"""
function aws_byte_cursor_read_be32(cur, var)
    ccall((:aws_byte_cursor_read_be32, libawscrt), Bool, (Ptr{aws_byte_cursor}, Ptr{UInt32}), cur, var)
end

"""
    aws_byte_cursor_read_be64(cur, var)

Reads a 64-bit value in network byte order from cur, and places it in host byte order into var.

On success, returns true and updates the cursor pointer/length accordingly. If there is insufficient space in the cursor, returns false, leaving the cursor unchanged.

### Prototype
```c
bool aws_byte_cursor_read_be64(struct aws_byte_cursor *cur, uint64_t *var);
```
"""
function aws_byte_cursor_read_be64(cur, var)
    ccall((:aws_byte_cursor_read_be64, libawscrt), Bool, (Ptr{aws_byte_cursor}, Ptr{UInt64}), cur, var)
end

"""
    aws_byte_cursor_read_float_be32(cur, var)

Reads a 32-bit value in network byte order from cur, and places it in host byte order into var.

On success, returns true and updates the cursor pointer/length accordingly. If there is insufficient space in the cursor, returns false, leaving the cursor unchanged.

### Prototype
```c
bool aws_byte_cursor_read_float_be32(struct aws_byte_cursor *cur, float *var);
```
"""
function aws_byte_cursor_read_float_be32(cur, var)
    ccall((:aws_byte_cursor_read_float_be32, libawscrt), Bool, (Ptr{aws_byte_cursor}, Ptr{Cfloat}), cur, var)
end

"""
    aws_byte_cursor_read_float_be64(cur, var)

Reads a 64-bit value in network byte order from cur, and places it in host byte order into var.

On success, returns true and updates the cursor pointer/length accordingly. If there is insufficient space in the cursor, returns false, leaving the cursor unchanged.

### Prototype
```c
bool aws_byte_cursor_read_float_be64(struct aws_byte_cursor *cur, double *var);
```
"""
function aws_byte_cursor_read_float_be64(cur, var)
    ccall((:aws_byte_cursor_read_float_be64, libawscrt), Bool, (Ptr{aws_byte_cursor}, Ptr{Cdouble}), cur, var)
end

"""
    aws_byte_cursor_read_hex_u8(cur, var)

Reads 2 hex characters from ASCII/UTF-8 text to produce an 8-bit number. Accepts both lowercase 'a'-'f' and uppercase 'A'-'F'. For example: "0F" produces 15.

On success, returns true and advances the cursor by 2. If there is insufficient space in the cursor or an invalid character is encountered, returns false, leaving the cursor unchanged.

### Prototype
```c
bool aws_byte_cursor_read_hex_u8(struct aws_byte_cursor *cur, uint8_t *var);
```
"""
function aws_byte_cursor_read_hex_u8(cur, var)
    ccall((:aws_byte_cursor_read_hex_u8, libawscrt), Bool, (Ptr{aws_byte_cursor}, Ptr{UInt8}), cur, var)
end

"""
    aws_byte_buf_advance(buffer, output, len)

Appends a sub-buffer to the specified buffer.

If the buffer has at least `len' bytes remaining (buffer->capacity - buffer->len >= len), then buffer->len is incremented by len, and an [`aws_byte_buf`](@ref) is assigned to *output corresponding to the last len bytes of the input buffer. The [`aws_byte_buf`](@ref) at *output will have a null allocator, a zero initial length, and a capacity of 'len'. The function then returns true.

If there is insufficient space, then this function nulls all fields in *output and returns false.

### Prototype
```c
bool aws_byte_buf_advance( struct aws_byte_buf *const AWS_RESTRICT buffer, struct aws_byte_buf *const AWS_RESTRICT output, const size_t len);
```
"""
function aws_byte_buf_advance(buffer, output, len)
    ccall((:aws_byte_buf_advance, libawscrt), Bool, (Ptr{aws_byte_buf}, Ptr{aws_byte_buf}, Csize_t), buffer, output, len)
end

"""
    aws_byte_buf_write(buf, src, len)

Write specified number of bytes from array to byte buffer.

On success, returns true and updates the buffer length accordingly. If there is insufficient space in the buffer, returns false, leaving the buffer unchanged.

### Prototype
```c
bool aws_byte_buf_write( struct aws_byte_buf *AWS_RESTRICT buf, const uint8_t *AWS_RESTRICT src, size_t len);
```
"""
function aws_byte_buf_write(buf, src, len)
    ccall((:aws_byte_buf_write, libawscrt), Bool, (Ptr{aws_byte_buf}, Ptr{UInt8}, Csize_t), buf, src, len)
end

"""
    aws_byte_buf_write_from_whole_buffer(buf, src)

Copies all bytes from buffer to buffer.

On success, returns true and updates the buffer /length accordingly. If there is insufficient space in the buffer, returns false, leaving the buffer unchanged.

### Prototype
```c
bool aws_byte_buf_write_from_whole_buffer( struct aws_byte_buf *AWS_RESTRICT buf, struct aws_byte_buf src);
```
"""
function aws_byte_buf_write_from_whole_buffer(buf, src)
    ccall((:aws_byte_buf_write_from_whole_buffer, libawscrt), Bool, (Ptr{aws_byte_buf}, aws_byte_buf), buf, src)
end

"""
    aws_byte_buf_write_from_whole_cursor(buf, src)

Copies all bytes from buffer to buffer.

On success, returns true and updates the buffer /length accordingly. If there is insufficient space in the buffer, returns false, leaving the buffer unchanged.

### Prototype
```c
bool aws_byte_buf_write_from_whole_cursor( struct aws_byte_buf *AWS_RESTRICT buf, struct aws_byte_cursor src);
```
"""
function aws_byte_buf_write_from_whole_cursor(buf, src)
    ccall((:aws_byte_buf_write_from_whole_cursor, libawscrt), Bool, (Ptr{aws_byte_buf}, aws_byte_cursor), buf, src)
end

"""
    aws_byte_buf_write_to_capacity(buf, advancing_cursor)

Without increasing buf's capacity, write as much as possible from advancing\\_cursor into buf.

buf's len is updated accordingly. advancing\\_cursor is advanced so it contains the remaining unwritten parts. Returns the section of advancing\\_cursor which was written.

This function cannot fail. If buf is full (len == capacity) or advancing\\_len has 0 length, then buf and advancing\\_cursor are not altered and a cursor with 0 length is returned.

Example: Given a buf with 2 bytes of space available and advancing\\_cursor with contents "abc". "ab" will be written to buf and buf->len will increase 2 and become equal to buf->capacity. advancing\\_cursor will advance so its contents become the unwritten "c". The returned cursor's contents will be the "ab" from the original advancing\\_cursor.

### Prototype
```c
struct aws_byte_cursor aws_byte_buf_write_to_capacity( struct aws_byte_buf *buf, struct aws_byte_cursor *advancing_cursor);
```
"""
function aws_byte_buf_write_to_capacity(buf, advancing_cursor)
    ccall((:aws_byte_buf_write_to_capacity, libawscrt), aws_byte_cursor, (Ptr{aws_byte_buf}, Ptr{aws_byte_cursor}), buf, advancing_cursor)
end

"""
    aws_byte_buf_write_u8(buf, c)

Copies one byte to buffer.

On success, returns true and updates the cursor /length accordingly.

If there is insufficient space in the buffer, returns false, leaving the buffer unchanged.

### Prototype
```c
bool aws_byte_buf_write_u8(struct aws_byte_buf *AWS_RESTRICT buf, uint8_t c);
```
"""
function aws_byte_buf_write_u8(buf, c)
    ccall((:aws_byte_buf_write_u8, libawscrt), Bool, (Ptr{aws_byte_buf}, UInt8), buf, c)
end

"""
    aws_byte_buf_write_u8_n(buf, c, count)

Writes one byte repeatedly to buffer (like memset)

If there is insufficient space in the buffer, returns false, leaving the buffer unchanged.

### Prototype
```c
bool aws_byte_buf_write_u8_n(struct aws_byte_buf *buf, uint8_t c, size_t count);
```
"""
function aws_byte_buf_write_u8_n(buf, c, count)
    ccall((:aws_byte_buf_write_u8_n, libawscrt), Bool, (Ptr{aws_byte_buf}, UInt8, Csize_t), buf, c, count)
end

"""
    aws_byte_buf_write_be16(buf, x)

Writes a 16-bit integer in network byte order (big endian) to buffer.

On success, returns true and updates the buffer /length accordingly. If there is insufficient space in the buffer, returns false, leaving the buffer unchanged.

### Prototype
```c
bool aws_byte_buf_write_be16(struct aws_byte_buf *buf, uint16_t x);
```
"""
function aws_byte_buf_write_be16(buf, x)
    ccall((:aws_byte_buf_write_be16, libawscrt), Bool, (Ptr{aws_byte_buf}, UInt16), buf, x)
end

"""
    aws_byte_buf_write_be24(buf, x)

Writes low 24-bits (3 bytes) of an unsigned integer in network byte order (big endian) to buffer. Ex: If x is 0x00AABBCC then {0xAA, 0xBB, 0xCC} is written to buffer.

On success, returns true and updates the buffer /length accordingly. If there is insufficient space in the buffer, or x's value cannot fit in 3 bytes, returns false, leaving the buffer unchanged.

### Prototype
```c
bool aws_byte_buf_write_be24(struct aws_byte_buf *buf, uint32_t x);
```
"""
function aws_byte_buf_write_be24(buf, x)
    ccall((:aws_byte_buf_write_be24, libawscrt), Bool, (Ptr{aws_byte_buf}, UInt32), buf, x)
end

"""
    aws_byte_buf_write_be32(buf, x)

Writes a 32-bit integer in network byte order (big endian) to buffer.

On success, returns true and updates the buffer /length accordingly. If there is insufficient space in the buffer, returns false, leaving the buffer unchanged.

### Prototype
```c
bool aws_byte_buf_write_be32(struct aws_byte_buf *buf, uint32_t x);
```
"""
function aws_byte_buf_write_be32(buf, x)
    ccall((:aws_byte_buf_write_be32, libawscrt), Bool, (Ptr{aws_byte_buf}, UInt32), buf, x)
end

"""
    aws_byte_buf_write_float_be32(buf, x)

Writes a 32-bit float in network byte order (big endian) to buffer.

On success, returns true and updates the buffer /length accordingly. If there is insufficient space in the buffer, returns false, leaving the buffer unchanged.

### Prototype
```c
bool aws_byte_buf_write_float_be32(struct aws_byte_buf *buf, float x);
```
"""
function aws_byte_buf_write_float_be32(buf, x)
    ccall((:aws_byte_buf_write_float_be32, libawscrt), Bool, (Ptr{aws_byte_buf}, Cfloat), buf, x)
end

"""
    aws_byte_buf_write_be64(buf, x)

Writes a 64-bit integer in network byte order (big endian) to buffer.

On success, returns true and updates the buffer /length accordingly. If there is insufficient space in the buffer, returns false, leaving the buffer unchanged.

### Prototype
```c
bool aws_byte_buf_write_be64(struct aws_byte_buf *buf, uint64_t x);
```
"""
function aws_byte_buf_write_be64(buf, x)
    ccall((:aws_byte_buf_write_be64, libawscrt), Bool, (Ptr{aws_byte_buf}, UInt64), buf, x)
end

"""
    aws_byte_buf_write_float_be64(buf, x)

Writes a 64-bit float in network byte order (big endian) to buffer.

On success, returns true and updates the buffer /length accordingly. If there is insufficient space in the buffer, returns false, leaving the buffer unchanged.

### Prototype
```c
bool aws_byte_buf_write_float_be64(struct aws_byte_buf *buf, double x);
```
"""
function aws_byte_buf_write_float_be64(buf, x)
    ccall((:aws_byte_buf_write_float_be64, libawscrt), Bool, (Ptr{aws_byte_buf}, Cdouble), buf, x)
end

"""
    aws_isalnum(ch)

Like isalnum(), but ignores C locale. Returns true if ch has the value of ASCII/UTF-8: 'a'-'z', 'A'-'Z', or '0'-'9'.

### Prototype
```c
bool aws_isalnum(uint8_t ch);
```
"""
function aws_isalnum(ch)
    ccall((:aws_isalnum, libawscrt), Bool, (UInt8,), ch)
end

"""
    aws_isalpha(ch)

Like isalpha(), but ignores C locale. Returns true if ch has the value of ASCII/UTF-8: 'a'-'z' or 'A'-'Z'.

### Prototype
```c
bool aws_isalpha(uint8_t ch);
```
"""
function aws_isalpha(ch)
    ccall((:aws_isalpha, libawscrt), Bool, (UInt8,), ch)
end

"""
    aws_isdigit(ch)

Like isdigit(). Returns true if ch has the value of ASCII/UTF-8: '0'-'9'.

Note: C's built-in isdigit() is also supposed to ignore the C locale, but cppreference.com claims "some implementations (e.g. Microsoft in 1252 codepage) may classify additional single-byte characters as digits"

### Prototype
```c
bool aws_isdigit(uint8_t ch);
```
"""
function aws_isdigit(ch)
    ccall((:aws_isdigit, libawscrt), Bool, (UInt8,), ch)
end

"""
    aws_isxdigit(ch)

Like isxdigit(). Returns true if ch has the value of ASCII/UTF-8: '0'-'9', 'a'-'f', or 'A'-'F'.

Note: C's built-in isxdigit() is also supposed to ignore the C locale, but cppreference.com claims "some implementations (e.g. Microsoft in 1252 codepage) may classify additional single-byte characters as digits"

### Prototype
```c
bool aws_isxdigit(uint8_t ch);
```
"""
function aws_isxdigit(ch)
    ccall((:aws_isxdigit, libawscrt), Bool, (UInt8,), ch)
end

"""
    aws_isspace(ch)

Like isspace(), but ignores C locale. Return true if ch has the value of ASCII/UTF-8: space (0x20), form feed (0x0C), line feed (0x0A), carriage return (0x0D), horizontal tab (0x09), or vertical tab (0x0B).

### Prototype
```c
bool aws_isspace(uint8_t ch);
```
"""
function aws_isspace(ch)
    ccall((:aws_isspace, libawscrt), Bool, (UInt8,), ch)
end

"""
    aws_byte_cursor_utf8_parse_u64(cursor, dst)

Read entire cursor as ASCII/UTF-8 unsigned base-10 number. Stricter than strtoull(), which allows whitespace and inputs that start with "0x"

Examples: "0" -> 0 "123" -> 123 "00004" -> 4 // leading zeros ok

Rejects things like: "-1" // negative numbers not allowed "1,000" // only characters 0-9 allowed "" // blank string not allowed " 0 " // whitespace not allowed "0x0" // hex not allowed "FF" // hex not allowed "999999999999999999999999999999999999999999" // larger than max u64

### Prototype
```c
int aws_byte_cursor_utf8_parse_u64(struct aws_byte_cursor cursor, uint64_t *dst);
```
"""
function aws_byte_cursor_utf8_parse_u64(cursor, dst)
    ccall((:aws_byte_cursor_utf8_parse_u64, libawscrt), Cint, (aws_byte_cursor, Ptr{UInt64}), cursor, dst)
end

"""
    aws_byte_cursor_utf8_parse_u64_hex(cursor, dst)

Read entire cursor as ASCII/UTF-8 unsigned base-16 number with NO "0x" prefix.

Examples: "F" -> 15 "000000ff" -> 255 // leading zeros ok "Ff" -> 255 // mixed case ok "123" -> 291 "FFFFFFFFFFFFFFFF" -> 18446744073709551616 // max u64

Rejects things like: "0x0" // 0x prefix not allowed "" // blank string not allowed " F " // whitespace not allowed "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF" // larger than max u64

### Prototype
```c
int aws_byte_cursor_utf8_parse_u64_hex(struct aws_byte_cursor cursor, uint64_t *dst);
```
"""
function aws_byte_cursor_utf8_parse_u64_hex(cursor, dst)
    ccall((:aws_byte_cursor_utf8_parse_u64_hex, libawscrt), Cint, (aws_byte_cursor, Ptr{UInt64}), cursor, dst)
end

struct aws_cache_vtable
    destroy::Ptr{Cvoid}
    find::Ptr{Cvoid}
    put::Ptr{Cvoid}
    remove::Ptr{Cvoid}
    clear::Ptr{Cvoid}
    get_element_count::Ptr{Cvoid}
end

"""
    aws_linked_hash_table

Simple linked hash table. Preserves insertion order, and can be iterated in insertion order.

You can also change the order safely without altering the shape of the underlying hash table.
"""
struct aws_linked_hash_table
    allocator::Ptr{aws_allocator}
    list::aws_linked_list
    table::aws_hash_table
    user_on_value_destroy::Ptr{Cvoid}
end

"""
    aws_cache

Base stucture for caches, used the linked hash table implementation.
"""
struct aws_cache
    allocator::Ptr{aws_allocator}
    vtable::Ptr{aws_cache_vtable}
    table::aws_linked_hash_table
    max_items::Csize_t
    impl::Ptr{Cvoid}
end

"""
    aws_cache_base_default_destroy(cache)

### Prototype
```c
void aws_cache_base_default_destroy(struct aws_cache *cache);
```
"""
function aws_cache_base_default_destroy(cache)
    ccall((:aws_cache_base_default_destroy, libawscrt), Cvoid, (Ptr{aws_cache},), cache)
end

"""
    aws_cache_base_default_find(cache, key, p_value)

### Prototype
```c
int aws_cache_base_default_find(struct aws_cache *cache, const void *key, void **p_value);
```
"""
function aws_cache_base_default_find(cache, key, p_value)
    ccall((:aws_cache_base_default_find, libawscrt), Cint, (Ptr{aws_cache}, Ptr{Cvoid}, Ptr{Ptr{Cvoid}}), cache, key, p_value)
end

"""
    aws_cache_base_default_remove(cache, key)

### Prototype
```c
int aws_cache_base_default_remove(struct aws_cache *cache, const void *key);
```
"""
function aws_cache_base_default_remove(cache, key)
    ccall((:aws_cache_base_default_remove, libawscrt), Cint, (Ptr{aws_cache}, Ptr{Cvoid}), cache, key)
end

"""
    aws_cache_base_default_clear(cache)

### Prototype
```c
void aws_cache_base_default_clear(struct aws_cache *cache);
```
"""
function aws_cache_base_default_clear(cache)
    ccall((:aws_cache_base_default_clear, libawscrt), Cvoid, (Ptr{aws_cache},), cache)
end

"""
    aws_cache_base_default_get_element_count(cache)

### Prototype
```c
size_t aws_cache_base_default_get_element_count(const struct aws_cache *cache);
```
"""
function aws_cache_base_default_get_element_count(cache)
    ccall((:aws_cache_base_default_get_element_count, libawscrt), Csize_t, (Ptr{aws_cache},), cache)
end

"""
    aws_cache_destroy(cache)

Cleans up the cache. Elements in the cache will be evicted and cleanup callbacks will be invoked.

### Prototype
```c
void aws_cache_destroy(struct aws_cache *cache);
```
"""
function aws_cache_destroy(cache)
    ccall((:aws_cache_destroy, libawscrt), Cvoid, (Ptr{aws_cache},), cache)
end

"""
    aws_cache_find(cache, key, p_value)

Finds element in the cache by key. If found, *p\\_value will hold the stored value, and [`AWS_OP_SUCCESS`](@ref) will be returned. If not found, [`AWS_OP_SUCCESS`](@ref) will be returned and *p\\_value will be NULL.

If any errors occur [`AWS_OP_ERR`](@ref) will be returned.

### Prototype
```c
int aws_cache_find(struct aws_cache *cache, const void *key, void **p_value);
```
"""
function aws_cache_find(cache, key, p_value)
    ccall((:aws_cache_find, libawscrt), Cint, (Ptr{aws_cache}, Ptr{Cvoid}, Ptr{Ptr{Cvoid}}), cache, key, p_value)
end

"""
    aws_cache_put(cache, key, p_value)

Puts `p_value` at `key`. If an element is already stored at `key` it will be replaced. If the cache is already full, an item will be removed based on the cache policy.

### Prototype
```c
int aws_cache_put(struct aws_cache *cache, const void *key, void *p_value);
```
"""
function aws_cache_put(cache, key, p_value)
    ccall((:aws_cache_put, libawscrt), Cint, (Ptr{aws_cache}, Ptr{Cvoid}, Ptr{Cvoid}), cache, key, p_value)
end

"""
    aws_cache_remove(cache, key)

Removes item at `key` from the cache.

### Prototype
```c
int aws_cache_remove(struct aws_cache *cache, const void *key);
```
"""
function aws_cache_remove(cache, key)
    ccall((:aws_cache_remove, libawscrt), Cint, (Ptr{aws_cache}, Ptr{Cvoid}), cache, key)
end

"""
    aws_cache_clear(cache)

Clears all items from the cache.

### Prototype
```c
void aws_cache_clear(struct aws_cache *cache);
```
"""
function aws_cache_clear(cache)
    ccall((:aws_cache_clear, libawscrt), Cvoid, (Ptr{aws_cache},), cache)
end

"""
    aws_cache_get_element_count(cache)

Returns the number of elements in the cache.

### Prototype
```c
size_t aws_cache_get_element_count(const struct aws_cache *cache);
```
"""
function aws_cache_get_element_count(cache)
    ccall((:aws_cache_get_element_count, libawscrt), Csize_t, (Ptr{aws_cache},), cache)
end

@cenum aws_timestamp_unit::UInt32 begin
    AWS_TIMESTAMP_SECS = 1
    AWS_TIMESTAMP_MILLIS = 1000
    AWS_TIMESTAMP_MICROS = 1000000
    AWS_TIMESTAMP_NANOS = 1000000000
end

"""
    aws_timestamp_convert(timestamp, convert_from, convert_to, remainder)

Converts 'timestamp' from unit 'convert\\_from' to unit 'convert\\_to', if the units are the same then 'timestamp' is returned. If 'remainder' is NOT NULL, it will be set to the remainder if convert\\_from is a more precise unit than convert\\_to. To avoid unnecessary branching, 'remainder' is not zero initialized in this function, be sure to set it to 0 first if you care about that kind of thing. If conversion would lead to integer overflow, the timestamp returned will be the highest possible time that is representable, i.e. UINT64\\_MAX.

### Prototype
```c
AWS_STATIC_IMPL uint64_t aws_timestamp_convert( uint64_t timestamp, enum aws_timestamp_unit convert_from, enum aws_timestamp_unit convert_to, uint64_t *remainder);
```
"""
function aws_timestamp_convert(timestamp, convert_from, convert_to, remainder)
    ccall((:aws_timestamp_convert, libawscrt), UInt64, (UInt64, aws_timestamp_unit, aws_timestamp_unit, Ptr{UInt64}), timestamp, convert_from, convert_to, remainder)
end

"""
    aws_timestamp_convert_u64(ticks, old_frequency, new_frequency, remainder)

More general form of [`aws_timestamp_convert`](@ref) that takes arbitrary frequencies rather than the timestamp enum.

### Prototype
```c
AWS_STATIC_IMPL uint64_t aws_timestamp_convert_u64(uint64_t ticks, uint64_t old_frequency, uint64_t new_frequency, uint64_t *remainder);
```
"""
function aws_timestamp_convert_u64(ticks, old_frequency, new_frequency, remainder)
    ccall((:aws_timestamp_convert_u64, libawscrt), UInt64, (UInt64, UInt64, UInt64, Ptr{UInt64}), ticks, old_frequency, new_frequency, remainder)
end

"""
    aws_high_res_clock_get_ticks(timestamp)

Get ticks in nanoseconds (usually 100 nanosecond precision) on the high resolution clock (most-likely TSC). This clock has no bearing on the actual system time. On success, timestamp will be set.

### Prototype
```c
int aws_high_res_clock_get_ticks(uint64_t *timestamp);
```
"""
function aws_high_res_clock_get_ticks(timestamp)
    ccall((:aws_high_res_clock_get_ticks, libawscrt), Cint, (Ptr{UInt64},), timestamp)
end

"""
    aws_sys_clock_get_ticks(timestamp)

Get ticks in nanoseconds (usually 100 nanosecond precision) on the system clock. Reflects actual system time via nanoseconds since unix epoch. Use with care since an inaccurately set clock will probably cause bugs. On success, timestamp will be set.

### Prototype
```c
int aws_sys_clock_get_ticks(uint64_t *timestamp);
```
"""
function aws_sys_clock_get_ticks(timestamp)
    ccall((:aws_sys_clock_get_ticks, libawscrt), Cint, (Ptr{UInt64},), timestamp)
end

@cenum aws_cli_options_has_arg::UInt32 begin
    AWS_CLI_OPTIONS_NO_ARGUMENT = 0
    AWS_CLI_OPTIONS_REQUIRED_ARGUMENT = 1
    AWS_CLI_OPTIONS_OPTIONAL_ARGUMENT = 2
end

# typedef int ( aws_cli_options_subcommand_fn ) ( int argc , char * const argv [ ] , const char * command_name , void * user_data )
"""
Invoked when a subcommand is encountered. argc and argv[] begins at the command encounterd. command\\_name is the name of the command being handled.
"""
const aws_cli_options_subcommand_fn = Cvoid

"""
    aws_cli_subcommand_dispatch

Dispatch table to dispatch cli commands from. command\\_name should be the exact string for the command you want to handle from the command line.
"""
struct aws_cli_subcommand_dispatch
    subcommand_fn::Ptr{Cvoid}
    command_name::Ptr{Cchar}
end

struct aws_cli_option
    name::Ptr{Cchar}
    has_arg::aws_cli_options_has_arg
    flag::Ptr{Cint}
    val::Cint
end

"""
    aws_cli_getopt_long(argc, argv, optstring, longopts, longindex)

A mostly compliant implementation of posix getopt\\_long(). Parses command-line arguments. argc is the number of command line arguments passed in argv. optstring contains the legitimate option characters. The option characters coorespond to [`aws_cli_option`](@ref)::val. If the character is followed by a :, the option requires an argument. If it is followed by '::', the argument is optional (not implemented yet).

longopts, is an array of struct [`aws_cli_option`](@ref). These are the allowed options for the program. The last member of the array must be zero initialized.

If longindex is non-null, it will be set to the index in longopts, for the found option.

Returns option val if it was found, '?' if an option was encountered that was not specified in the option string, 0x02 (START\\_OF\\_TEXT) will be returned if a positional argument was encountered. returns -1 when all arguments that can be parsed have been parsed.

### Prototype
```c
int aws_cli_getopt_long( int argc, char *const argv[], const char *optstring, const struct aws_cli_option *longopts, int *longindex);
```
"""
function aws_cli_getopt_long(argc, argv, optstring, longopts, longindex)
    ccall((:aws_cli_getopt_long, libawscrt), Cint, (Cint, Ptr{Ptr{Cchar}}, Ptr{Cchar}, Ptr{aws_cli_option}, Ptr{Cint}), argc, argv, optstring, longopts, longindex)
end

"""
    aws_cli_reset_state()

Resets global parser state for use in another parser run for the application.

### Prototype
```c
void aws_cli_reset_state(void);
```
"""
function aws_cli_reset_state()
    ccall((:aws_cli_reset_state, libawscrt), Cvoid, ())
end

"""
    aws_cli_dispatch_on_subcommand(argc, argv, dispatch_table, table_length, user_data)

Dispatches the current command line arguments with a subcommand from the second input argument in argv[], if dispatch table contains a command that matches the argument. When the command is dispatched, argc and argv will be updated to reflect the new argument count. The cli options are required to come after the subcommand. If either, no dispatch was found or there was no argument passed to the program, this function will return [`AWS_OP_ERR`](@ref). Check [`aws_last_error`](@ref)() for details on the error.

### Parameters
* `argc`: number of arguments passed to int main()
* `argv`: the arguments passed to int main()
* `parse_cb,`: optional, specify NULL if you don't want to handle this. This argument is for parsing "meta" commands from the command line options prior to dispatch occurring.
* `dispatch_table`: table containing functions and command name to dispatch on.
* `table_length`: numnber of entries in dispatch\\_table.
### Returns
[`AWS_OP_SUCCESS`](@ref)(0) on success, [`AWS_OP_ERR`](@ref)(-1) on failure
### Prototype
```c
int aws_cli_dispatch_on_subcommand( int argc, char *const argv[], struct aws_cli_subcommand_dispatch *dispatch_table, int table_length, void *user_data);
```
"""
function aws_cli_dispatch_on_subcommand(argc, argv, dispatch_table, table_length, user_data)
    ccall((:aws_cli_dispatch_on_subcommand, libawscrt), Cint, (Cint, Ptr{Ptr{Cchar}}, Ptr{aws_cli_subcommand_dispatch}, Cint, Ptr{Cvoid}), argc, argv, dispatch_table, table_length, user_data)
end

"""
    aws_common_library_init(allocator)

Initializes internal datastructures used by aws-c-common. Must be called before using any functionality in aws-c-common.

### Prototype
```c
void aws_common_library_init(struct aws_allocator *allocator);
```
"""
function aws_common_library_init(allocator)
    ccall((:aws_common_library_init, libawscrt), Cvoid, (Ptr{aws_allocator},), allocator)
end

"""
    aws_common_library_clean_up()

Shuts down the internal datastructures used by aws-c-common.

### Prototype
```c
void aws_common_library_clean_up(void);
```
"""
function aws_common_library_clean_up()
    ccall((:aws_common_library_clean_up, libawscrt), Cvoid, ())
end

"""
    aws_common_fatal_assert_library_initialized()

### Prototype
```c
void aws_common_fatal_assert_library_initialized(void);
```
"""
function aws_common_fatal_assert_library_initialized()
    ccall((:aws_common_fatal_assert_library_initialized, libawscrt), Cvoid, ())
end

# typedef bool ( aws_condition_predicate_fn ) ( void * )
const aws_condition_predicate_fn = Cvoid

struct aws_condition_variable
    condition_handle::pthread_cond_t
    initialized::Bool
end

"""
    aws_condition_variable_init(condition_variable)

Initializes a condition variable.

### Prototype
```c
int aws_condition_variable_init(struct aws_condition_variable *condition_variable);
```
"""
function aws_condition_variable_init(condition_variable)
    ccall((:aws_condition_variable_init, libawscrt), Cint, (Ptr{aws_condition_variable},), condition_variable)
end

"""
    aws_condition_variable_clean_up(condition_variable)

Cleans up a condition variable.

### Prototype
```c
void aws_condition_variable_clean_up(struct aws_condition_variable *condition_variable);
```
"""
function aws_condition_variable_clean_up(condition_variable)
    ccall((:aws_condition_variable_clean_up, libawscrt), Cvoid, (Ptr{aws_condition_variable},), condition_variable)
end

"""
    aws_condition_variable_notify_one(condition_variable)

Notifies/Wakes one waiting thread

### Prototype
```c
int aws_condition_variable_notify_one(struct aws_condition_variable *condition_variable);
```
"""
function aws_condition_variable_notify_one(condition_variable)
    ccall((:aws_condition_variable_notify_one, libawscrt), Cint, (Ptr{aws_condition_variable},), condition_variable)
end

"""
    aws_condition_variable_notify_all(condition_variable)

Notifies/Wakes all waiting threads.

### Prototype
```c
int aws_condition_variable_notify_all(struct aws_condition_variable *condition_variable);
```
"""
function aws_condition_variable_notify_all(condition_variable)
    ccall((:aws_condition_variable_notify_all, libawscrt), Cint, (Ptr{aws_condition_variable},), condition_variable)
end

struct aws_mutex
    mutex_handle::pthread_mutex_t
    initialized::Bool
end

"""
    aws_condition_variable_wait(condition_variable, mutex)

Waits the calling thread on a notification from another thread.

### Prototype
```c
int aws_condition_variable_wait(struct aws_condition_variable *condition_variable, struct aws_mutex *mutex);
```
"""
function aws_condition_variable_wait(condition_variable, mutex)
    ccall((:aws_condition_variable_wait, libawscrt), Cint, (Ptr{aws_condition_variable}, Ptr{aws_mutex}), condition_variable, mutex)
end

"""
    aws_condition_variable_wait_pred(condition_variable, mutex, pred, pred_ctx)

Waits the calling thread on a notification from another thread. If predicate returns false, the wait is reentered, otherwise control returns to the caller.

### Prototype
```c
int aws_condition_variable_wait_pred( struct aws_condition_variable *condition_variable, struct aws_mutex *mutex, aws_condition_predicate_fn *pred, void *pred_ctx);
```
"""
function aws_condition_variable_wait_pred(condition_variable, mutex, pred, pred_ctx)
    ccall((:aws_condition_variable_wait_pred, libawscrt), Cint, (Ptr{aws_condition_variable}, Ptr{aws_mutex}, Ptr{Cvoid}, Ptr{Cvoid}), condition_variable, mutex, pred, pred_ctx)
end

"""
    aws_condition_variable_wait_for(condition_variable, mutex, time_to_wait)

Waits the calling thread on a notification from another thread. Times out after time\\_to\\_wait. time\\_to\\_wait is in nanoseconds.

### Prototype
```c
int aws_condition_variable_wait_for( struct aws_condition_variable *condition_variable, struct aws_mutex *mutex, int64_t time_to_wait);
```
"""
function aws_condition_variable_wait_for(condition_variable, mutex, time_to_wait)
    ccall((:aws_condition_variable_wait_for, libawscrt), Cint, (Ptr{aws_condition_variable}, Ptr{aws_mutex}, Int64), condition_variable, mutex, time_to_wait)
end

"""
    aws_condition_variable_wait_for_pred(condition_variable, mutex, time_to_wait, pred, pred_ctx)

Waits the calling thread on a notification from another thread. Times out after time\\_to\\_wait. time\\_to\\_wait is in nanoseconds. If predicate returns false, the wait is reentered, otherwise control returns to the caller.

### Prototype
```c
int aws_condition_variable_wait_for_pred( struct aws_condition_variable *condition_variable, struct aws_mutex *mutex, int64_t time_to_wait, aws_condition_predicate_fn *pred, void *pred_ctx);
```
"""
function aws_condition_variable_wait_for_pred(condition_variable, mutex, time_to_wait, pred, pred_ctx)
    ccall((:aws_condition_variable_wait_for_pred, libawscrt), Cint, (Ptr{aws_condition_variable}, Ptr{aws_mutex}, Int64, Ptr{Cvoid}, Ptr{Cvoid}), condition_variable, mutex, time_to_wait, pred, pred_ctx)
end

@cenum aws_cpu_feature_name::UInt32 begin
    AWS_CPU_FEATURE_CLMUL = 0
    AWS_CPU_FEATURE_SSE_4_1 = 1
    AWS_CPU_FEATURE_SSE_4_2 = 2
    AWS_CPU_FEATURE_AVX2 = 3
    AWS_CPU_FEATURE_ARM_CRC = 4
    AWS_CPU_FEATURE_COUNT = 5
end

"""
    aws_cpu_has_feature(feature_name)

Returns true if a cpu feature is supported, false otherwise.

### Prototype
```c
bool aws_cpu_has_feature(enum aws_cpu_feature_name feature_name);
```
"""
function aws_cpu_has_feature(feature_name)
    ccall((:aws_cpu_has_feature, libawscrt), Bool, (aws_cpu_feature_name,), feature_name)
end

@cenum aws_date_format::UInt32 begin
    AWS_DATE_FORMAT_RFC822 = 0
    AWS_DATE_FORMAT_ISO_8601 = 1
    AWS_DATE_FORMAT_ISO_8601_BASIC = 2
    AWS_DATE_FORMAT_AUTO_DETECT = 3
end

@cenum aws_date_month::UInt32 begin
    AWS_DATE_MONTH_JANUARY = 0
    AWS_DATE_MONTH_FEBRUARY = 1
    AWS_DATE_MONTH_MARCH = 2
    AWS_DATE_MONTH_APRIL = 3
    AWS_DATE_MONTH_MAY = 4
    AWS_DATE_MONTH_JUNE = 5
    AWS_DATE_MONTH_JULY = 6
    AWS_DATE_MONTH_AUGUST = 7
    AWS_DATE_MONTH_SEPTEMBER = 8
    AWS_DATE_MONTH_OCTOBER = 9
    AWS_DATE_MONTH_NOVEMBER = 10
    AWS_DATE_MONTH_DECEMBER = 11
end

@cenum aws_date_day_of_week::UInt32 begin
    AWS_DATE_DAY_OF_WEEK_SUNDAY = 0
    AWS_DATE_DAY_OF_WEEK_MONDAY = 1
    AWS_DATE_DAY_OF_WEEK_TUESDAY = 2
    AWS_DATE_DAY_OF_WEEK_WEDNESDAY = 3
    AWS_DATE_DAY_OF_WEEK_THURSDAY = 4
    AWS_DATE_DAY_OF_WEEK_FRIDAY = 5
    AWS_DATE_DAY_OF_WEEK_SATURDAY = 6
end

"""
    aws_date_time_init_now(dt)

Initializes dt to be the current system time.

### Prototype
```c
void aws_date_time_init_now(struct aws_date_time *dt);
```
"""
function aws_date_time_init_now(dt)
    ccall((:aws_date_time_init_now, libawscrt), Cvoid, (Ptr{aws_date_time},), dt)
end

"""
    aws_date_time_init_epoch_millis(dt, ms_since_epoch)

Initializes dt to be the time represented in milliseconds since unix epoch.

### Prototype
```c
void aws_date_time_init_epoch_millis(struct aws_date_time *dt, uint64_t ms_since_epoch);
```
"""
function aws_date_time_init_epoch_millis(dt, ms_since_epoch)
    ccall((:aws_date_time_init_epoch_millis, libawscrt), Cvoid, (Ptr{aws_date_time}, UInt64), dt, ms_since_epoch)
end

"""
    aws_date_time_init_epoch_secs(dt, sec_ms)

Initializes dt to be the time represented in seconds.millis since unix epoch.

### Prototype
```c
void aws_date_time_init_epoch_secs(struct aws_date_time *dt, double sec_ms);
```
"""
function aws_date_time_init_epoch_secs(dt, sec_ms)
    ccall((:aws_date_time_init_epoch_secs, libawscrt), Cvoid, (Ptr{aws_date_time}, Cdouble), dt, sec_ms)
end

"""
    aws_date_time_init_from_str(dt, date_str, fmt)

Initializes dt to be the time represented by date\\_str in format 'fmt'. Returns [`AWS_OP_SUCCESS`](@ref) if the string was successfully parsed, returns [`AWS_OP_ERR`](@ref) if parsing failed.

Notes for AWS\\_DATE\\_FORMAT\\_RFC822: If no time zone information is provided, it is assumed to be local time (please don't do this).

If the time zone is something other than something indicating Universal Time (e.g. Z, UT, UTC, or GMT) or an offset from UTC (e.g. +0100, -0700), parsing will fail.

Really, it's just better if you always use Universal Time.

### Prototype
```c
int aws_date_time_init_from_str( struct aws_date_time *dt, const struct aws_byte_buf *date_str, enum aws_date_format fmt);
```
"""
function aws_date_time_init_from_str(dt, date_str, fmt)
    ccall((:aws_date_time_init_from_str, libawscrt), Cint, (Ptr{aws_date_time}, Ptr{aws_byte_buf}, aws_date_format), dt, date_str, fmt)
end

"""
    aws_date_time_init_from_str_cursor(dt, date_str_cursor, fmt)

aws\\_date\\_time\\_init variant that takes a byte\\_cursor rather than a byte\\_buf

### Prototype
```c
int aws_date_time_init_from_str_cursor( struct aws_date_time *dt, const struct aws_byte_cursor *date_str_cursor, enum aws_date_format fmt);
```
"""
function aws_date_time_init_from_str_cursor(dt, date_str_cursor, fmt)
    ccall((:aws_date_time_init_from_str_cursor, libawscrt), Cint, (Ptr{aws_date_time}, Ptr{aws_byte_cursor}, aws_date_format), dt, date_str_cursor, fmt)
end

"""
    aws_date_time_to_local_time_str(dt, fmt, output_buf)

Copies the current time as a formatted date string in local time into output\\_buf. If buffer is too small, it will return [`AWS_OP_ERR`](@ref). A good size suggestion is [`AWS_DATE_TIME_STR_MAX_LEN`](@ref) bytes. AWS\\_DATE\\_FORMAT\\_AUTO\\_DETECT is not allowed.

### Prototype
```c
int aws_date_time_to_local_time_str( const struct aws_date_time *dt, enum aws_date_format fmt, struct aws_byte_buf *output_buf);
```
"""
function aws_date_time_to_local_time_str(dt, fmt, output_buf)
    ccall((:aws_date_time_to_local_time_str, libawscrt), Cint, (Ptr{aws_date_time}, aws_date_format, Ptr{aws_byte_buf}), dt, fmt, output_buf)
end

"""
    aws_date_time_to_utc_time_str(dt, fmt, output_buf)

Copies the current time as a formatted date string in utc time into output\\_buf. If buffer is too small, it will return [`AWS_OP_ERR`](@ref). A good size suggestion is [`AWS_DATE_TIME_STR_MAX_LEN`](@ref) bytes. AWS\\_DATE\\_FORMAT\\_AUTO\\_DETECT is not allowed.

### Prototype
```c
int aws_date_time_to_utc_time_str( const struct aws_date_time *dt, enum aws_date_format fmt, struct aws_byte_buf *output_buf);
```
"""
function aws_date_time_to_utc_time_str(dt, fmt, output_buf)
    ccall((:aws_date_time_to_utc_time_str, libawscrt), Cint, (Ptr{aws_date_time}, aws_date_format, Ptr{aws_byte_buf}), dt, fmt, output_buf)
end

"""
    aws_date_time_to_local_time_short_str(dt, fmt, output_buf)

Copies the current time as a formatted short date string in local time into output\\_buf. If buffer is too small, it will return [`AWS_OP_ERR`](@ref). A good size suggestion is [`AWS_DATE_TIME_STR_MAX_LEN`](@ref) bytes. AWS\\_DATE\\_FORMAT\\_AUTO\\_DETECT is not allowed.

### Prototype
```c
int aws_date_time_to_local_time_short_str( const struct aws_date_time *dt, enum aws_date_format fmt, struct aws_byte_buf *output_buf);
```
"""
function aws_date_time_to_local_time_short_str(dt, fmt, output_buf)
    ccall((:aws_date_time_to_local_time_short_str, libawscrt), Cint, (Ptr{aws_date_time}, aws_date_format, Ptr{aws_byte_buf}), dt, fmt, output_buf)
end

"""
    aws_date_time_to_utc_time_short_str(dt, fmt, output_buf)

Copies the current time as a formatted short date string in utc time into output\\_buf. If buffer is too small, it will return [`AWS_OP_ERR`](@ref). A good size suggestion is [`AWS_DATE_TIME_STR_MAX_LEN`](@ref) bytes. AWS\\_DATE\\_FORMAT\\_AUTO\\_DETECT is not allowed.

### Prototype
```c
int aws_date_time_to_utc_time_short_str( const struct aws_date_time *dt, enum aws_date_format fmt, struct aws_byte_buf *output_buf);
```
"""
function aws_date_time_to_utc_time_short_str(dt, fmt, output_buf)
    ccall((:aws_date_time_to_utc_time_short_str, libawscrt), Cint, (Ptr{aws_date_time}, aws_date_format, Ptr{aws_byte_buf}), dt, fmt, output_buf)
end

"""
    aws_date_time_as_epoch_secs(dt)

### Prototype
```c
double aws_date_time_as_epoch_secs(const struct aws_date_time *dt);
```
"""
function aws_date_time_as_epoch_secs(dt)
    ccall((:aws_date_time_as_epoch_secs, libawscrt), Cdouble, (Ptr{aws_date_time},), dt)
end

"""
    aws_date_time_as_nanos(dt)

### Prototype
```c
uint64_t aws_date_time_as_nanos(const struct aws_date_time *dt);
```
"""
function aws_date_time_as_nanos(dt)
    ccall((:aws_date_time_as_nanos, libawscrt), UInt64, (Ptr{aws_date_time},), dt)
end

"""
    aws_date_time_as_millis(dt)

### Prototype
```c
uint64_t aws_date_time_as_millis(const struct aws_date_time *dt);
```
"""
function aws_date_time_as_millis(dt)
    ccall((:aws_date_time_as_millis, libawscrt), UInt64, (Ptr{aws_date_time},), dt)
end

"""
    aws_date_time_year(dt, local_time)

### Prototype
```c
uint16_t aws_date_time_year(const struct aws_date_time *dt, bool local_time);
```
"""
function aws_date_time_year(dt, local_time)
    ccall((:aws_date_time_year, libawscrt), UInt16, (Ptr{aws_date_time}, Bool), dt, local_time)
end

"""
    aws_date_time_month(dt, local_time)

### Prototype
```c
enum aws_date_month aws_date_time_month(const struct aws_date_time *dt, bool local_time);
```
"""
function aws_date_time_month(dt, local_time)
    ccall((:aws_date_time_month, libawscrt), aws_date_month, (Ptr{aws_date_time}, Bool), dt, local_time)
end

"""
    aws_date_time_month_day(dt, local_time)

### Prototype
```c
uint8_t aws_date_time_month_day(const struct aws_date_time *dt, bool local_time);
```
"""
function aws_date_time_month_day(dt, local_time)
    ccall((:aws_date_time_month_day, libawscrt), UInt8, (Ptr{aws_date_time}, Bool), dt, local_time)
end

"""
    aws_date_time_day_of_week(dt, local_time)

### Prototype
```c
enum aws_date_day_of_week aws_date_time_day_of_week(const struct aws_date_time *dt, bool local_time);
```
"""
function aws_date_time_day_of_week(dt, local_time)
    ccall((:aws_date_time_day_of_week, libawscrt), aws_date_day_of_week, (Ptr{aws_date_time}, Bool), dt, local_time)
end

"""
    aws_date_time_hour(dt, local_time)

### Prototype
```c
uint8_t aws_date_time_hour(const struct aws_date_time *dt, bool local_time);
```
"""
function aws_date_time_hour(dt, local_time)
    ccall((:aws_date_time_hour, libawscrt), UInt8, (Ptr{aws_date_time}, Bool), dt, local_time)
end

"""
    aws_date_time_minute(dt, local_time)

### Prototype
```c
uint8_t aws_date_time_minute(const struct aws_date_time *dt, bool local_time);
```
"""
function aws_date_time_minute(dt, local_time)
    ccall((:aws_date_time_minute, libawscrt), UInt8, (Ptr{aws_date_time}, Bool), dt, local_time)
end

"""
    aws_date_time_second(dt, local_time)

### Prototype
```c
uint8_t aws_date_time_second(const struct aws_date_time *dt, bool local_time);
```
"""
function aws_date_time_second(dt, local_time)
    ccall((:aws_date_time_second, libawscrt), UInt8, (Ptr{aws_date_time}, Bool), dt, local_time)
end

"""
    aws_date_time_dst(dt, local_time)

### Prototype
```c
bool aws_date_time_dst(const struct aws_date_time *dt, bool local_time);
```
"""
function aws_date_time_dst(dt, local_time)
    ccall((:aws_date_time_dst, libawscrt), Bool, (Ptr{aws_date_time}, Bool), dt, local_time)
end

"""
    aws_date_time_diff(a, b)

returns the difference of a and b (a - b) in seconds.

### Prototype
```c
time_t aws_date_time_diff(const struct aws_date_time *a, const struct aws_date_time *b);
```
"""
function aws_date_time_diff(a, b)
    ccall((:aws_date_time_diff, libawscrt), time_t, (Ptr{aws_date_time}, Ptr{aws_date_time}), a, b)
end

"""
    aws_device_random_u64(output)

Get an unpredictably random 64bit number, suitable for cryptographic use.

### Prototype
```c
int aws_device_random_u64(uint64_t *output);
```
"""
function aws_device_random_u64(output)
    ccall((:aws_device_random_u64, libawscrt), Cint, (Ptr{UInt64},), output)
end

"""
    aws_device_random_u32(output)

Get an unpredictably random 32bit number, suitable for cryptographic use.

### Prototype
```c
int aws_device_random_u32(uint32_t *output);
```
"""
function aws_device_random_u32(output)
    ccall((:aws_device_random_u32, libawscrt), Cint, (Ptr{UInt32},), output)
end

"""
    aws_device_random_u16(output)

Get an unpredictably random 16bit number, suitable for cryptographic use.

### Prototype
```c
int aws_device_random_u16(uint16_t *output);
```
"""
function aws_device_random_u16(output)
    ccall((:aws_device_random_u16, libawscrt), Cint, (Ptr{UInt16},), output)
end

"""
    aws_device_random_u8(output)

Get an unpredictably random 8bit number, suitable for cryptographic use.

### Prototype
```c
int aws_device_random_u8(uint8_t *output);
```
"""
function aws_device_random_u8(output)
    ccall((:aws_device_random_u8, libawscrt), Cint, (Ptr{UInt8},), output)
end

"""
    aws_device_random_buffer(output)

Fill a buffer with unpredictably random bytes, suitable for cryptographic use.

### Prototype
```c
int aws_device_random_buffer(struct aws_byte_buf *output);
```
"""
function aws_device_random_buffer(output)
    ccall((:aws_device_random_buffer, libawscrt), Cint, (Ptr{aws_byte_buf},), output)
end

"""
    aws_hex_compute_encoded_len(to_encode_len, encoded_length)

### Prototype
```c
int aws_hex_compute_encoded_len(size_t to_encode_len, size_t *encoded_length);
```
"""
function aws_hex_compute_encoded_len(to_encode_len, encoded_length)
    ccall((:aws_hex_compute_encoded_len, libawscrt), Cint, (Csize_t, Ptr{Csize_t}), to_encode_len, encoded_length)
end

"""
    aws_hex_encode(to_encode, output)

### Prototype
```c
int aws_hex_encode(const struct aws_byte_cursor *AWS_RESTRICT to_encode, struct aws_byte_buf *AWS_RESTRICT output);
```
"""
function aws_hex_encode(to_encode, output)
    ccall((:aws_hex_encode, libawscrt), Cint, (Ptr{aws_byte_cursor}, Ptr{aws_byte_buf}), to_encode, output)
end

"""
    aws_hex_encode_append_dynamic(to_encode, output)

### Prototype
```c
int aws_hex_encode_append_dynamic( const struct aws_byte_cursor *AWS_RESTRICT to_encode, struct aws_byte_buf *AWS_RESTRICT output);
```
"""
function aws_hex_encode_append_dynamic(to_encode, output)
    ccall((:aws_hex_encode_append_dynamic, libawscrt), Cint, (Ptr{aws_byte_cursor}, Ptr{aws_byte_buf}), to_encode, output)
end

"""
    aws_hex_compute_decoded_len(to_decode_len, decoded_len)

### Prototype
```c
int aws_hex_compute_decoded_len(size_t to_decode_len, size_t *decoded_len);
```
"""
function aws_hex_compute_decoded_len(to_decode_len, decoded_len)
    ccall((:aws_hex_compute_decoded_len, libawscrt), Cint, (Csize_t, Ptr{Csize_t}), to_decode_len, decoded_len)
end

"""
    aws_hex_decode(to_decode, output)

### Prototype
```c
int aws_hex_decode(const struct aws_byte_cursor *AWS_RESTRICT to_decode, struct aws_byte_buf *AWS_RESTRICT output);
```
"""
function aws_hex_decode(to_decode, output)
    ccall((:aws_hex_decode, libawscrt), Cint, (Ptr{aws_byte_cursor}, Ptr{aws_byte_buf}), to_decode, output)
end

"""
    aws_base64_compute_encoded_len(to_encode_len, encoded_len)

### Prototype
```c
int aws_base64_compute_encoded_len(size_t to_encode_len, size_t *encoded_len);
```
"""
function aws_base64_compute_encoded_len(to_encode_len, encoded_len)
    ccall((:aws_base64_compute_encoded_len, libawscrt), Cint, (Csize_t, Ptr{Csize_t}), to_encode_len, encoded_len)
end

"""
    aws_base64_encode(to_encode, output)

### Prototype
```c
int aws_base64_encode(const struct aws_byte_cursor *AWS_RESTRICT to_encode, struct aws_byte_buf *AWS_RESTRICT output);
```
"""
function aws_base64_encode(to_encode, output)
    ccall((:aws_base64_encode, libawscrt), Cint, (Ptr{aws_byte_cursor}, Ptr{aws_byte_buf}), to_encode, output)
end

"""
    aws_base64_compute_decoded_len(to_decode, decoded_len)

### Prototype
```c
int aws_base64_compute_decoded_len(const struct aws_byte_cursor *AWS_RESTRICT to_decode, size_t *decoded_len);
```
"""
function aws_base64_compute_decoded_len(to_decode, decoded_len)
    ccall((:aws_base64_compute_decoded_len, libawscrt), Cint, (Ptr{aws_byte_cursor}, Ptr{Csize_t}), to_decode, decoded_len)
end

"""
    aws_base64_decode(to_decode, output)

### Prototype
```c
int aws_base64_decode(const struct aws_byte_cursor *AWS_RESTRICT to_decode, struct aws_byte_buf *AWS_RESTRICT output);
```
"""
function aws_base64_decode(to_decode, output)
    ccall((:aws_base64_decode, libawscrt), Cint, (Ptr{aws_byte_cursor}, Ptr{aws_byte_buf}), to_decode, output)
end

"""
    aws_write_u64(value, buffer)

### Prototype
```c
AWS_STATIC_IMPL void aws_write_u64(uint64_t value, uint8_t *buffer);
```
"""
function aws_write_u64(value, buffer)
    ccall((:aws_write_u64, libawscrt), Cvoid, (UInt64, Ptr{UInt8}), value, buffer)
end

"""
    aws_read_u64(buffer)

### Prototype
```c
AWS_STATIC_IMPL uint64_t aws_read_u64(const uint8_t *buffer);
```
"""
function aws_read_u64(buffer)
    ccall((:aws_read_u64, libawscrt), UInt64, (Ptr{UInt8},), buffer)
end

"""
    aws_write_u32(value, buffer)

### Prototype
```c
AWS_STATIC_IMPL void aws_write_u32(uint32_t value, uint8_t *buffer);
```
"""
function aws_write_u32(value, buffer)
    ccall((:aws_write_u32, libawscrt), Cvoid, (UInt32, Ptr{UInt8}), value, buffer)
end

"""
    aws_read_u32(buffer)

### Prototype
```c
AWS_STATIC_IMPL uint32_t aws_read_u32(const uint8_t *buffer);
```
"""
function aws_read_u32(buffer)
    ccall((:aws_read_u32, libawscrt), UInt32, (Ptr{UInt8},), buffer)
end

"""
    aws_write_u24(value, buffer)

### Prototype
```c
AWS_STATIC_IMPL void aws_write_u24(uint32_t value, uint8_t *buffer);
```
"""
function aws_write_u24(value, buffer)
    ccall((:aws_write_u24, libawscrt), Cvoid, (UInt32, Ptr{UInt8}), value, buffer)
end

"""
    aws_read_u24(buffer)

### Prototype
```c
AWS_STATIC_IMPL uint32_t aws_read_u24(const uint8_t *buffer);
```
"""
function aws_read_u24(buffer)
    ccall((:aws_read_u24, libawscrt), UInt32, (Ptr{UInt8},), buffer)
end

"""
    aws_write_u16(value, buffer)

### Prototype
```c
AWS_STATIC_IMPL void aws_write_u16(uint16_t value, uint8_t *buffer);
```
"""
function aws_write_u16(value, buffer)
    ccall((:aws_write_u16, libawscrt), Cvoid, (UInt16, Ptr{UInt8}), value, buffer)
end

"""
    aws_read_u16(buffer)

### Prototype
```c
AWS_STATIC_IMPL uint16_t aws_read_u16(const uint8_t *buffer);
```
"""
function aws_read_u16(buffer)
    ccall((:aws_read_u16, libawscrt), UInt16, (Ptr{UInt8},), buffer)
end

@cenum aws_text_encoding::UInt32 begin
    AWS_TEXT_UNKNOWN = 0
    AWS_TEXT_UTF8 = 1
    AWS_TEXT_UTF16 = 2
    AWS_TEXT_UTF32 = 3
    AWS_TEXT_ASCII = 4
end

"""
    aws_text_detect_encoding(bytes, size)

### Prototype
```c
AWS_STATIC_IMPL enum aws_text_encoding aws_text_detect_encoding(const uint8_t *bytes, size_t size);
```
"""
function aws_text_detect_encoding(bytes, size)
    ccall((:aws_text_detect_encoding, libawscrt), aws_text_encoding, (Ptr{UInt8}, Csize_t), bytes, size)
end

"""
    aws_text_is_utf8(bytes, size)

### Prototype
```c
AWS_STATIC_IMPL bool aws_text_is_utf8(const uint8_t *bytes, size_t size);
```
"""
function aws_text_is_utf8(bytes, size)
    ccall((:aws_text_is_utf8, libawscrt), Bool, (Ptr{UInt8}, Csize_t), bytes, size)
end

"""
    aws_get_environment_value(allocator, variable_name, value_out)

### Prototype
```c
int aws_get_environment_value( struct aws_allocator *allocator, const struct aws_string *variable_name, struct aws_string **value_out);
```
"""
function aws_get_environment_value(allocator, variable_name, value_out)
    ccall((:aws_get_environment_value, libawscrt), Cint, (Ptr{aws_allocator}, Ptr{aws_string}, Ptr{Ptr{aws_string}}), allocator, variable_name, value_out)
end

"""
    aws_set_environment_value(variable_name, value)

### Prototype
```c
int aws_set_environment_value(const struct aws_string *variable_name, const struct aws_string *value);
```
"""
function aws_set_environment_value(variable_name, value)
    ccall((:aws_set_environment_value, libawscrt), Cint, (Ptr{aws_string}, Ptr{aws_string}), variable_name, value)
end

"""
    aws_unset_environment_value(variable_name)

### Prototype
```c
int aws_unset_environment_value(const struct aws_string *variable_name);
```
"""
function aws_unset_environment_value(variable_name)
    ccall((:aws_unset_environment_value, libawscrt), Cint, (Ptr{aws_string},), variable_name)
end

struct aws_error_info
    error_code::Cint
    literal_name::Ptr{Cchar}
    error_str::Ptr{Cchar}
    lib_name::Ptr{Cchar}
    formatted_name::Ptr{Cchar}
end

struct aws_error_info_list
    error_list::Ptr{aws_error_info}
    count::UInt16
end

# typedef void ( aws_error_handler_fn ) ( int err , void * ctx )
const aws_error_handler_fn = Cvoid

"""
    aws_last_error()

### Prototype
```c
int aws_last_error(void);
```
"""
function aws_last_error()
    ccall((:aws_last_error, libawscrt), Cint, ())
end

"""
    aws_error_str(err)

### Prototype
```c
const char *aws_error_str(int err);
```
"""
function aws_error_str(err)
    ccall((:aws_error_str, libawscrt), Ptr{Cchar}, (Cint,), err)
end

"""
    aws_error_name(err)

### Prototype
```c
const char *aws_error_name(int err);
```
"""
function aws_error_name(err)
    ccall((:aws_error_name, libawscrt), Ptr{Cchar}, (Cint,), err)
end

"""
    aws_error_lib_name(err)

### Prototype
```c
const char *aws_error_lib_name(int err);
```
"""
function aws_error_lib_name(err)
    ccall((:aws_error_lib_name, libawscrt), Ptr{Cchar}, (Cint,), err)
end

"""
    aws_error_debug_str(err)

### Prototype
```c
const char *aws_error_debug_str(int err);
```
"""
function aws_error_debug_str(err)
    ccall((:aws_error_debug_str, libawscrt), Ptr{Cchar}, (Cint,), err)
end

"""
    aws_raise_error_private(err)

### Prototype
```c
void aws_raise_error_private(int err);
```
"""
function aws_raise_error_private(err)
    ccall((:aws_raise_error_private, libawscrt), Cvoid, (Cint,), err)
end

"""
    aws_reset_error()

### Prototype
```c
void aws_reset_error(void);
```
"""
function aws_reset_error()
    ccall((:aws_reset_error, libawscrt), Cvoid, ())
end

"""
    aws_restore_error(err)

### Prototype
```c
void aws_restore_error(int err);
```
"""
function aws_restore_error(err)
    ccall((:aws_restore_error, libawscrt), Cvoid, (Cint,), err)
end

"""
    aws_set_global_error_handler_fn(handler, ctx)

### Prototype
```c
aws_error_handler_fn *aws_set_global_error_handler_fn(aws_error_handler_fn *handler, void *ctx);
```
"""
function aws_set_global_error_handler_fn(handler, ctx)
    ccall((:aws_set_global_error_handler_fn, libawscrt), Ptr{Cvoid}, (Ptr{Cvoid}, Ptr{Cvoid}), handler, ctx)
end

"""
    aws_set_thread_local_error_handler_fn(handler, ctx)

### Prototype
```c
aws_error_handler_fn *aws_set_thread_local_error_handler_fn(aws_error_handler_fn *handler, void *ctx);
```
"""
function aws_set_thread_local_error_handler_fn(handler, ctx)
    ccall((:aws_set_thread_local_error_handler_fn, libawscrt), Ptr{Cvoid}, (Ptr{Cvoid}, Ptr{Cvoid}), handler, ctx)
end

"""
    aws_register_error_info(error_info)

TODO: this needs to be a private function (wait till we have the cmake story better before moving it though). It should be external for the purpose of other libs we own, but customers should not be able to hit it without going out of their way to do so.

### Prototype
```c
void aws_register_error_info(const struct aws_error_info_list *error_info);
```
"""
function aws_register_error_info(error_info)
    ccall((:aws_register_error_info, libawscrt), Cvoid, (Ptr{aws_error_info_list},), error_info)
end

"""
    aws_unregister_error_info(error_info)

### Prototype
```c
void aws_unregister_error_info(const struct aws_error_info_list *error_info);
```
"""
function aws_unregister_error_info(error_info)
    ccall((:aws_unregister_error_info, libawscrt), Cvoid, (Ptr{aws_error_info_list},), error_info)
end

"""
    aws_translate_and_raise_io_error(error_no)

Convert a c library io error into an aws error.

### Prototype
```c
int aws_translate_and_raise_io_error(int error_no);
```
"""
function aws_translate_and_raise_io_error(error_no)
    ccall((:aws_translate_and_raise_io_error, libawscrt), Cint, (Cint,), error_no)
end

@cenum aws_common_error::UInt32 begin
    AWS_ERROR_SUCCESS = 0
    AWS_ERROR_OOM = 1
    AWS_ERROR_NO_SPACE = 2
    AWS_ERROR_UNKNOWN = 3
    AWS_ERROR_SHORT_BUFFER = 4
    AWS_ERROR_OVERFLOW_DETECTED = 5
    AWS_ERROR_UNSUPPORTED_OPERATION = 6
    AWS_ERROR_INVALID_BUFFER_SIZE = 7
    AWS_ERROR_INVALID_HEX_STR = 8
    AWS_ERROR_INVALID_BASE64_STR = 9
    AWS_ERROR_INVALID_INDEX = 10
    AWS_ERROR_THREAD_INVALID_SETTINGS = 11
    AWS_ERROR_THREAD_INSUFFICIENT_RESOURCE = 12
    AWS_ERROR_THREAD_NO_PERMISSIONS = 13
    AWS_ERROR_THREAD_NOT_JOINABLE = 14
    AWS_ERROR_THREAD_NO_SUCH_THREAD_ID = 15
    AWS_ERROR_THREAD_DEADLOCK_DETECTED = 16
    AWS_ERROR_MUTEX_NOT_INIT = 17
    AWS_ERROR_MUTEX_TIMEOUT = 18
    AWS_ERROR_MUTEX_CALLER_NOT_OWNER = 19
    AWS_ERROR_MUTEX_FAILED = 20
    AWS_ERROR_COND_VARIABLE_INIT_FAILED = 21
    AWS_ERROR_COND_VARIABLE_TIMED_OUT = 22
    AWS_ERROR_COND_VARIABLE_ERROR_UNKNOWN = 23
    AWS_ERROR_CLOCK_FAILURE = 24
    AWS_ERROR_LIST_EMPTY = 25
    AWS_ERROR_DEST_COPY_TOO_SMALL = 26
    AWS_ERROR_LIST_EXCEEDS_MAX_SIZE = 27
    AWS_ERROR_LIST_STATIC_MODE_CANT_SHRINK = 28
    AWS_ERROR_PRIORITY_QUEUE_FULL = 29
    AWS_ERROR_PRIORITY_QUEUE_EMPTY = 30
    AWS_ERROR_PRIORITY_QUEUE_BAD_NODE = 31
    AWS_ERROR_HASHTBL_ITEM_NOT_FOUND = 32
    AWS_ERROR_INVALID_DATE_STR = 33
    AWS_ERROR_INVALID_ARGUMENT = 34
    AWS_ERROR_RANDOM_GEN_FAILED = 35
    AWS_ERROR_MALFORMED_INPUT_STRING = 36
    AWS_ERROR_UNIMPLEMENTED = 37
    AWS_ERROR_INVALID_STATE = 38
    AWS_ERROR_ENVIRONMENT_GET = 39
    AWS_ERROR_ENVIRONMENT_SET = 40
    AWS_ERROR_ENVIRONMENT_UNSET = 41
    AWS_ERROR_STREAM_UNSEEKABLE = 42
    AWS_ERROR_NO_PERMISSION = 43
    AWS_ERROR_FILE_INVALID_PATH = 44
    AWS_ERROR_MAX_FDS_EXCEEDED = 45
    AWS_ERROR_SYS_CALL_FAILURE = 46
    AWS_ERROR_C_STRING_BUFFER_NOT_NULL_TERMINATED = 47
    AWS_ERROR_STRING_MATCH_NOT_FOUND = 48
    AWS_ERROR_DIVIDE_BY_ZERO = 49
    AWS_ERROR_INVALID_FILE_HANDLE = 50
    AWS_ERROR_OPERATION_INTERUPTED = 51
    AWS_ERROR_DIRECTORY_NOT_EMPTY = 52
    AWS_ERROR_PLATFORM_NOT_SUPPORTED = 53
    AWS_ERROR_END_COMMON_RANGE = 1023
end

"""
    aws_cache_new_fifo(allocator, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn, max_items)

Initializes the first-in-first-out cache. Sets up the underlying linked hash table. Once `max_items` elements have been added, the oldest(first-in) item will be removed. For the other parameters, see aws/common/hash\\_table.h. Hash table semantics of these arguments are preserved.

### Prototype
```c
struct aws_cache *aws_cache_new_fifo( struct aws_allocator *allocator, aws_hash_fn *hash_fn, aws_hash_callback_eq_fn *equals_fn, aws_hash_callback_destroy_fn *destroy_key_fn, aws_hash_callback_destroy_fn *destroy_value_fn, size_t max_items);
```
"""
function aws_cache_new_fifo(allocator, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn, max_items)
    ccall((:aws_cache_new_fifo, libawscrt), Ptr{aws_cache}, (Ptr{aws_allocator}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Csize_t), allocator, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn, max_items)
end

mutable struct aws_directory_iterator end

@cenum aws_file_type::UInt32 begin
    AWS_FILE_TYPE_FILE = 1
    AWS_FILE_TYPE_SYM_LINK = 2
    AWS_FILE_TYPE_DIRECTORY = 4
end

struct aws_directory_entry
    path::aws_byte_cursor
    relative_path::aws_byte_cursor
    file_type::Cint
    file_size::Int64
end

# typedef bool ( aws_on_directory_entry ) ( const struct aws_directory_entry * entry , void * user_data )
"""
Invoked during calls to [`aws_directory_traverse`](@ref)() as an entry is encountered. entry will contain the parsed directory entry info.

Return true to continue the traversal, or alternatively, if you have a reason to abort the traversal, return false.
"""
const aws_on_directory_entry = Cvoid

"""
    aws_fopen(file_path, mode)

Don't use this. It never should have been added in the first place. It's now deprecated.

### Prototype
```c
FILE *aws_fopen(const char *file_path, const char *mode);
```
"""
function aws_fopen(file_path, mode)
    ccall((:aws_fopen, libawscrt), Ptr{Libc.FILE}, (Ptr{Cchar}, Ptr{Cchar}), file_path, mode)
end

"""
    aws_fopen_safe(file_path, mode)

Opens file at file\\_path using mode. Returns the FILE pointer if successful.

### Prototype
```c
FILE *aws_fopen_safe(const struct aws_string *file_path, const struct aws_string *mode);
```
"""
function aws_fopen_safe(file_path, mode)
    ccall((:aws_fopen_safe, libawscrt), Ptr{Libc.FILE}, (Ptr{aws_string}, Ptr{aws_string}), file_path, mode)
end

"""
    aws_directory_create(dir_path)

Creates a directory if it doesn't currently exist. If the directory already exists, it's ignored and assumed successful.

Returns [`AWS_OP_SUCCESS`](@ref) on success. Otherwise, check [`aws_last_error`](@ref)().

### Prototype
```c
int aws_directory_create(const struct aws_string *dir_path);
```
"""
function aws_directory_create(dir_path)
    ccall((:aws_directory_create, libawscrt), Cint, (Ptr{aws_string},), dir_path)
end

"""
    aws_directory_exists(dir_path)

Returns true if the directory currently exists. Otherwise, it returns false.

### Prototype
```c
bool aws_directory_exists(const struct aws_string *dir_path);
```
"""
function aws_directory_exists(dir_path)
    ccall((:aws_directory_exists, libawscrt), Bool, (Ptr{aws_string},), dir_path)
end

"""
    aws_directory_delete(dir_path, recursive)

Deletes a directory. If the directory is not empty, this will fail unless the recursive parameter is set to true. If recursive is true then the entire directory and all of its contents will be deleted. If it is set to false, the directory will be deleted only if it is empty. Returns [`AWS_OP_SUCCESS`](@ref) if the operation was successful. Otherwise, [`aws_last_error`](@ref)() will contain the error that occurred. If the directory doesn't exist, [`AWS_OP_SUCCESS`](@ref) is still returned.

### Prototype
```c
int aws_directory_delete(const struct aws_string *dir_path, bool recursive);
```
"""
function aws_directory_delete(dir_path, recursive)
    ccall((:aws_directory_delete, libawscrt), Cint, (Ptr{aws_string}, Bool), dir_path, recursive)
end

"""
    aws_file_delete(file_path)

Deletes a file. Returns [`AWS_OP_SUCCESS`](@ref) if the operation was successful. Otherwise, [`aws_last_error`](@ref)() will contain the error that occurred. If the file doesn't exist, [`AWS_OP_SUCCESS`](@ref) is still returned.

### Prototype
```c
int aws_file_delete(const struct aws_string *file_path);
```
"""
function aws_file_delete(file_path)
    ccall((:aws_file_delete, libawscrt), Cint, (Ptr{aws_string},), file_path)
end

"""
    aws_directory_or_file_move(from, to)

Moves directory at from to to. Returns [`AWS_OP_SUCCESS`](@ref) if the operation was successful. Otherwise, [`aws_last_error`](@ref)() will contain the error that occurred.

### Prototype
```c
int aws_directory_or_file_move(const struct aws_string *from, const struct aws_string *to);
```
"""
function aws_directory_or_file_move(from, to)
    ccall((:aws_directory_or_file_move, libawscrt), Cint, (Ptr{aws_string}, Ptr{aws_string}), from, to)
end

"""
    aws_directory_traverse(allocator, path, recursive, on_entry, user_data)

Traverse a directory starting at path.

If you want the traversal to recurse the entire directory, pass recursive as true. Passing false for this parameter will only iterate the contents of the directory, but will not descend into any directories it encounters.

If recursive is set to true, the traversal is performed post-order, depth-first (for practical reasons such as deleting a directory that contains subdirectories or files).

returns [`AWS_OP_SUCCESS`](@ref)(0) on success.

### Prototype
```c
int aws_directory_traverse( struct aws_allocator *allocator, const struct aws_string *path, bool recursive, aws_on_directory_entry *on_entry, void *user_data);
```
"""
function aws_directory_traverse(allocator, path, recursive, on_entry, user_data)
    ccall((:aws_directory_traverse, libawscrt), Cint, (Ptr{aws_allocator}, Ptr{aws_string}, Bool, Ptr{Cvoid}, Ptr{Cvoid}), allocator, path, recursive, on_entry, user_data)
end

"""
    aws_directory_entry_iterator_new(allocator, path)

Creates a read-only iterator of a directory starting at path. If path is invalid or there's any other error condition, NULL will be returned. Call [`aws_last_error`](@ref)() for the exact error in that case.

### Prototype
```c
struct aws_directory_iterator *aws_directory_entry_iterator_new( struct aws_allocator *allocator, const struct aws_string *path);
```
"""
function aws_directory_entry_iterator_new(allocator, path)
    ccall((:aws_directory_entry_iterator_new, libawscrt), Ptr{aws_directory_iterator}, (Ptr{aws_allocator}, Ptr{aws_string}), allocator, path)
end

"""
    aws_directory_entry_iterator_next(iterator)

Moves the iterator to the next entry. Returns [`AWS_OP_SUCCESS`](@ref) if another entry is available, or [`AWS_OP_ERR`](@ref) with AWS\\_ERROR\\_LIST\\_EMPTY as the value for [`aws_last_error`](@ref)() if no more entries are available.

### Prototype
```c
int aws_directory_entry_iterator_next(struct aws_directory_iterator *iterator);
```
"""
function aws_directory_entry_iterator_next(iterator)
    ccall((:aws_directory_entry_iterator_next, libawscrt), Cint, (Ptr{aws_directory_iterator},), iterator)
end

"""
    aws_directory_entry_iterator_previous(iterator)

Moves the iterator to the previous entry. Returns [`AWS_OP_SUCCESS`](@ref) if another entry is available, or [`AWS_OP_ERR`](@ref) with AWS\\_ERROR\\_LIST\\_EMPTY as the value for [`aws_last_error`](@ref)() if no more entries are available.

### Prototype
```c
int aws_directory_entry_iterator_previous(struct aws_directory_iterator *iterator);
```
"""
function aws_directory_entry_iterator_previous(iterator)
    ccall((:aws_directory_entry_iterator_previous, libawscrt), Cint, (Ptr{aws_directory_iterator},), iterator)
end

"""
    aws_directory_entry_iterator_destroy(iterator)

Cleanup and deallocate iterator

### Prototype
```c
void aws_directory_entry_iterator_destroy(struct aws_directory_iterator *iterator);
```
"""
function aws_directory_entry_iterator_destroy(iterator)
    ccall((:aws_directory_entry_iterator_destroy, libawscrt), Cvoid, (Ptr{aws_directory_iterator},), iterator)
end

"""
    aws_directory_entry_iterator_get_value(iterator)

Gets the [`aws_directory_entry`](@ref) value for iterator at the current position. Returns NULL if the iterator contains no entries.

### Prototype
```c
const struct aws_directory_entry *aws_directory_entry_iterator_get_value( const struct aws_directory_iterator *iterator);
```
"""
function aws_directory_entry_iterator_get_value(iterator)
    ccall((:aws_directory_entry_iterator_get_value, libawscrt), Ptr{aws_directory_entry}, (Ptr{aws_directory_iterator},), iterator)
end

"""
    aws_is_any_directory_separator(value)

Returns true iff the character is a directory separator on ANY supported platform.

### Prototype
```c
bool aws_is_any_directory_separator(char value);
```
"""
function aws_is_any_directory_separator(value)
    ccall((:aws_is_any_directory_separator, libawscrt), Bool, (Cchar,), value)
end

"""
    aws_get_platform_directory_separator()

Returns the directory separator used by the local platform

### Prototype
```c
char aws_get_platform_directory_separator(void);
```
"""
function aws_get_platform_directory_separator()
    ccall((:aws_get_platform_directory_separator, libawscrt), Cchar, ())
end

"""
    aws_get_home_directory(allocator)

Returns the current user's home directory.

### Prototype
```c
struct aws_string *aws_get_home_directory(struct aws_allocator *allocator);
```
"""
function aws_get_home_directory(allocator)
    ccall((:aws_get_home_directory, libawscrt), Ptr{aws_string}, (Ptr{aws_allocator},), allocator)
end

"""
    aws_path_exists(path)

Returns true if a file or path exists, otherwise, false.

### Prototype
```c
bool aws_path_exists(const struct aws_string *path);
```
"""
function aws_path_exists(path)
    ccall((:aws_path_exists, libawscrt), Bool, (Ptr{aws_string},), path)
end

"""
    aws_fseek(file, offset, whence)

### Prototype
```c
int aws_fseek(FILE *file, int64_t offset, int whence);
```
"""
function aws_fseek(file, offset, whence)
    ccall((:aws_fseek, libawscrt), Cint, (Ptr{Libc.FILE}, Int64, Cint), file, offset, whence)
end

"""
    aws_file_get_length(file, length)

### Prototype
```c
int aws_file_get_length(FILE *file, int64_t *length);
```
"""
function aws_file_get_length(file, length)
    ccall((:aws_file_get_length, libawscrt), Cint, (Ptr{Libc.FILE}, Ptr{Int64}), file, length)
end

"""
    aws_hash_element

Represents an element in the hash table. Various operations on the hash table may provide pointers to elements stored within the hash table; generally, calling code may alter value, but must not alter key (or any information used to compute key's hash code).

Pointers to elements within the hash are invalidated whenever an operation which may change the number of elements in the hash is invoked (i.e. put, delete, clear, and clean\\_up), regardless of whether the number of elements actually changes.
"""
struct aws_hash_element
    key::Ptr{Cvoid}
    value::Ptr{Cvoid}
end

@cenum aws_hash_iter_status::UInt32 begin
    AWS_HASH_ITER_STATUS_DONE = 0
    AWS_HASH_ITER_STATUS_DELETE_CALLED = 1
    AWS_HASH_ITER_STATUS_READY_FOR_USE = 2
end

struct aws_hash_iter
    map::Ptr{aws_hash_table}
    element::aws_hash_element
    slot::Csize_t
    limit::Csize_t
    status::aws_hash_iter_status
    unused_0::Cint
    unused_1::Ptr{Cvoid}
    unused_2::Ptr{Cvoid}
end

# typedef uint64_t ( aws_hash_fn ) ( const void * key )
"""
Prototype for a key hashing function pointer.
"""
const aws_hash_fn = Cvoid

# typedef bool ( aws_hash_callback_eq_fn ) ( const void * a , const void * b )
"""
Prototype for a hash table equality check function pointer.

This type is usually used for a function that compares two hash table keys, but note that the same type is used for a function that compares two hash table values in [`aws_hash_table_eq`](@ref).

Equality functions used in a hash table must be reflexive (i.e., a == b if and only if b == a), and must be consistent with the hash function in use.
"""
const aws_hash_callback_eq_fn = Cvoid

# typedef void ( aws_hash_callback_destroy_fn ) ( void * key_or_value )
"""
Prototype for a hash table key or value destructor function pointer.

This function is used to destroy elements in the hash table when the table is cleared or cleaned up.

Note that functions which remove individual elements from the hash table provide options of whether or not to invoke the destructors on the key and value of a removed element.
"""
const aws_hash_callback_destroy_fn = Cvoid

"""
    aws_hash_table_init(map, alloc, size, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn)

Initializes a hash map with initial capacity for 'size' elements without resizing. Uses hash\\_fn to compute the hash of each element. equals\\_fn to compute equality of two keys. Whenever an element is removed without being returned, destroy\\_key\\_fn is run on the pointer to the key and destroy\\_value\\_fn is run on the pointer to the value. Either or both may be NULL if a callback is not desired in this case.

### Prototype
```c
int aws_hash_table_init( struct aws_hash_table *map, struct aws_allocator *alloc, size_t size, aws_hash_fn *hash_fn, aws_hash_callback_eq_fn *equals_fn, aws_hash_callback_destroy_fn *destroy_key_fn, aws_hash_callback_destroy_fn *destroy_value_fn);
```
"""
function aws_hash_table_init(map, alloc, size, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn)
    ccall((:aws_hash_table_init, libawscrt), Cint, (Ptr{aws_hash_table}, Ptr{aws_allocator}, Csize_t, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), map, alloc, size, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn)
end

"""
    aws_hash_table_clean_up(map)

Deletes every element from map and frees all associated memory. destroy\\_fn will be called for each element. [`aws_hash_table_init`](@ref) must be called before reusing the hash table.

This method is idempotent.

### Prototype
```c
void aws_hash_table_clean_up(struct aws_hash_table *map);
```
"""
function aws_hash_table_clean_up(map)
    ccall((:aws_hash_table_clean_up, libawscrt), Cvoid, (Ptr{aws_hash_table},), map)
end

"""
    aws_hash_table_swap(a, b)

Safely swaps two hash tables. Note that we swap the entirety of the hash table, including which allocator is associated.

Neither hash table is required to be initialized; if one or both is uninitialized, then the uninitialized state is also swapped.

### Prototype
```c
void aws_hash_table_swap(struct aws_hash_table *AWS_RESTRICT a, struct aws_hash_table *AWS_RESTRICT b);
```
"""
function aws_hash_table_swap(a, b)
    ccall((:aws_hash_table_swap, libawscrt), Cvoid, (Ptr{aws_hash_table}, Ptr{aws_hash_table}), a, b)
end

"""
    aws_hash_table_move(to, from)

Moves the hash table in 'from' to 'to'. After this move, 'from' will be identical to the state of the original 'to' hash table, and 'to' will be in the same state as if it had been passed to [`aws_hash_table_clean_up`](@ref) (that is, it will have no memory allocated, and it will be safe to either discard it or call [`aws_hash_table_clean_up`](@ref) again).

Note that 'to' will not be cleaned up. You should make sure that 'to' is either uninitialized or cleaned up before moving a hashtable into it.

### Prototype
```c
void aws_hash_table_move(struct aws_hash_table *AWS_RESTRICT to, struct aws_hash_table *AWS_RESTRICT from);
```
"""
function aws_hash_table_move(to, from)
    ccall((:aws_hash_table_move, libawscrt), Cvoid, (Ptr{aws_hash_table}, Ptr{aws_hash_table}), to, from)
end

"""
    aws_hash_table_get_entry_count(map)

Returns the current number of entries in the table.

### Prototype
```c
size_t aws_hash_table_get_entry_count(const struct aws_hash_table *map);
```
"""
function aws_hash_table_get_entry_count(map)
    ccall((:aws_hash_table_get_entry_count, libawscrt), Csize_t, (Ptr{aws_hash_table},), map)
end

"""
    aws_hash_iter_begin(map)

Returns an iterator to be used for iterating through a hash table. Iterator will already point to the first element of the table it finds, which can be accessed as iter.element.

This function cannot fail, but if there are no elements in the table, the returned iterator will return true for [`aws_hash_iter_done`](@ref)(&iter).

### Prototype
```c
struct aws_hash_iter aws_hash_iter_begin(const struct aws_hash_table *map);
```
"""
function aws_hash_iter_begin(map)
    ccall((:aws_hash_iter_begin, libawscrt), aws_hash_iter, (Ptr{aws_hash_table},), map)
end

"""
    aws_hash_iter_done(iter)

Returns true if iterator is done iterating through table, false otherwise. If this is true, the iterator will not include an element of the table.

### Prototype
```c
bool aws_hash_iter_done(const struct aws_hash_iter *iter);
```
"""
function aws_hash_iter_done(iter)
    ccall((:aws_hash_iter_done, libawscrt), Bool, (Ptr{aws_hash_iter},), iter)
end

"""
    aws_hash_iter_next(iter)

Updates iterator so that it points to next element of hash table.

This and the two previous functions are designed to be used together with the following idiom:

for (struct [`aws_hash_iter`](@ref) iter = [`aws_hash_iter_begin`](@ref)(&map); ![`aws_hash_iter_done`](@ref)(&iter); [`aws_hash_iter_next`](@ref)(&iter)) { const key\\_type key = *(const key\\_type *)iter.element.key; value\\_type value = *(value\\_type *)iter.element.value; // etc. }

Note that calling this on an iter which is "done" is idempotent: i.e. it will return another iter which is "done".

### Prototype
```c
void aws_hash_iter_next(struct aws_hash_iter *iter);
```
"""
function aws_hash_iter_next(iter)
    ccall((:aws_hash_iter_next, libawscrt), Cvoid, (Ptr{aws_hash_iter},), iter)
end

"""
    aws_hash_iter_delete(iter, destroy_contents)

Deletes the element currently pointed-to by the hash iterator. After calling this method, the element member of the iterator should not be accessed until the next call to [`aws_hash_iter_next`](@ref).

### Parameters
* `destroy_contents`: If true, the destructors for the key and value will be called.
### Prototype
```c
void aws_hash_iter_delete(struct aws_hash_iter *iter, bool destroy_contents);
```
"""
function aws_hash_iter_delete(iter, destroy_contents)
    ccall((:aws_hash_iter_delete, libawscrt), Cvoid, (Ptr{aws_hash_iter}, Bool), iter, destroy_contents)
end

"""
    aws_hash_table_find(map, key, p_elem)

Attempts to locate an element at key. If the element is found, a pointer to the value is placed in *p\\_elem; if it is not found, *pElem is set to NULL. Either way, [`AWS_OP_SUCCESS`](@ref) is returned.

This method does not change the state of the hash table. Therefore, it is safe to call \\_find from multiple threads on the same hash table, provided no mutating operations happen in parallel.

Calling code may update the value in the hash table by modifying **pElem after a successful find. However, this pointer is not guaranteed to remain usable after a subsequent call to \\_put, \\_delete, \\_clear, or \\_clean\\_up.

### Prototype
```c
int aws_hash_table_find(const struct aws_hash_table *map, const void *key, struct aws_hash_element **p_elem);
```
"""
function aws_hash_table_find(map, key, p_elem)
    ccall((:aws_hash_table_find, libawscrt), Cint, (Ptr{aws_hash_table}, Ptr{Cvoid}, Ptr{Ptr{aws_hash_element}}), map, key, p_elem)
end

"""
    aws_hash_table_create(map, key, p_elem, was_created)

Attempts to locate an element at key. If no such element was found, creates a new element, with value initialized to NULL. In either case, a pointer to the element is placed in *p\\_elem.

If was\\_created is non-NULL, *was\\_created is set to 0 if an existing element was found, or 1 is a new element was created.

Returns [`AWS_OP_SUCCESS`](@ref) if an item was found or created. Raises AWS\\_ERROR\\_OOM if hash table expansion was required and memory allocation failed.

### Prototype
```c
int aws_hash_table_create( struct aws_hash_table *map, const void *key, struct aws_hash_element **p_elem, int *was_created);
```
"""
function aws_hash_table_create(map, key, p_elem, was_created)
    ccall((:aws_hash_table_create, libawscrt), Cint, (Ptr{aws_hash_table}, Ptr{Cvoid}, Ptr{Ptr{aws_hash_element}}, Ptr{Cint}), map, key, p_elem, was_created)
end

"""
    aws_hash_table_put(map, key, value, was_created)

Inserts a new element at key, with the given value. If another element exists at that key, the old element will be overwritten; both old key and value objects will be destroyed.

If was\\_created is non-NULL, *was\\_created is set to 0 if an existing element was found, or 1 is a new element was created.

Returns [`AWS_OP_SUCCESS`](@ref) if an item was found or created. Raises AWS\\_ERROR\\_OOM if hash table expansion was required and memory

### Prototype
```c
int aws_hash_table_put(struct aws_hash_table *map, const void *key, void *value, int *was_created);
```
"""
function aws_hash_table_put(map, key, value, was_created)
    ccall((:aws_hash_table_put, libawscrt), Cint, (Ptr{aws_hash_table}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cint}), map, key, value, was_created)
end

"""
    aws_hash_table_remove(map, key, p_value, was_present)

Removes element at key. Always returns [`AWS_OP_SUCCESS`](@ref).

If pValue is non-NULL, the existing value (if any) is moved into (*value) before removing from the table, and destroy\\_fn is \\_not\\_ invoked. If pValue is NULL, then (if the element existed) destroy\\_fn will be invoked on the element being removed.

If was\\_present is non-NULL, it is set to 0 if the element was not present, or 1 if it was present (and is now removed).

### Prototype
```c
int aws_hash_table_remove( struct aws_hash_table *map, const void *key, struct aws_hash_element *p_value, int *was_present);
```
"""
function aws_hash_table_remove(map, key, p_value, was_present)
    ccall((:aws_hash_table_remove, libawscrt), Cint, (Ptr{aws_hash_table}, Ptr{Cvoid}, Ptr{aws_hash_element}, Ptr{Cint}), map, key, p_value, was_present)
end

"""
    aws_hash_table_remove_element(map, p_value)

Removes element already known (typically by find()).

p\\_value should point to a valid element returned by create() or find().

NOTE: DO NOT call this method from inside of a [`aws_hash_table_foreach`](@ref) callback, return [`AWS_COMMON_HASH_TABLE_ITER_DELETE`](@ref) instead.

### Prototype
```c
int aws_hash_table_remove_element(struct aws_hash_table *map, struct aws_hash_element *p_value);
```
"""
function aws_hash_table_remove_element(map, p_value)
    ccall((:aws_hash_table_remove_element, libawscrt), Cint, (Ptr{aws_hash_table}, Ptr{aws_hash_element}), map, p_value)
end

"""
    aws_hash_table_foreach(map, callback, context)

Iterates through every element in the map and invokes the callback on that item. Iteration is performed in an arbitrary, implementation-defined order, and is not guaranteed to be consistent across invocations.

The callback may change the value associated with the key by overwriting the value pointed-to by value. In this case, the on\\_element\\_removed callback will not be invoked, unless the callback invokes [`AWS_COMMON_HASH_TABLE_ITER_DELETE`](@ref) (in which case the on\\_element\\_removed is given the updated value).

The callback must return a bitmask of zero or more of the following values ORed together:

# [`AWS_COMMON_HASH_TABLE_ITER_CONTINUE`](@ref) - Continues iteration to the next element (if not set, iteration stops) # [`AWS_COMMON_HASH_TABLE_ITER_DELETE`](@ref) - Deletes the current value and continues iteration. destroy\\_fn will NOT be invoked. # [`AWS_COMMON_HASH_TABLE_ITER_ERROR`](@ref) - Stop iteration with error. No action will be taken for the current value and the value before this. No rolling back. The deleted value before will NOT be back. [`aws_hash_table_foreach`](@ref) returns [`AWS_OP_ERR`](@ref) after stropping the iteration.

Invoking any method which may change the contents of the hashtable during iteration results in undefined behavior. However, you may safely invoke non-mutating operations during an iteration.

This operation is mutating only if [`AWS_COMMON_HASH_TABLE_ITER_DELETE`](@ref) is returned at some point during iteration. Otherwise, it is non-mutating and is safe to invoke in parallel with other non-mutating operations.

### Prototype
```c
int aws_hash_table_foreach( struct aws_hash_table *map, int (*callback)(void *context, struct aws_hash_element *p_element), void *context);
```
"""
function aws_hash_table_foreach(map, callback, context)
    ccall((:aws_hash_table_foreach, libawscrt), Cint, (Ptr{aws_hash_table}, Ptr{Cvoid}, Ptr{Cvoid}), map, callback, context)
end

"""
    aws_hash_table_eq(a, b, value_eq)

Compares two hash tables for equality. Both hash tables must have equivalent key comparators; values will be compared using the comparator passed into this function. The key hash function does not need to be equivalent between the two hash tables.

### Prototype
```c
bool aws_hash_table_eq( const struct aws_hash_table *a, const struct aws_hash_table *b, aws_hash_callback_eq_fn *value_eq);
```
"""
function aws_hash_table_eq(a, b, value_eq)
    ccall((:aws_hash_table_eq, libawscrt), Bool, (Ptr{aws_hash_table}, Ptr{aws_hash_table}, Ptr{Cvoid}), a, b, value_eq)
end

"""
    aws_hash_table_clear(map)

Removes every element from the hash map. destroy\\_fn will be called for each element.

### Prototype
```c
void aws_hash_table_clear(struct aws_hash_table *map);
```
"""
function aws_hash_table_clear(map)
    ccall((:aws_hash_table_clear, libawscrt), Cvoid, (Ptr{aws_hash_table},), map)
end

"""
    aws_hash_c_string(item)

Convenience hash function for NULL-terminated C-strings

### Prototype
```c
uint64_t aws_hash_c_string(const void *item);
```
"""
function aws_hash_c_string(item)
    ccall((:aws_hash_c_string, libawscrt), UInt64, (Ptr{Cvoid},), item)
end

"""
    aws_hash_string(item)

Convenience hash function for struct aws\\_strings. Hash is same as used on the string bytes by [`aws_hash_c_string`](@ref).

### Prototype
```c
uint64_t aws_hash_string(const void *item);
```
"""
function aws_hash_string(item)
    ccall((:aws_hash_string, libawscrt), UInt64, (Ptr{Cvoid},), item)
end

"""
    aws_hash_byte_cursor_ptr(item)

Convenience hash function for struct [`aws_byte_cursor`](@ref). Hash is same as used on the string bytes by [`aws_hash_c_string`](@ref).

### Prototype
```c
uint64_t aws_hash_byte_cursor_ptr(const void *item);
```
"""
function aws_hash_byte_cursor_ptr(item)
    ccall((:aws_hash_byte_cursor_ptr, libawscrt), UInt64, (Ptr{Cvoid},), item)
end

"""
    aws_hash_ptr(item)

Convenience hash function which hashes the pointer value directly, without dereferencing. This can be used in cases where pointer identity is desired, or where a uintptr\\_t is encoded into a const void *.

### Prototype
```c
uint64_t aws_hash_ptr(const void *item);
```
"""
function aws_hash_ptr(item)
    ccall((:aws_hash_ptr, libawscrt), UInt64, (Ptr{Cvoid},), item)
end

"""
    aws_hash_combine(item1, item2)

### Prototype
```c
uint64_t aws_hash_combine(uint64_t item1, uint64_t item2);
```
"""
function aws_hash_combine(item1, item2)
    ccall((:aws_hash_combine, libawscrt), UInt64, (UInt64, UInt64), item1, item2)
end

"""
    aws_hash_callback_c_str_eq(a, b)

Convenience eq callback for NULL-terminated C-strings

### Prototype
```c
bool aws_hash_callback_c_str_eq(const void *a, const void *b);
```
"""
function aws_hash_callback_c_str_eq(a, b)
    ccall((:aws_hash_callback_c_str_eq, libawscrt), Bool, (Ptr{Cvoid}, Ptr{Cvoid}), a, b)
end

"""
    aws_hash_callback_string_eq(a, b)

Convenience eq callback for AWS strings

### Prototype
```c
bool aws_hash_callback_string_eq(const void *a, const void *b);
```
"""
function aws_hash_callback_string_eq(a, b)
    ccall((:aws_hash_callback_string_eq, libawscrt), Bool, (Ptr{Cvoid}, Ptr{Cvoid}), a, b)
end

"""
    aws_hash_callback_string_destroy(a)

Convenience destroy callback for AWS strings

### Prototype
```c
void aws_hash_callback_string_destroy(void *a);
```
"""
function aws_hash_callback_string_destroy(a)
    ccall((:aws_hash_callback_string_destroy, libawscrt), Cvoid, (Ptr{Cvoid},), a)
end

"""
    aws_ptr_eq(a, b)

Equality function which compares pointer equality.

### Prototype
```c
bool aws_ptr_eq(const void *a, const void *b);
```
"""
function aws_ptr_eq(a, b)
    ccall((:aws_ptr_eq, libawscrt), Bool, (Ptr{Cvoid}, Ptr{Cvoid}), a, b)
end

"""
    aws_hash_table_is_valid(map)

Best-effort check of [`hash_table_state`](@ref) data-structure invariants

### Prototype
```c
bool aws_hash_table_is_valid(const struct aws_hash_table *map);
```
"""
function aws_hash_table_is_valid(map)
    ccall((:aws_hash_table_is_valid, libawscrt), Bool, (Ptr{aws_hash_table},), map)
end

"""
    aws_hash_iter_is_valid(iter)

Given a pointer to a hash\\_iter, checks that it is well-formed, with all data-structure invariants.

### Prototype
```c
bool aws_hash_iter_is_valid(const struct aws_hash_iter *iter);
```
"""
function aws_hash_iter_is_valid(iter)
    ccall((:aws_hash_iter_is_valid, libawscrt), Bool, (Ptr{aws_hash_iter},), iter)
end

"""
    aws_cache_new_lifo(allocator, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn, max_items)

Initializes the last-in-first-out cache. Sets up the underlying linked hash table. Once `max_items` elements have been added, the latest(last-in) item will be removed. For the other parameters, see aws/common/hash\\_table.h. Hash table semantics of these arguments are preserved.

### Prototype
```c
struct aws_cache *aws_cache_new_lifo( struct aws_allocator *allocator, aws_hash_fn *hash_fn, aws_hash_callback_eq_fn *equals_fn, aws_hash_callback_destroy_fn *destroy_key_fn, aws_hash_callback_destroy_fn *destroy_value_fn, size_t max_items);
```
"""
function aws_cache_new_lifo(allocator, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn, max_items)
    ccall((:aws_cache_new_lifo, libawscrt), Ptr{aws_cache}, (Ptr{aws_allocator}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Csize_t), allocator, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn, max_items)
end

"""
    aws_linked_hash_table_node

Linked-List node stored in the table. This is the node type that will be returned in [`aws_linked_hash_table_get_iteration_list`](@ref)().
"""
struct aws_linked_hash_table_node
    node::aws_linked_list_node
    table::Ptr{aws_linked_hash_table}
    key::Ptr{Cvoid}
    value::Ptr{Cvoid}
end

"""
    aws_linked_hash_table_init(table, allocator, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn, initial_item_count)

Initializes the table. Sets up the underlying hash table and linked list. For the other parameters, see aws/common/hash\\_table.h. Hash table semantics of these arguments are preserved.

### Prototype
```c
int aws_linked_hash_table_init( struct aws_linked_hash_table *table, struct aws_allocator *allocator, aws_hash_fn *hash_fn, aws_hash_callback_eq_fn *equals_fn, aws_hash_callback_destroy_fn *destroy_key_fn, aws_hash_callback_destroy_fn *destroy_value_fn, size_t initial_item_count);
```
"""
function aws_linked_hash_table_init(table, allocator, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn, initial_item_count)
    ccall((:aws_linked_hash_table_init, libawscrt), Cint, (Ptr{aws_linked_hash_table}, Ptr{aws_allocator}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Csize_t), table, allocator, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn, initial_item_count)
end

"""
    aws_linked_hash_table_clean_up(table)

Cleans up the table. Elements in the table will be evicted and cleanup callbacks will be invoked.

### Prototype
```c
void aws_linked_hash_table_clean_up(struct aws_linked_hash_table *table);
```
"""
function aws_linked_hash_table_clean_up(table)
    ccall((:aws_linked_hash_table_clean_up, libawscrt), Cvoid, (Ptr{aws_linked_hash_table},), table)
end

"""
    aws_linked_hash_table_find(table, key, p_value)

Finds element in the table by key. If found, [`AWS_OP_SUCCESS`](@ref) will be returned. If not found, [`AWS_OP_SUCCESS`](@ref) will be returned and *p\\_value will be NULL.

If any errors occur [`AWS_OP_ERR`](@ref) will be returned.

### Prototype
```c
int aws_linked_hash_table_find(struct aws_linked_hash_table *table, const void *key, void **p_value);
```
"""
function aws_linked_hash_table_find(table, key, p_value)
    ccall((:aws_linked_hash_table_find, libawscrt), Cint, (Ptr{aws_linked_hash_table}, Ptr{Cvoid}, Ptr{Ptr{Cvoid}}), table, key, p_value)
end

"""
    aws_linked_hash_table_find_and_move_to_back(table, key, p_value)

Finds element in the table by key. If found, [`AWS_OP_SUCCESS`](@ref) will be returned and the item will be moved to the back of the list. If not found, [`AWS_OP_SUCCESS`](@ref) will be returned and *p\\_value will be NULL.

Note: this will change the order of elements

### Prototype
```c
int aws_linked_hash_table_find_and_move_to_back(struct aws_linked_hash_table *table, const void *key, void **p_value);
```
"""
function aws_linked_hash_table_find_and_move_to_back(table, key, p_value)
    ccall((:aws_linked_hash_table_find_and_move_to_back, libawscrt), Cint, (Ptr{aws_linked_hash_table}, Ptr{Cvoid}, Ptr{Ptr{Cvoid}}), table, key, p_value)
end

"""
    aws_linked_hash_table_put(table, key, p_value)

Puts `p_value` at `key`. If an element is already stored at `key` it will be replaced.

### Prototype
```c
int aws_linked_hash_table_put(struct aws_linked_hash_table *table, const void *key, void *p_value);
```
"""
function aws_linked_hash_table_put(table, key, p_value)
    ccall((:aws_linked_hash_table_put, libawscrt), Cint, (Ptr{aws_linked_hash_table}, Ptr{Cvoid}, Ptr{Cvoid}), table, key, p_value)
end

"""
    aws_linked_hash_table_remove(table, key)

Removes item at `key` from the table.

### Prototype
```c
int aws_linked_hash_table_remove(struct aws_linked_hash_table *table, const void *key);
```
"""
function aws_linked_hash_table_remove(table, key)
    ccall((:aws_linked_hash_table_remove, libawscrt), Cint, (Ptr{aws_linked_hash_table}, Ptr{Cvoid}), table, key)
end

"""
    aws_linked_hash_table_clear(table)

Clears all items from the table.

### Prototype
```c
void aws_linked_hash_table_clear(struct aws_linked_hash_table *table);
```
"""
function aws_linked_hash_table_clear(table)
    ccall((:aws_linked_hash_table_clear, libawscrt), Cvoid, (Ptr{aws_linked_hash_table},), table)
end

"""
    aws_linked_hash_table_get_element_count(table)

returns number of elements in the table.

### Prototype
```c
size_t aws_linked_hash_table_get_element_count(const struct aws_linked_hash_table *table);
```
"""
function aws_linked_hash_table_get_element_count(table)
    ccall((:aws_linked_hash_table_get_element_count, libawscrt), Csize_t, (Ptr{aws_linked_hash_table},), table)
end

"""
    aws_linked_hash_table_move_node_to_end_of_list(table, node)

Move the [`aws_linked_hash_table_node`](@ref) to the end of the list.

Note: this will change the order of elements

### Prototype
```c
void aws_linked_hash_table_move_node_to_end_of_list( struct aws_linked_hash_table *table, struct aws_linked_hash_table_node *node);
```
"""
function aws_linked_hash_table_move_node_to_end_of_list(table, node)
    ccall((:aws_linked_hash_table_move_node_to_end_of_list, libawscrt), Cvoid, (Ptr{aws_linked_hash_table}, Ptr{aws_linked_hash_table_node}), table, node)
end

"""
    aws_linked_hash_table_get_iteration_list(table)

returns the underlying linked list for iteration.

The returned list has nodes of the type: [`aws_linked_hash_table_node`](@ref). Use [`AWS_CONTAINER_OF`](@ref) for access to the element.

### Prototype
```c
const struct aws_linked_list *aws_linked_hash_table_get_iteration_list(const struct aws_linked_hash_table *table);
```
"""
function aws_linked_hash_table_get_iteration_list(table)
    ccall((:aws_linked_hash_table_get_iteration_list, libawscrt), Ptr{aws_linked_list}, (Ptr{aws_linked_hash_table},), table)
end

# typedef int ( aws_log_channel_send_fn ) ( struct aws_log_channel * channel , struct aws_string * output )
const aws_log_channel_send_fn = Cvoid

# typedef void ( aws_log_channel_clean_up_fn ) ( struct aws_log_channel * channel )
const aws_log_channel_clean_up_fn = Cvoid

struct aws_log_channel_vtable
    send::Ptr{Cvoid}
    clean_up::Ptr{Cvoid}
end

struct aws_log_writer_vtable
    write::Ptr{Cvoid}
    clean_up::Ptr{Cvoid}
end

struct aws_log_writer
    vtable::Ptr{aws_log_writer_vtable}
    allocator::Ptr{aws_allocator}
    impl::Ptr{Cvoid}
end

struct aws_log_channel
    vtable::Ptr{aws_log_channel_vtable}
    allocator::Ptr{aws_allocator}
    writer::Ptr{aws_log_writer}
    impl::Ptr{Cvoid}
end

"""
    aws_log_channel_init_foreground(channel, allocator, writer)

### Prototype
```c
int aws_log_channel_init_foreground( struct aws_log_channel *channel, struct aws_allocator *allocator, struct aws_log_writer *writer);
```
"""
function aws_log_channel_init_foreground(channel, allocator, writer)
    ccall((:aws_log_channel_init_foreground, libawscrt), Cint, (Ptr{aws_log_channel}, Ptr{aws_allocator}, Ptr{aws_log_writer}), channel, allocator, writer)
end

"""
    aws_log_channel_init_background(channel, allocator, writer)

### Prototype
```c
int aws_log_channel_init_background( struct aws_log_channel *channel, struct aws_allocator *allocator, struct aws_log_writer *writer);
```
"""
function aws_log_channel_init_background(channel, allocator, writer)
    ccall((:aws_log_channel_init_background, libawscrt), Cint, (Ptr{aws_log_channel}, Ptr{aws_allocator}, Ptr{aws_log_writer}), channel, allocator, writer)
end

"""
    aws_log_channel_clean_up(channel)

### Prototype
```c
void aws_log_channel_clean_up(struct aws_log_channel *channel);
```
"""
function aws_log_channel_clean_up(channel)
    ccall((:aws_log_channel_clean_up, libawscrt), Cvoid, (Ptr{aws_log_channel},), channel)
end

# typedef int ( aws_log_formatter_format_fn ) ( struct aws_log_formatter * formatter , struct aws_string * * formatted_output , enum aws_log_level level , aws_log_subject_t subject , const char * format , va_list args )
const aws_log_formatter_format_fn = Cvoid

# typedef void ( aws_log_formatter_clean_up_fn ) ( struct aws_log_formatter * logger )
const aws_log_formatter_clean_up_fn = Cvoid

struct aws_log_formatter_vtable
    format::Ptr{Cvoid}
    clean_up::Ptr{Cvoid}
end

struct aws_log_formatter
    vtable::Ptr{aws_log_formatter_vtable}
    allocator::Ptr{aws_allocator}
    impl::Ptr{Cvoid}
end

struct aws_log_formatter_standard_options
    date_format::aws_date_format
end

"""
    aws_log_level

Controls what log calls pass through the logger and what log calls get filtered out. If a log level has a value of X, then all log calls using a level <= X will appear, while those using a value > X will not occur.

You can filter both dynamically (by setting the log level on the logger object) or statically (by defining AWS\\_STATIC\\_LOG\\_LEVEL to be an appropriate integer module-wide). Statically filtered log calls will be completely compiled out but require a rebuild if you want to get more detail about what's happening.
"""
@cenum aws_log_level::UInt32 begin
    AWS_LL_NONE = 0
    AWS_LL_FATAL = 1
    AWS_LL_ERROR = 2
    AWS_LL_WARN = 3
    AWS_LL_INFO = 4
    AWS_LL_DEBUG = 5
    AWS_LL_TRACE = 6
    AWS_LL_COUNT = 7
end

struct aws_logging_standard_formatting_data
    log_line_buffer::Ptr{Cchar}
    total_length::Csize_t
    level::aws_log_level
    subject_name::Ptr{Cchar}
    format::Ptr{Cchar}
    date_format::aws_date_format
    allocator::Ptr{aws_allocator}
    amount_written::Csize_t
end

"""
    aws_log_formatter_init_default(formatter, allocator, options)

### Prototype
```c
int aws_log_formatter_init_default( struct aws_log_formatter *formatter, struct aws_allocator *allocator, struct aws_log_formatter_standard_options *options);
```
"""
function aws_log_formatter_init_default(formatter, allocator, options)
    ccall((:aws_log_formatter_init_default, libawscrt), Cint, (Ptr{aws_log_formatter}, Ptr{aws_allocator}, Ptr{aws_log_formatter_standard_options}), formatter, allocator, options)
end

"""
    aws_log_formatter_clean_up(formatter)

### Prototype
```c
void aws_log_formatter_clean_up(struct aws_log_formatter *formatter);
```
"""
function aws_log_formatter_clean_up(formatter)
    ccall((:aws_log_formatter_clean_up, libawscrt), Cvoid, (Ptr{aws_log_formatter},), formatter)
end

# typedef int ( aws_log_writer_write_fn ) ( struct aws_log_writer * writer , const struct aws_string * output )
const aws_log_writer_write_fn = Cvoid

# typedef void ( aws_log_writer_clean_up_fn ) ( struct aws_log_writer * writer )
const aws_log_writer_clean_up_fn = Cvoid

struct aws_log_writer_file_options
    filename::Ptr{Cchar}
    file::Ptr{Libc.FILE}
end

"""
    aws_log_writer_init_stdout(writer, allocator)

### Prototype
```c
int aws_log_writer_init_stdout(struct aws_log_writer *writer, struct aws_allocator *allocator);
```
"""
function aws_log_writer_init_stdout(writer, allocator)
    ccall((:aws_log_writer_init_stdout, libawscrt), Cint, (Ptr{aws_log_writer}, Ptr{aws_allocator}), writer, allocator)
end

"""
    aws_log_writer_init_stderr(writer, allocator)

### Prototype
```c
int aws_log_writer_init_stderr(struct aws_log_writer *writer, struct aws_allocator *allocator);
```
"""
function aws_log_writer_init_stderr(writer, allocator)
    ccall((:aws_log_writer_init_stderr, libawscrt), Cint, (Ptr{aws_log_writer}, Ptr{aws_allocator}), writer, allocator)
end

"""
    aws_log_writer_init_file(writer, allocator, options)

### Prototype
```c
int aws_log_writer_init_file( struct aws_log_writer *writer, struct aws_allocator *allocator, struct aws_log_writer_file_options *options);
```
"""
function aws_log_writer_init_file(writer, allocator, options)
    ccall((:aws_log_writer_init_file, libawscrt), Cint, (Ptr{aws_log_writer}, Ptr{aws_allocator}, Ptr{aws_log_writer_file_options}), writer, allocator, options)
end

"""
    aws_log_writer_clean_up(writer)

### Prototype
```c
void aws_log_writer_clean_up(struct aws_log_writer *writer);
```
"""
function aws_log_writer_clean_up(writer)
    ccall((:aws_log_writer_clean_up, libawscrt), Cvoid, (Ptr{aws_log_writer},), writer)
end

"""
    aws_logger_vtable

We separate the log level function from the log call itself so that we can do the filter check in the macros (see below)

By doing so, we make it so that the variadic format arguments are not even evaluated if the filter check does not succeed.
"""
struct aws_logger_vtable
    data::NTuple{32, UInt8}
end

function Base.getproperty(x::Ptr{aws_logger_vtable}, f::Symbol)
    f === :log && return Ptr{Ptr{Cvoid}}(x + 0)
    f === :get_log_level && return Ptr{Ptr{Cvoid}}(x + 8)
    f === :clean_up && return Ptr{Ptr{Cvoid}}(x + 16)
    f === :set_log_level && return Ptr{Ptr{Cvoid}}(x + 24)
    return getfield(x, f)
end

function Base.getproperty(x::aws_logger_vtable, f::Symbol)
    r = Ref{aws_logger_vtable}(x)
    ptr = Base.unsafe_convert(Ptr{aws_logger_vtable}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{aws_logger_vtable}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct aws_logger
    vtable::Ptr{aws_logger_vtable}
    allocator::Ptr{aws_allocator}
    p_impl::Ptr{Cvoid}
end

"""
    aws_logger_get()

Gets the aws logger used globally across the process.

### Prototype
```c
struct aws_logger *aws_logger_get(void);
```
"""
function aws_logger_get()
    ccall((:aws_logger_get, libawscrt), Ptr{aws_logger}, ())
end

"""
Log subject is a way of designating the topic of logging.

The general idea is to support a finer-grained approach to log level control. The primary use case is for situations that require more detailed logging within a specific domain, where enabling that detail globally leads to an untenable flood of information.

For example, enable TRACE logging for tls-related log statements (handshake binary payloads), but only WARN logging everywhere else (because http payloads would blow up the log files).

Log subject is an enum similar to aws error: each library has its own value-space and someone is responsible for registering the value <-> string connections.
"""
const aws_log_subject_t = UInt32

struct aws_log_subject_info
    subject_id::aws_log_subject_t
    subject_name::Ptr{Cchar}
    subject_description::Ptr{Cchar}
end

struct aws_log_subject_info_list
    subject_list::Ptr{aws_log_subject_info}
    count::Csize_t
end

@cenum aws_common_log_subject::UInt32 begin
    AWS_LS_COMMON_GENERAL = 0
    AWS_LS_COMMON_TASK_SCHEDULER = 1
    AWS_LS_COMMON_THREAD = 2
    AWS_LS_COMMON_MEMTRACE = 3
    AWS_LS_COMMON_XML_PARSER = 4
    AWS_LS_COMMON_IO = 5
    AWS_LS_COMMON_BUS = 6
    AWS_LS_COMMON_TEST = 7
    AWS_LS_COMMON_LAST = 1023
end

struct aws_logger_pipeline
    formatter::Ptr{aws_log_formatter}
    channel::Ptr{aws_log_channel}
    writer::Ptr{aws_log_writer}
    allocator::Ptr{aws_allocator}
    level::aws_atomic_var
end

"""
    aws_logger_standard_options

Options for [`aws_logger_init_standard`](@ref)(). Set `filename` to open a file for logging and close it when the logger cleans up. Set `file` to use a file that is already open, such as `stderr` or `stdout`.
"""
struct aws_logger_standard_options
    level::aws_log_level
    filename::Ptr{Cchar}
    file::Ptr{Libc.FILE}
end

"""
    aws_logger_set(logger)

Sets the aws logger used globally across the process. Not thread-safe. Must only be called once.

### Prototype
```c
void aws_logger_set(struct aws_logger *logger);
```
"""
function aws_logger_set(logger)
    ccall((:aws_logger_set, libawscrt), Cvoid, (Ptr{aws_logger},), logger)
end

"""
    aws_logger_clean_up(logger)

Cleans up all resources used by the logger; simply invokes the clean\\_up v-function

### Prototype
```c
void aws_logger_clean_up(struct aws_logger *logger);
```
"""
function aws_logger_clean_up(logger)
    ccall((:aws_logger_clean_up, libawscrt), Cvoid, (Ptr{aws_logger},), logger)
end

"""
    aws_logger_set_log_level(logger, level)

Sets the current logging level for the logger. Loggers are not require to support this.

### Parameters
* `logger`: logger to set the log level for
* `level`: new log level for the logger
### Returns
[`AWS_OP_SUCCESS`](@ref) if the level was successfully set, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_logger_set_log_level(struct aws_logger *logger, enum aws_log_level level);
```
"""
function aws_logger_set_log_level(logger, level)
    ccall((:aws_logger_set_log_level, libawscrt), Cint, (Ptr{aws_logger}, aws_log_level), logger, level)
end

"""
    aws_log_level_to_string(log_level, level_string)

Converts a log level to a c-string constant. Intended primarily to support building log lines that include the level in them, i.e.

[ERROR] 10:34:54.642 01-31-19 - Json parse error....

### Prototype
```c
int aws_log_level_to_string(enum aws_log_level log_level, const char **level_string);
```
"""
function aws_log_level_to_string(log_level, level_string)
    ccall((:aws_log_level_to_string, libawscrt), Cint, (aws_log_level, Ptr{Ptr{Cchar}}), log_level, level_string)
end

"""
    aws_string_to_log_level(level_string, log_level)

Converts a c-string constant to a log level value. Uses case-insensitive comparison and simply iterates all possibilities until a match or nothing remains. If no match is found, [`AWS_OP_ERR`](@ref) is returned.

### Prototype
```c
int aws_string_to_log_level(const char *level_string, enum aws_log_level *log_level);
```
"""
function aws_string_to_log_level(level_string, log_level)
    ccall((:aws_string_to_log_level, libawscrt), Cint, (Ptr{Cchar}, Ptr{aws_log_level}), level_string, log_level)
end

const aws_thread_id_t = pthread_t

"""
    aws_thread_id_t_to_string(thread_id, buffer, bufsz)

Converts an [`aws_thread_id_t`](@ref) to a c-string. For portability, [`aws_thread_id_t`](@ref) must not be printed directly. Intended primarily to support building log lines that include the thread id in them. The parameter `buffer` must point-to a char buffer of length `bufsz == [`AWS_THREAD_ID_T_REPR_BUFSZ`](@ref)`. The thread id representation is returned in `buffer`.

### Prototype
```c
int aws_thread_id_t_to_string(aws_thread_id_t thread_id, char *buffer, size_t bufsz);
```
"""
function aws_thread_id_t_to_string(thread_id, buffer, bufsz)
    ccall((:aws_thread_id_t_to_string, libawscrt), Cint, (aws_thread_id_t, Ptr{Cchar}, Csize_t), thread_id, buffer, bufsz)
end

"""
    aws_log_subject_name(subject)

Get subject name from log subject.

### Prototype
```c
const char *aws_log_subject_name(aws_log_subject_t subject);
```
"""
function aws_log_subject_name(subject)
    ccall((:aws_log_subject_name, libawscrt), Ptr{Cchar}, (aws_log_subject_t,), subject)
end

"""
    aws_register_log_subject_info_list(log_subject_list)

Connects log subject strings with log subject integer values

### Prototype
```c
void aws_register_log_subject_info_list(struct aws_log_subject_info_list *log_subject_list);
```
"""
function aws_register_log_subject_info_list(log_subject_list)
    ccall((:aws_register_log_subject_info_list, libawscrt), Cvoid, (Ptr{aws_log_subject_info_list},), log_subject_list)
end

"""
    aws_unregister_log_subject_info_list(log_subject_list)

Disconnects log subject strings with log subject integer values

### Prototype
```c
void aws_unregister_log_subject_info_list(struct aws_log_subject_info_list *log_subject_list);
```
"""
function aws_unregister_log_subject_info_list(log_subject_list)
    ccall((:aws_unregister_log_subject_info_list, libawscrt), Cvoid, (Ptr{aws_log_subject_info_list},), log_subject_list)
end

"""
    aws_logger_init_standard(logger, allocator, options)

### Prototype
```c
int aws_logger_init_standard( struct aws_logger *logger, struct aws_allocator *allocator, struct aws_logger_standard_options *options);
```
"""
function aws_logger_init_standard(logger, allocator, options)
    ccall((:aws_logger_init_standard, libawscrt), Cint, (Ptr{aws_logger}, Ptr{aws_allocator}, Ptr{aws_logger_standard_options}), logger, allocator, options)
end

"""
    aws_logger_init_from_external(logger, allocator, formatter, channel, writer, level)

### Prototype
```c
int aws_logger_init_from_external( struct aws_logger *logger, struct aws_allocator *allocator, struct aws_log_formatter *formatter, struct aws_log_channel *channel, struct aws_log_writer *writer, enum aws_log_level level);
```
"""
function aws_logger_init_from_external(logger, allocator, formatter, channel, writer, level)
    ccall((:aws_logger_init_from_external, libawscrt), Cint, (Ptr{aws_logger}, Ptr{aws_allocator}, Ptr{aws_log_formatter}, Ptr{aws_log_channel}, Ptr{aws_log_writer}, aws_log_level), logger, allocator, formatter, channel, writer, level)
end

"""
    aws_logger_init_noalloc(logger, allocator, options)

### Prototype
```c
int aws_logger_init_noalloc( struct aws_logger *logger, struct aws_allocator *allocator, struct aws_logger_standard_options *options);
```
"""
function aws_logger_init_noalloc(logger, allocator, options)
    ccall((:aws_logger_init_noalloc, libawscrt), Cint, (Ptr{aws_logger}, Ptr{aws_allocator}, Ptr{aws_logger_standard_options}), logger, allocator, options)
end

"""
    aws_cache_new_lru(allocator, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn, max_items)

Initializes the Least-recently-used cache. Sets up the underlying linked hash table. Once `max_items` elements have been added, the least recently used item will be removed. For the other parameters, see aws/common/hash\\_table.h. Hash table semantics of these arguments are preserved.(Yes the one that was the answer to that interview question that one time).

### Prototype
```c
struct aws_cache *aws_cache_new_lru( struct aws_allocator *allocator, aws_hash_fn *hash_fn, aws_hash_callback_eq_fn *equals_fn, aws_hash_callback_destroy_fn *destroy_key_fn, aws_hash_callback_destroy_fn *destroy_value_fn, size_t max_items);
```
"""
function aws_cache_new_lru(allocator, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn, max_items)
    ccall((:aws_cache_new_lru, libawscrt), Ptr{aws_cache}, (Ptr{aws_allocator}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Csize_t), allocator, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn, max_items)
end

"""
    aws_lru_cache_use_lru_element(cache)

Accesses the least-recently-used element, sets it to most-recently-used element, and returns the value.

### Prototype
```c
void *aws_lru_cache_use_lru_element(struct aws_cache *cache);
```
"""
function aws_lru_cache_use_lru_element(cache)
    ccall((:aws_lru_cache_use_lru_element, libawscrt), Ptr{Cvoid}, (Ptr{aws_cache},), cache)
end

"""
    aws_lru_cache_get_mru_element(cache)

Accesses the most-recently-used element and returns its value.

### Prototype
```c
void *aws_lru_cache_get_mru_element(const struct aws_cache *cache);
```
"""
function aws_lru_cache_get_mru_element(cache)
    ccall((:aws_lru_cache_get_mru_element, libawscrt), Ptr{Cvoid}, (Ptr{aws_cache},), cache)
end

const static_assertion_at_line_38 = NTuple{1, Cchar}

const static_assertion_at_line_39 = NTuple{1, Cchar}

const static_assertion_at_line_40 = NTuple{1, Cchar}

"""
    aws_mutex_init(mutex)

Initializes a new platform instance of mutex.

### Prototype
```c
int aws_mutex_init(struct aws_mutex *mutex);
```
"""
function aws_mutex_init(mutex)
    ccall((:aws_mutex_init, libawscrt), Cint, (Ptr{aws_mutex},), mutex)
end

"""
    aws_mutex_clean_up(mutex)

Cleans up internal resources.

### Prototype
```c
void aws_mutex_clean_up(struct aws_mutex *mutex);
```
"""
function aws_mutex_clean_up(mutex)
    ccall((:aws_mutex_clean_up, libawscrt), Cvoid, (Ptr{aws_mutex},), mutex)
end

"""
    aws_mutex_lock(mutex)

Blocks until it acquires the lock. While on some platforms such as Windows, this may behave as a reentrant mutex, you should not treat it like one. On platforms it is possible for it to be non-reentrant, it will be.

### Prototype
```c
int aws_mutex_lock(struct aws_mutex *mutex);
```
"""
function aws_mutex_lock(mutex)
    ccall((:aws_mutex_lock, libawscrt), Cint, (Ptr{aws_mutex},), mutex)
end

"""
    aws_mutex_try_lock(mutex)

Attempts to acquire the lock but returns immediately if it can not. While on some platforms such as Windows, this may behave as a reentrant mutex, you should not treat it like one. On platforms it is possible for it to be non-reentrant, it will be. Note: For windows, minimum support server version is Windows Server 2008 R2 [desktop apps | UWP apps]

### Prototype
```c
int aws_mutex_try_lock(struct aws_mutex *mutex);
```
"""
function aws_mutex_try_lock(mutex)
    ccall((:aws_mutex_try_lock, libawscrt), Cint, (Ptr{aws_mutex},), mutex)
end

"""
    aws_mutex_unlock(mutex)

Releases the lock.

### Prototype
```c
int aws_mutex_unlock(struct aws_mutex *mutex);
```
"""
function aws_mutex_unlock(mutex)
    ccall((:aws_mutex_unlock, libawscrt), Cint, (Ptr{aws_mutex},), mutex)
end

# typedef int ( aws_priority_queue_compare_fn ) ( const void * a , const void * b )
const aws_priority_queue_compare_fn = Cvoid

struct aws_priority_queue
    pred::Ptr{Cvoid}
    container::aws_array_list
    backpointers::aws_array_list
end

struct aws_priority_queue_node
    current_index::Csize_t
end

"""
    aws_priority_queue_init_dynamic(queue, alloc, default_size, item_size, pred)

Initializes a priority queue struct for use. This mode will grow memory automatically (exponential model) Default size is the inital size of the queue item\\_size is the size of each element in bytes. Mixing items types is not supported by this API. pred is the function that will be used to determine priority.

### Prototype
```c
int aws_priority_queue_init_dynamic( struct aws_priority_queue *queue, struct aws_allocator *alloc, size_t default_size, size_t item_size, aws_priority_queue_compare_fn *pred);
```
"""
function aws_priority_queue_init_dynamic(queue, alloc, default_size, item_size, pred)
    ccall((:aws_priority_queue_init_dynamic, libawscrt), Cint, (Ptr{aws_priority_queue}, Ptr{aws_allocator}, Csize_t, Csize_t, Ptr{Cvoid}), queue, alloc, default_size, item_size, pred)
end

"""
    aws_priority_queue_init_static(queue, heap, item_count, item_size, pred)

Initializes a priority queue struct for use. This mode will not allocate any additional memory. When the heap fills new enqueue operations will fail with AWS\\_ERROR\\_PRIORITY\\_QUEUE\\_FULL.

Heaps initialized using this call do not support the [`aws_priority_queue_push_ref`](@ref) call with a non-NULL backpointer parameter.

heap is the raw memory allocated for this priority\\_queue item\\_count is the maximum number of elements the raw heap can contain item\\_size is the size of each element in bytes. Mixing items types is not supported by this API. pred is the function that will be used to determine priority.

### Prototype
```c
void aws_priority_queue_init_static( struct aws_priority_queue *queue, void *heap, size_t item_count, size_t item_size, aws_priority_queue_compare_fn *pred);
```
"""
function aws_priority_queue_init_static(queue, heap, item_count, item_size, pred)
    ccall((:aws_priority_queue_init_static, libawscrt), Cvoid, (Ptr{aws_priority_queue}, Ptr{Cvoid}, Csize_t, Csize_t, Ptr{Cvoid}), queue, heap, item_count, item_size, pred)
end

"""
    aws_priority_queue_backpointer_index_valid(queue, index)

Checks that the backpointer at a specific index of the queue is NULL or points to a correctly allocated [`aws_priority_queue_node`](@ref).

### Prototype
```c
bool aws_priority_queue_backpointer_index_valid(const struct aws_priority_queue *const queue, size_t index);
```
"""
function aws_priority_queue_backpointer_index_valid(queue, index)
    ccall((:aws_priority_queue_backpointer_index_valid, libawscrt), Bool, (Ptr{aws_priority_queue}, Csize_t), queue, index)
end

"""
    aws_priority_queue_backpointers_valid_deep(queue)

Checks that the backpointers of the priority queue are either NULL or correctly allocated to point at aws\\_priority\\_queue\\_nodes. This check is O(n), as it accesses every backpointer in a loop, and thus shouldn't be used carelessly.

### Prototype
```c
bool aws_priority_queue_backpointers_valid_deep(const struct aws_priority_queue *const queue);
```
"""
function aws_priority_queue_backpointers_valid_deep(queue)
    ccall((:aws_priority_queue_backpointers_valid_deep, libawscrt), Bool, (Ptr{aws_priority_queue},), queue)
end

"""
    aws_priority_queue_backpointers_valid(queue)

Checks that the backpointers of the priority queue satisfy validity constraints.

### Prototype
```c
bool aws_priority_queue_backpointers_valid(const struct aws_priority_queue *const queue);
```
"""
function aws_priority_queue_backpointers_valid(queue)
    ccall((:aws_priority_queue_backpointers_valid, libawscrt), Bool, (Ptr{aws_priority_queue},), queue)
end

"""
    aws_priority_queue_is_valid(queue)

Set of properties of a valid [`aws_priority_queue`](@ref).

### Prototype
```c
bool aws_priority_queue_is_valid(const struct aws_priority_queue *const queue);
```
"""
function aws_priority_queue_is_valid(queue)
    ccall((:aws_priority_queue_is_valid, libawscrt), Bool, (Ptr{aws_priority_queue},), queue)
end

"""
    aws_priority_queue_clean_up(queue)

Cleans up any internally allocated memory and resets the struct for reuse or deletion.

### Prototype
```c
void aws_priority_queue_clean_up(struct aws_priority_queue *queue);
```
"""
function aws_priority_queue_clean_up(queue)
    ccall((:aws_priority_queue_clean_up, libawscrt), Cvoid, (Ptr{aws_priority_queue},), queue)
end

"""
    aws_priority_queue_push(queue, item)

Copies item into the queue and places it in the proper priority order. Complexity: O(log(n)).

### Prototype
```c
int aws_priority_queue_push(struct aws_priority_queue *queue, void *item);
```
"""
function aws_priority_queue_push(queue, item)
    ccall((:aws_priority_queue_push, libawscrt), Cint, (Ptr{aws_priority_queue}, Ptr{Cvoid}), queue, item)
end

"""
    aws_priority_queue_push_ref(queue, item, backpointer)

Copies item into the queue and places it in the proper priority order. Complexity: O(log(n)).

If the backpointer parameter is non-null, the heap will continually update the pointed-to field with information needed to remove the node later on. *backpointer must remain valid until the node is removed from the heap, and may be updated on any mutating operation on the priority queue.

If the node is removed, the backpointer will be set to a sentinel value that indicates that the node has already been removed. It is safe (and a no-op) to call [`aws_priority_queue_remove`](@ref) with such a sentinel value.

### Prototype
```c
int aws_priority_queue_push_ref( struct aws_priority_queue *queue, void *item, struct aws_priority_queue_node *backpointer);
```
"""
function aws_priority_queue_push_ref(queue, item, backpointer)
    ccall((:aws_priority_queue_push_ref, libawscrt), Cint, (Ptr{aws_priority_queue}, Ptr{Cvoid}, Ptr{aws_priority_queue_node}), queue, item, backpointer)
end

"""
    aws_priority_queue_pop(queue, item)

Copies the element of the highest priority, and removes it from the queue.. Complexity: O(log(n)). If queue is empty, AWS\\_ERROR\\_PRIORITY\\_QUEUE\\_EMPTY will be raised.

### Prototype
```c
int aws_priority_queue_pop(struct aws_priority_queue *queue, void *item);
```
"""
function aws_priority_queue_pop(queue, item)
    ccall((:aws_priority_queue_pop, libawscrt), Cint, (Ptr{aws_priority_queue}, Ptr{Cvoid}), queue, item)
end

"""
    aws_priority_queue_remove(queue, item, node)

Removes a specific node from the priority queue. Complexity: O(log(n)) After removing a node (using either \\_remove or \\_pop), the backpointer set at push\\_ref time is set to a sentinel value. If this sentinel value is passed to [`aws_priority_queue_remove`](@ref), AWS\\_ERROR\\_PRIORITY\\_QUEUE\\_BAD\\_NODE will be raised. Note, however, that passing uninitialized aws\\_priority\\_queue\\_nodes, or ones from different priority queues, results in undefined behavior.

### Prototype
```c
int aws_priority_queue_remove(struct aws_priority_queue *queue, void *item, const struct aws_priority_queue_node *node);
```
"""
function aws_priority_queue_remove(queue, item, node)
    ccall((:aws_priority_queue_remove, libawscrt), Cint, (Ptr{aws_priority_queue}, Ptr{Cvoid}, Ptr{aws_priority_queue_node}), queue, item, node)
end

"""
    aws_priority_queue_top(queue, item)

Obtains a pointer to the element of the highest priority. Complexity: constant time. If queue is empty, AWS\\_ERROR\\_PRIORITY\\_QUEUE\\_EMPTY will be raised.

### Prototype
```c
int aws_priority_queue_top(const struct aws_priority_queue *queue, void **item);
```
"""
function aws_priority_queue_top(queue, item)
    ccall((:aws_priority_queue_top, libawscrt), Cint, (Ptr{aws_priority_queue}, Ptr{Ptr{Cvoid}}), queue, item)
end

"""
    aws_priority_queue_size(queue)

Current number of elements in the queue

### Prototype
```c
size_t aws_priority_queue_size(const struct aws_priority_queue *queue);
```
"""
function aws_priority_queue_size(queue)
    ccall((:aws_priority_queue_size, libawscrt), Csize_t, (Ptr{aws_priority_queue},), queue)
end

"""
    aws_priority_queue_capacity(queue)

Current allocated capacity for the queue, in dynamic mode this grows over time, in static mode, this will never change.

### Prototype
```c
size_t aws_priority_queue_capacity(const struct aws_priority_queue *queue);
```
"""
function aws_priority_queue_capacity(queue)
    ccall((:aws_priority_queue_capacity, libawscrt), Csize_t, (Ptr{aws_priority_queue},), queue)
end

struct aws_run_command_result
    ret_code::Cint
    std_out::Ptr{aws_string}
    std_err::Ptr{aws_string}
end

struct aws_run_command_options
    command::Ptr{Cchar}
end

"""
    aws_get_pid()

Returns the current process's PID (process id).

### Returns
PID as int
### Prototype
```c
int aws_get_pid(void);
```
"""
function aws_get_pid()
    ccall((:aws_get_pid, libawscrt), Cint, ())
end

"""
    aws_get_soft_limit_io_handles()

Returns the soft limit for max io handles (max fds in unix terminology). This limit is one more than the actual limit. The soft limit can be changed up to the hard limit by any process regardless of permissions.

### Prototype
```c
size_t aws_get_soft_limit_io_handles(void);
```
"""
function aws_get_soft_limit_io_handles()
    ccall((:aws_get_soft_limit_io_handles, libawscrt), Csize_t, ())
end

"""
    aws_get_hard_limit_io_handles()

Returns the hard limit for max io handles (max fds in unix terminology). This limit is one more than the actual limit. This limit cannot be increased without sudo permissions.

### Prototype
```c
size_t aws_get_hard_limit_io_handles(void);
```
"""
function aws_get_hard_limit_io_handles()
    ccall((:aws_get_hard_limit_io_handles, libawscrt), Csize_t, ())
end

"""
    aws_set_soft_limit_io_handles(max_handles)

Sets the new soft limit for io\\_handles (max fds). This can be up to the hard limit but may not exceed it.

This operation will always fail with AWS\\_ERROR\\_UNIMPLEMENTED error code on Windows.

### Prototype
```c
int aws_set_soft_limit_io_handles(size_t max_handles);
```
"""
function aws_set_soft_limit_io_handles(max_handles)
    ccall((:aws_set_soft_limit_io_handles, libawscrt), Cint, (Csize_t,), max_handles)
end

"""
    aws_run_command_result_init(allocator, result)

### Prototype
```c
int aws_run_command_result_init(struct aws_allocator *allocator, struct aws_run_command_result *result);
```
"""
function aws_run_command_result_init(allocator, result)
    ccall((:aws_run_command_result_init, libawscrt), Cint, (Ptr{aws_allocator}, Ptr{aws_run_command_result}), allocator, result)
end

"""
    aws_run_command_result_cleanup(result)

### Prototype
```c
void aws_run_command_result_cleanup(struct aws_run_command_result *result);
```
"""
function aws_run_command_result_cleanup(result)
    ccall((:aws_run_command_result_cleanup, libawscrt), Cvoid, (Ptr{aws_run_command_result},), result)
end

"""
    aws_run_command(allocator, options, result)

Currently this API is implemented using popen on Posix system and \\_popen on Windows to capture output from running a command. Note that popen only captures stdout, and doesn't provide an option to capture stderr. We will add more options, such as acquire stderr in the future so probably will alter the underlying implementation as well.

### Prototype
```c
int aws_run_command( struct aws_allocator *allocator, struct aws_run_command_options *options, struct aws_run_command_result *result);
```
"""
function aws_run_command(allocator, options, result)
    ccall((:aws_run_command, libawscrt), Cint, (Ptr{aws_allocator}, Ptr{aws_run_command_options}, Ptr{aws_run_command_result}), allocator, options, result)
end

mutable struct aws_promise end

"""
    aws_promise_new(allocator)

### Prototype
```c
struct aws_promise *aws_promise_new(struct aws_allocator *allocator);
```
"""
function aws_promise_new(allocator)
    ccall((:aws_promise_new, libawscrt), Ptr{aws_promise}, (Ptr{aws_allocator},), allocator)
end

"""
    aws_promise_acquire(promise)

### Prototype
```c
struct aws_promise *aws_promise_acquire(struct aws_promise *promise);
```
"""
function aws_promise_acquire(promise)
    ccall((:aws_promise_acquire, libawscrt), Ptr{aws_promise}, (Ptr{aws_promise},), promise)
end

"""
    aws_promise_release(promise)

### Prototype
```c
void aws_promise_release(struct aws_promise *promise);
```
"""
function aws_promise_release(promise)
    ccall((:aws_promise_release, libawscrt), Cvoid, (Ptr{aws_promise},), promise)
end

"""
    aws_promise_wait(promise)

### Prototype
```c
void aws_promise_wait(struct aws_promise *promise);
```
"""
function aws_promise_wait(promise)
    ccall((:aws_promise_wait, libawscrt), Cvoid, (Ptr{aws_promise},), promise)
end

"""
    aws_promise_wait_for(promise, nanoseconds)

### Prototype
```c
bool aws_promise_wait_for(struct aws_promise *promise, size_t nanoseconds);
```
"""
function aws_promise_wait_for(promise, nanoseconds)
    ccall((:aws_promise_wait_for, libawscrt), Bool, (Ptr{aws_promise}, Csize_t), promise, nanoseconds)
end

"""
    aws_promise_complete(promise, value, dtor)

### Prototype
```c
void aws_promise_complete(struct aws_promise *promise, void *value, void (*dtor)(void *));
```
"""
function aws_promise_complete(promise, value, dtor)
    ccall((:aws_promise_complete, libawscrt), Cvoid, (Ptr{aws_promise}, Ptr{Cvoid}, Ptr{Cvoid}), promise, value, dtor)
end

"""
    aws_promise_fail(promise, error_code)

### Prototype
```c
void aws_promise_fail(struct aws_promise *promise, int error_code);
```
"""
function aws_promise_fail(promise, error_code)
    ccall((:aws_promise_fail, libawscrt), Cvoid, (Ptr{aws_promise}, Cint), promise, error_code)
end

"""
    aws_promise_is_complete(promise)

### Prototype
```c
bool aws_promise_is_complete(struct aws_promise *promise);
```
"""
function aws_promise_is_complete(promise)
    ccall((:aws_promise_is_complete, libawscrt), Bool, (Ptr{aws_promise},), promise)
end

"""
    aws_promise_error_code(promise)

### Prototype
```c
int aws_promise_error_code(struct aws_promise *promise);
```
"""
function aws_promise_error_code(promise)
    ccall((:aws_promise_error_code, libawscrt), Cint, (Ptr{aws_promise},), promise)
end

"""
    aws_promise_value(promise)

### Prototype
```c
void *aws_promise_value(struct aws_promise *promise);
```
"""
function aws_promise_value(promise)
    ccall((:aws_promise_value, libawscrt), Ptr{Cvoid}, (Ptr{aws_promise},), promise)
end

"""
    aws_promise_take_value(promise)

### Prototype
```c
void *aws_promise_take_value(struct aws_promise *promise);
```
"""
function aws_promise_take_value(promise)
    ccall((:aws_promise_take_value, libawscrt), Ptr{Cvoid}, (Ptr{aws_promise},), promise)
end

# typedef void ( aws_simple_completion_callback ) ( void * )
const aws_simple_completion_callback = Cvoid

"""
    aws_ref_count_init(ref_count, object, on_zero_fn)

Initializes a ref-counter structure. After initialization, the ref count will be 1.

### Parameters
* `ref_count`: ref-counter to initialize
* `object`: object being ref counted
* `on_zero_fn`: function to invoke when the ref count reaches zero
### Prototype
```c
void aws_ref_count_init( struct aws_ref_count *ref_count, void *object, aws_simple_completion_callback *on_zero_fn);
```
"""
function aws_ref_count_init(ref_count, object, on_zero_fn)
    ccall((:aws_ref_count_init, libawscrt), Cvoid, (Ptr{aws_ref_count}, Ptr{Cvoid}, Ptr{Cvoid}), ref_count, object, on_zero_fn)
end

"""
    aws_ref_count_acquire(ref_count)

Increments a ref-counter's ref count

### Parameters
* `ref_count`: ref-counter to increment the count for
### Returns
the object being ref-counted
### Prototype
```c
void *aws_ref_count_acquire(struct aws_ref_count *ref_count);
```
"""
function aws_ref_count_acquire(ref_count)
    ccall((:aws_ref_count_acquire, libawscrt), Ptr{Cvoid}, (Ptr{aws_ref_count},), ref_count)
end

"""
    aws_ref_count_release(ref_count)

Decrements a ref-counter's ref count. Invokes the on\\_zero callback if the ref count drops to zero

### Parameters
* `ref_count`: ref-counter to decrement the count for
### Returns
the value of the decremented ref count
### Prototype
```c
size_t aws_ref_count_release(struct aws_ref_count *ref_count);
```
"""
function aws_ref_count_release(ref_count)
    ccall((:aws_ref_count_release, libawscrt), Csize_t, (Ptr{aws_ref_count},), ref_count)
end

"""
    aws_ring_buffer

Lockless ring buffer implementation that is thread safe assuming a single thread acquires and a single thread releases. For any other use case (other than the single-threaded use-case), you must manage thread-safety manually.

Also, a very important note: release must happen in the same order as acquire. If you do not your application, and possibly computers within a thousand mile radius, may die terrible deaths, and the local drinking water will be poisoned for generations with fragments of what is left of your radioactive corrupted memory.
"""
struct aws_ring_buffer
    allocator::Ptr{aws_allocator}
    allocation::Ptr{UInt8}
    head::aws_atomic_var
    tail::aws_atomic_var
    allocation_end::Ptr{UInt8}
end

"""
    aws_ring_buffer_init(ring_buf, allocator, size)

Initializes a ring buffer with an allocation of size `size`. Returns [`AWS_OP_SUCCESS`](@ref) on a successful initialization, [`AWS_OP_ERR`](@ref) otherwise.

### Prototype
```c
int aws_ring_buffer_init(struct aws_ring_buffer *ring_buf, struct aws_allocator *allocator, size_t size);
```
"""
function aws_ring_buffer_init(ring_buf, allocator, size)
    ccall((:aws_ring_buffer_init, libawscrt), Cint, (Ptr{aws_ring_buffer}, Ptr{aws_allocator}, Csize_t), ring_buf, allocator, size)
end

"""
    aws_ring_buffer_check_atomic_ptr(ring_buf, atomic_ptr)

### Prototype
```c
AWS_STATIC_IMPL bool aws_ring_buffer_check_atomic_ptr( const struct aws_ring_buffer *ring_buf, const uint8_t *atomic_ptr);
```
"""
function aws_ring_buffer_check_atomic_ptr(ring_buf, atomic_ptr)
    ccall((:aws_ring_buffer_check_atomic_ptr, libawscrt), Bool, (Ptr{aws_ring_buffer}, Ptr{UInt8}), ring_buf, atomic_ptr)
end

"""
    aws_ring_buffer_is_empty(ring_buf)

Checks whether the ring buffer is empty

### Prototype
```c
AWS_STATIC_IMPL bool aws_ring_buffer_is_empty(const struct aws_ring_buffer *ring_buf);
```
"""
function aws_ring_buffer_is_empty(ring_buf)
    ccall((:aws_ring_buffer_is_empty, libawscrt), Bool, (Ptr{aws_ring_buffer},), ring_buf)
end

"""
    aws_ring_buffer_is_valid(ring_buf)

Evaluates the set of properties that define the shape of all valid [`aws_ring_buffer`](@ref) structures. It is also a cheap check, in the sense it run in constant time (i.e., no loops or recursion).

### Prototype
```c
AWS_STATIC_IMPL bool aws_ring_buffer_is_valid(const struct aws_ring_buffer *ring_buf);
```
"""
function aws_ring_buffer_is_valid(ring_buf)
    ccall((:aws_ring_buffer_is_valid, libawscrt), Bool, (Ptr{aws_ring_buffer},), ring_buf)
end

"""
    aws_ring_buffer_clean_up(ring_buf)

Cleans up the ring buffer's resources.

### Prototype
```c
void aws_ring_buffer_clean_up(struct aws_ring_buffer *ring_buf);
```
"""
function aws_ring_buffer_clean_up(ring_buf)
    ccall((:aws_ring_buffer_clean_up, libawscrt), Cvoid, (Ptr{aws_ring_buffer},), ring_buf)
end

"""
    aws_ring_buffer_acquire(ring_buf, requested_size, dest)

Attempts to acquire `requested_size` buffer and stores the result in `dest` if successful. Returns [`AWS_OP_SUCCESS`](@ref) if the requested size was available for use, [`AWS_OP_ERR`](@ref) otherwise.

### Prototype
```c
int aws_ring_buffer_acquire( struct aws_ring_buffer *ring_buf, size_t requested_size, struct aws_byte_buf *dest);
```
"""
function aws_ring_buffer_acquire(ring_buf, requested_size, dest)
    ccall((:aws_ring_buffer_acquire, libawscrt), Cint, (Ptr{aws_ring_buffer}, Csize_t, Ptr{aws_byte_buf}), ring_buf, requested_size, dest)
end

"""
    aws_ring_buffer_acquire_up_to(ring_buf, minimum_size, requested_size, dest)

Attempts to acquire `requested_size` buffer and stores the result in `dest` if successful. If not available, it will attempt to acquire anywhere from 1 byte to `requested_size`. Returns [`AWS_OP_SUCCESS`](@ref) if some buffer space is available for use, [`AWS_OP_ERR`](@ref) otherwise.

### Prototype
```c
int aws_ring_buffer_acquire_up_to( struct aws_ring_buffer *ring_buf, size_t minimum_size, size_t requested_size, struct aws_byte_buf *dest);
```
"""
function aws_ring_buffer_acquire_up_to(ring_buf, minimum_size, requested_size, dest)
    ccall((:aws_ring_buffer_acquire_up_to, libawscrt), Cint, (Ptr{aws_ring_buffer}, Csize_t, Csize_t, Ptr{aws_byte_buf}), ring_buf, minimum_size, requested_size, dest)
end

"""
    aws_ring_buffer_release(ring_buffer, buf)

Releases `buf` back to the ring buffer for further use. RELEASE MUST HAPPEN in the SAME ORDER AS ACQUIRE. If you do not, your application, and possibly computers within a thousand mile radius, may die terrible deaths, and the local drinking water will be poisoned for generations with fragments of what is left of your radioactive corrupted memory.

### Prototype
```c
void aws_ring_buffer_release(struct aws_ring_buffer *ring_buffer, struct aws_byte_buf *buf);
```
"""
function aws_ring_buffer_release(ring_buffer, buf)
    ccall((:aws_ring_buffer_release, libawscrt), Cvoid, (Ptr{aws_ring_buffer}, Ptr{aws_byte_buf}), ring_buffer, buf)
end

"""
    aws_ring_buffer_buf_belongs_to_pool(ring_buffer, buf)

Returns true if the memory in `buf` was vended by this ring buffer, false otherwise. Make sure `buf->buffer` and `ring\\_buffer->allocation` refer to the same memory region.

### Prototype
```c
bool aws_ring_buffer_buf_belongs_to_pool( const struct aws_ring_buffer *ring_buffer, const struct aws_byte_buf *buf);
```
"""
function aws_ring_buffer_buf_belongs_to_pool(ring_buffer, buf)
    ccall((:aws_ring_buffer_buf_belongs_to_pool, libawscrt), Bool, (Ptr{aws_ring_buffer}, Ptr{aws_byte_buf}), ring_buffer, buf)
end

"""
    aws_ring_buffer_allocator_clean_up(allocator)

Cleans up a ring buffer allocator instance. Does not clean up the ring buffer.

### Prototype
```c
void aws_ring_buffer_allocator_clean_up(struct aws_allocator *allocator);
```
"""
function aws_ring_buffer_allocator_clean_up(allocator)
    ccall((:aws_ring_buffer_allocator_clean_up, libawscrt), Cvoid, (Ptr{aws_allocator},), allocator)
end

struct aws_rw_lock
    lock_handle::pthread_rwlock_t
end

"""
    aws_rw_lock_init(lock)

Initializes a new platform instance of mutex.

### Prototype
```c
int aws_rw_lock_init(struct aws_rw_lock *lock);
```
"""
function aws_rw_lock_init(lock)
    ccall((:aws_rw_lock_init, libawscrt), Cint, (Ptr{aws_rw_lock},), lock)
end

"""
    aws_rw_lock_clean_up(lock)

Cleans up internal resources.

### Prototype
```c
void aws_rw_lock_clean_up(struct aws_rw_lock *lock);
```
"""
function aws_rw_lock_clean_up(lock)
    ccall((:aws_rw_lock_clean_up, libawscrt), Cvoid, (Ptr{aws_rw_lock},), lock)
end

"""
    aws_rw_lock_rlock(lock)

Blocks until it acquires the lock. While on some platforms such as Windows, this may behave as a reentrant mutex, you should not treat it like one. On platforms it is possible for it to be non-reentrant, it will be.

### Prototype
```c
int aws_rw_lock_rlock(struct aws_rw_lock *lock);
```
"""
function aws_rw_lock_rlock(lock)
    ccall((:aws_rw_lock_rlock, libawscrt), Cint, (Ptr{aws_rw_lock},), lock)
end

"""
    aws_rw_lock_wlock(lock)

### Prototype
```c
int aws_rw_lock_wlock(struct aws_rw_lock *lock);
```
"""
function aws_rw_lock_wlock(lock)
    ccall((:aws_rw_lock_wlock, libawscrt), Cint, (Ptr{aws_rw_lock},), lock)
end

"""
    aws_rw_lock_try_rlock(lock)

Attempts to acquire the lock but returns immediately if it can not. While on some platforms such as Windows, this may behave as a reentrant mutex, you should not treat it like one. On platforms it is possible for it to be non-reentrant, it will be. Note: For windows, minimum support server version is Windows Server 2008 R2 [desktop apps | UWP apps]

### Prototype
```c
int aws_rw_lock_try_rlock(struct aws_rw_lock *lock);
```
"""
function aws_rw_lock_try_rlock(lock)
    ccall((:aws_rw_lock_try_rlock, libawscrt), Cint, (Ptr{aws_rw_lock},), lock)
end

"""
    aws_rw_lock_try_wlock(lock)

### Prototype
```c
int aws_rw_lock_try_wlock(struct aws_rw_lock *lock);
```
"""
function aws_rw_lock_try_wlock(lock)
    ccall((:aws_rw_lock_try_wlock, libawscrt), Cint, (Ptr{aws_rw_lock},), lock)
end

"""
    aws_rw_lock_runlock(lock)

Releases the lock.

### Prototype
```c
int aws_rw_lock_runlock(struct aws_rw_lock *lock);
```
"""
function aws_rw_lock_runlock(lock)
    ccall((:aws_rw_lock_runlock, libawscrt), Cint, (Ptr{aws_rw_lock},), lock)
end

"""
    aws_rw_lock_wunlock(lock)

### Prototype
```c
int aws_rw_lock_wunlock(struct aws_rw_lock *lock);
```
"""
function aws_rw_lock_wunlock(lock)
    ccall((:aws_rw_lock_wunlock, libawscrt), Cint, (Ptr{aws_rw_lock},), lock)
end

const aws_crt_statistics_category_t = UInt32

"""
    aws_crt_common_statistics_category

The common-specific range of the aws\\_crt\\_statistics\\_category cross-library enum.

This enum functions as an RTTI value that lets statistics handler's interpret (via cast) a specific statistics structure if the RTTI value is understood.

Common doesn't have any statistics structures presently, so its range is essentially empty.
"""
@cenum aws_crt_common_statistics_category::UInt32 begin
    AWSCRT_STAT_CAT_INVALID = 0
end

"""
    aws_crt_statistics_base

Pattern-struct that functions as a base "class" for all statistics structures. To conform to the pattern, a statistics structure must have its first member be the category. In that case it becomes "safe" to cast from [`aws_crt_statistics_base`](@ref) to the specific statistics structure based on the category value.
"""
struct aws_crt_statistics_base
    category::aws_crt_statistics_category_t
end

"""
    aws_crt_statistics_sample_interval

The start and end time, in milliseconds-since-epoch, that a set of statistics was gathered over.
"""
struct aws_crt_statistics_sample_interval
    begin_time_ms::UInt64
    end_time_ms::UInt64
end

# typedef void ( aws_crt_statistics_handler_process_statistics_fn ) ( struct aws_crt_statistics_handler * handler , struct aws_crt_statistics_sample_interval * interval , struct aws_array_list * stats , void * context )
const aws_crt_statistics_handler_process_statistics_fn = Cvoid

# typedef void ( aws_crt_statistics_handler_destroy_fn ) ( struct aws_crt_statistics_handler * handler )
const aws_crt_statistics_handler_destroy_fn = Cvoid

# typedef uint64_t ( aws_crt_statistics_handler_get_report_interval_ms_fn ) ( struct aws_crt_statistics_handler * )
const aws_crt_statistics_handler_get_report_interval_ms_fn = Cvoid

"""
    aws_crt_statistics_handler_vtable

Vtable for functions that all statistics handlers must implement
"""
struct aws_crt_statistics_handler_vtable
    process_statistics::Ptr{Cvoid}
    destroy::Ptr{Cvoid}
    get_report_interval_ms::Ptr{Cvoid}
end

"""
    aws_crt_statistics_handler

Base structure for all statistics handler implementations.

A statistics handler is an object that listens to a stream of polymorphic (via the category RTTI enum) statistics structures emitted from some arbitrary source. In the initial implementation, statistics handlers are primarily attached to channels, where they monitor IO throughput and state data (from channel handlers) to determine a connection's health.

Statistics handlers are a generalization of the timeout and bandwidth filters that are often associated with SDK network connections. Configurable, default implementations are defined at the protocol level (http, etc...) where they can be attached at connection (channel) creation time.
"""
struct aws_crt_statistics_handler
    vtable::Ptr{aws_crt_statistics_handler_vtable}
    allocator::Ptr{aws_allocator}
    impl::Ptr{Cvoid}
end

"""
    aws_crt_statistics_handler_process_statistics(handler, interval, stats, context)

Submits a list of statistics objects to a statistics handler for processing

handler - the statistics handler that will process the statistics objects interval - time period over which the statistics were gathered stats - list of pointers to structures that can be case to [`aws_crt_statistics_base`](@ref) (i.e. have category as a first member) context - (optional) additional context specific to where the statistics handler has been attached

### Prototype
```c
void aws_crt_statistics_handler_process_statistics( struct aws_crt_statistics_handler *handler, struct aws_crt_statistics_sample_interval *interval, struct aws_array_list *stats, void *context);
```
"""
function aws_crt_statistics_handler_process_statistics(handler, interval, stats, context)
    ccall((:aws_crt_statistics_handler_process_statistics, libawscrt), Cvoid, (Ptr{aws_crt_statistics_handler}, Ptr{aws_crt_statistics_sample_interval}, Ptr{aws_array_list}, Ptr{Cvoid}), handler, interval, stats, context)
end

"""
    aws_crt_statistics_handler_get_report_interval_ms(handler)

Queries the frequency (via an interval in milliseconds) which a statistics handler would like to be informed of statistics.

### Prototype
```c
uint64_t aws_crt_statistics_handler_get_report_interval_ms(struct aws_crt_statistics_handler *handler);
```
"""
function aws_crt_statistics_handler_get_report_interval_ms(handler)
    ccall((:aws_crt_statistics_handler_get_report_interval_ms, libawscrt), UInt64, (Ptr{aws_crt_statistics_handler},), handler)
end

"""
    aws_crt_statistics_handler_destroy(handler)

completely destroys a statistics handler. The handler's cleanup function must clean up the impl portion completely (including its allocation, if done separately).

### Prototype
```c
void aws_crt_statistics_handler_destroy(struct aws_crt_statistics_handler *handler);
```
"""
function aws_crt_statistics_handler_destroy(handler)
    ccall((:aws_crt_statistics_handler_destroy, libawscrt), Cvoid, (Ptr{aws_crt_statistics_handler},), handler)
end

"""
\\deprecated Use int64\\_t instead for offsets in public APIs.
"""
const aws_off_t = Int64

"""
    aws_string_eq(a, b)

Returns true if bytes of string are the same, false otherwise.

### Prototype
```c
bool aws_string_eq(const struct aws_string *a, const struct aws_string *b);
```
"""
function aws_string_eq(a, b)
    ccall((:aws_string_eq, libawscrt), Bool, (Ptr{aws_string}, Ptr{aws_string}), a, b)
end

"""
    aws_string_eq_ignore_case(a, b)

Returns true if bytes of string are equivalent, using a case-insensitive comparison.

### Prototype
```c
bool aws_string_eq_ignore_case(const struct aws_string *a, const struct aws_string *b);
```
"""
function aws_string_eq_ignore_case(a, b)
    ccall((:aws_string_eq_ignore_case, libawscrt), Bool, (Ptr{aws_string}, Ptr{aws_string}), a, b)
end

"""
    aws_string_eq_byte_cursor(str, cur)

Returns true if bytes of string and cursor are the same, false otherwise.

### Prototype
```c
bool aws_string_eq_byte_cursor(const struct aws_string *str, const struct aws_byte_cursor *cur);
```
"""
function aws_string_eq_byte_cursor(str, cur)
    ccall((:aws_string_eq_byte_cursor, libawscrt), Bool, (Ptr{aws_string}, Ptr{aws_byte_cursor}), str, cur)
end

"""
    aws_string_eq_byte_cursor_ignore_case(str, cur)

Returns true if bytes of string and cursor are equivalent, using a case-insensitive comparison.

### Prototype
```c
bool aws_string_eq_byte_cursor_ignore_case(const struct aws_string *str, const struct aws_byte_cursor *cur);
```
"""
function aws_string_eq_byte_cursor_ignore_case(str, cur)
    ccall((:aws_string_eq_byte_cursor_ignore_case, libawscrt), Bool, (Ptr{aws_string}, Ptr{aws_byte_cursor}), str, cur)
end

"""
    aws_string_eq_byte_buf(str, buf)

Returns true if bytes of string and buffer are the same, false otherwise.

### Prototype
```c
bool aws_string_eq_byte_buf(const struct aws_string *str, const struct aws_byte_buf *buf);
```
"""
function aws_string_eq_byte_buf(str, buf)
    ccall((:aws_string_eq_byte_buf, libawscrt), Bool, (Ptr{aws_string}, Ptr{aws_byte_buf}), str, buf)
end

"""
    aws_string_eq_byte_buf_ignore_case(str, buf)

Returns true if bytes of string and buffer are equivalent, using a case-insensitive comparison.

### Prototype
```c
bool aws_string_eq_byte_buf_ignore_case(const struct aws_string *str, const struct aws_byte_buf *buf);
```
"""
function aws_string_eq_byte_buf_ignore_case(str, buf)
    ccall((:aws_string_eq_byte_buf_ignore_case, libawscrt), Bool, (Ptr{aws_string}, Ptr{aws_byte_buf}), str, buf)
end

"""
    aws_string_eq_c_str(str, c_str)

### Prototype
```c
bool aws_string_eq_c_str(const struct aws_string *str, const char *c_str);
```
"""
function aws_string_eq_c_str(str, c_str)
    ccall((:aws_string_eq_c_str, libawscrt), Bool, (Ptr{aws_string}, Ptr{Cchar}), str, c_str)
end

"""
    aws_string_eq_c_str_ignore_case(str, c_str)

Returns true if bytes of strings are equivalent, using a case-insensitive comparison.

### Prototype
```c
bool aws_string_eq_c_str_ignore_case(const struct aws_string *str, const char *c_str);
```
"""
function aws_string_eq_c_str_ignore_case(str, c_str)
    ccall((:aws_string_eq_c_str_ignore_case, libawscrt), Bool, (Ptr{aws_string}, Ptr{Cchar}), str, c_str)
end

"""
    aws_string_new_from_c_str(allocator, c_str)

Constructor functions which copy data from null-terminated C-string or array of bytes.

### Prototype
```c
struct aws_string *aws_string_new_from_c_str(struct aws_allocator *allocator, const char *c_str);
```
"""
function aws_string_new_from_c_str(allocator, c_str)
    ccall((:aws_string_new_from_c_str, libawscrt), Ptr{aws_string}, (Ptr{aws_allocator}, Ptr{Cchar}), allocator, c_str)
end

"""
    aws_string_new_from_array(allocator, bytes, len)

Allocate a new string with the same contents as array.

### Prototype
```c
struct aws_string *aws_string_new_from_array(struct aws_allocator *allocator, const uint8_t *bytes, size_t len);
```
"""
function aws_string_new_from_array(allocator, bytes, len)
    ccall((:aws_string_new_from_array, libawscrt), Ptr{aws_string}, (Ptr{aws_allocator}, Ptr{UInt8}, Csize_t), allocator, bytes, len)
end

"""
    aws_string_new_from_string(allocator, str)

Allocate a new string with the same contents as another string.

### Prototype
```c
struct aws_string *aws_string_new_from_string(struct aws_allocator *allocator, const struct aws_string *str);
```
"""
function aws_string_new_from_string(allocator, str)
    ccall((:aws_string_new_from_string, libawscrt), Ptr{aws_string}, (Ptr{aws_allocator}, Ptr{aws_string}), allocator, str)
end

"""
    aws_string_new_from_cursor(allocator, cursor)

Allocate a new string with the same contents as cursor.

### Prototype
```c
struct aws_string *aws_string_new_from_cursor(struct aws_allocator *allocator, const struct aws_byte_cursor *cursor);
```
"""
function aws_string_new_from_cursor(allocator, cursor)
    ccall((:aws_string_new_from_cursor, libawscrt), Ptr{aws_string}, (Ptr{aws_allocator}, Ptr{aws_byte_cursor}), allocator, cursor)
end

"""
    aws_string_new_from_buf(allocator, buf)

Allocate a new string with the same contents as buf.

### Prototype
```c
struct aws_string *aws_string_new_from_buf(struct aws_allocator *allocator, const struct aws_byte_buf *buf);
```
"""
function aws_string_new_from_buf(allocator, buf)
    ccall((:aws_string_new_from_buf, libawscrt), Ptr{aws_string}, (Ptr{aws_allocator}, Ptr{aws_byte_buf}), allocator, buf)
end

"""
    aws_string_destroy(str)

Deallocate string.

### Prototype
```c
void aws_string_destroy(struct aws_string *str);
```
"""
function aws_string_destroy(str)
    ccall((:aws_string_destroy, libawscrt), Cvoid, (Ptr{aws_string},), str)
end

"""
    aws_string_destroy_secure(str)

Zeroes out the data bytes of string and then deallocates the memory. Not safe to run on a string created with [`AWS_STATIC_STRING_FROM_LITERAL`](@ref).

### Prototype
```c
void aws_string_destroy_secure(struct aws_string *str);
```
"""
function aws_string_destroy_secure(str)
    ccall((:aws_string_destroy_secure, libawscrt), Cvoid, (Ptr{aws_string},), str)
end

"""
    aws_string_compare(a, b)

Compares lexicographical ordering of two strings. This is a binary byte-by-byte comparison, treating bytes as unsigned integers. It is suitable for either textual or binary data and is unaware of unicode or any other byte encoding. If both strings are identical in the bytes of the shorter string, then the longer string is lexicographically after the shorter.

Returns a positive number if string a > string b. (i.e., string a is lexicographically after string b.) Returns zero if string a = string b. Returns negative number if string a < string b.

### Prototype
```c
int aws_string_compare(const struct aws_string *a, const struct aws_string *b);
```
"""
function aws_string_compare(a, b)
    ccall((:aws_string_compare, libawscrt), Cint, (Ptr{aws_string}, Ptr{aws_string}), a, b)
end

"""
    aws_array_list_comparator_string(a, b)

A convenience function for sorting lists of (const struct [`aws_string`](@ref) *) elements. This can be used as a comparator for [`aws_array_list_sort`](@ref). It is just a simple wrapper around [`aws_string_compare`](@ref).

### Prototype
```c
int aws_array_list_comparator_string(const void *a, const void *b);
```
"""
function aws_array_list_comparator_string(a, b)
    ccall((:aws_array_list_comparator_string, libawscrt), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), a, b)
end

"""
    aws_byte_buf_write_from_whole_string(buf, src)

Copies all bytes from string to buf.

On success, returns true and updates the buf pointer/length accordingly. If there is insufficient space in the buf, returns false, leaving the buf unchanged.

### Prototype
```c
bool aws_byte_buf_write_from_whole_string( struct aws_byte_buf *AWS_RESTRICT buf, const struct aws_string *AWS_RESTRICT src);
```
"""
function aws_byte_buf_write_from_whole_string(buf, src)
    ccall((:aws_byte_buf_write_from_whole_string, libawscrt), Bool, (Ptr{aws_byte_buf}, Ptr{aws_string}), buf, src)
end

"""
    aws_byte_cursor_from_string(src)

Creates an [`aws_byte_cursor`](@ref) from an existing string.

### Prototype
```c
struct aws_byte_cursor aws_byte_cursor_from_string(const struct aws_string *src);
```
"""
function aws_byte_cursor_from_string(src)
    ccall((:aws_byte_cursor_from_string, libawscrt), aws_byte_cursor, (Ptr{aws_string},), src)
end

"""
    aws_string_clone_or_reuse(allocator, str)

If the string was dynamically allocated, clones it. If the string was statically allocated (i.e. has no allocator), returns the original string.

### Prototype
```c
struct aws_string *aws_string_clone_or_reuse(struct aws_allocator *allocator, const struct aws_string *str);
```
"""
function aws_string_clone_or_reuse(allocator, str)
    ccall((:aws_string_clone_or_reuse, libawscrt), Ptr{aws_string}, (Ptr{aws_allocator}, Ptr{aws_string}), allocator, str)
end

"""
    aws_secure_strlen(str, max_read_len, str_len)

Computes the length of a c string in bytes assuming the character set is either ASCII or UTF-8. If no NULL character is found within max\\_read\\_len of str, AWS\\_ERROR\\_C\\_STRING\\_BUFFER\\_NOT\\_NULL\\_TERMINATED is raised. Otherwise, str\\_len will contain the string length minus the NULL character, and [`AWS_OP_SUCCESS`](@ref) will be returned.

### Prototype
```c
int aws_secure_strlen(const char *str, size_t max_read_len, size_t *str_len);
```
"""
function aws_secure_strlen(str, max_read_len, str_len)
    ccall((:aws_secure_strlen, libawscrt), Cint, (Ptr{Cchar}, Csize_t, Ptr{Csize_t}), str, max_read_len, str_len)
end

"""
    aws_string_bytes(str)

Equivalent to str->bytes.

### Prototype
```c
AWS_STATIC_IMPL const uint8_t *aws_string_bytes(const struct aws_string *str);
```
"""
function aws_string_bytes(str)
    ccall((:aws_string_bytes, libawscrt), Ptr{UInt8}, (Ptr{aws_string},), str)
end

"""
    aws_string_c_str(str)

Equivalent to `(const char *)str->bytes`.

### Prototype
```c
AWS_STATIC_IMPL const char *aws_string_c_str(const struct aws_string *str);
```
"""
function aws_string_c_str(str)
    ccall((:aws_string_c_str, libawscrt), Ptr{Cchar}, (Ptr{aws_string},), str)
end

"""
    aws_string_is_valid(str)

Evaluates the set of properties that define the shape of all valid [`aws_string`](@ref) structures. It is also a cheap check, in the sense it run in constant time (i.e., no loops or recursion).

### Prototype
```c
AWS_STATIC_IMPL bool aws_string_is_valid(const struct aws_string *str);
```
"""
function aws_string_is_valid(str)
    ccall((:aws_string_is_valid, libawscrt), Bool, (Ptr{aws_string},), str)
end

"""
    aws_c_string_is_valid(str)

Best-effort checks [`aws_string`](@ref) invariants, when the str->len is unknown

### Prototype
```c
AWS_STATIC_IMPL bool aws_c_string_is_valid(const char *str);
```
"""
function aws_c_string_is_valid(str)
    ccall((:aws_c_string_is_valid, libawscrt), Bool, (Ptr{Cchar},), str)
end

"""
    aws_char_is_space(c)

Evaluates if a char is a white character.

### Prototype
```c
AWS_STATIC_IMPL bool aws_char_is_space(uint8_t c);
```
"""
function aws_char_is_space(c)
    ccall((:aws_char_is_space, libawscrt), Bool, (UInt8,), c)
end

@cenum aws_platform_os::UInt32 begin
    AWS_PLATFORM_OS_WINDOWS = 0
    AWS_PLATFORM_OS_MAC = 1
    AWS_PLATFORM_OS_UNIX = 2
end

struct aws_cpu_info
    cpu_id::Int32
    suspected_hyper_thread::Bool
end

"""
    aws_get_platform_build_os()

### Prototype
```c
enum aws_platform_os aws_get_platform_build_os(void);
```
"""
function aws_get_platform_build_os()
    ccall((:aws_get_platform_build_os, libawscrt), aws_platform_os, ())
end

"""
    aws_system_info_processor_count()

### Prototype
```c
size_t aws_system_info_processor_count(void);
```
"""
function aws_system_info_processor_count()
    ccall((:aws_system_info_processor_count, libawscrt), Csize_t, ())
end

"""
    aws_get_cpu_group_count()

Returns the logical processor groupings on the system (such as multiple numa nodes).

### Prototype
```c
uint16_t aws_get_cpu_group_count(void);
```
"""
function aws_get_cpu_group_count()
    ccall((:aws_get_cpu_group_count, libawscrt), UInt16, ())
end

"""
    aws_get_cpu_count_for_group(group_idx)

For a group, returns the number of CPUs it contains.

### Prototype
```c
size_t aws_get_cpu_count_for_group(uint16_t group_idx);
```
"""
function aws_get_cpu_count_for_group(group_idx)
    ccall((:aws_get_cpu_count_for_group, libawscrt), Csize_t, (UInt16,), group_idx)
end

"""
    aws_get_cpu_ids_for_group(group_idx, cpu_ids_array, cpu_ids_array_length)

Fills in cpu\\_ids\\_array with the cpu\\_id's for the group. To obtain the size to allocate for cpu\\_ids\\_array and the value for argument for cpu\\_ids\\_array\\_length, call [`aws_get_cpu_count_for_group`](@ref)().

### Prototype
```c
void aws_get_cpu_ids_for_group(uint16_t group_idx, struct aws_cpu_info *cpu_ids_array, size_t cpu_ids_array_length);
```
"""
function aws_get_cpu_ids_for_group(group_idx, cpu_ids_array, cpu_ids_array_length)
    ccall((:aws_get_cpu_ids_for_group, libawscrt), Cvoid, (UInt16, Ptr{aws_cpu_info}, Csize_t), group_idx, cpu_ids_array, cpu_ids_array_length)
end

"""
    aws_is_debugger_present()

### Prototype
```c
bool aws_is_debugger_present(void);
```
"""
function aws_is_debugger_present()
    ccall((:aws_is_debugger_present, libawscrt), Bool, ())
end

"""
    aws_debug_break()

### Prototype
```c
void aws_debug_break(void);
```
"""
function aws_debug_break()
    ccall((:aws_debug_break, libawscrt), Cvoid, ())
end

"""
    aws_backtrace(stack_frames, num_frames)

### Prototype
```c
size_t aws_backtrace(void **stack_frames, size_t num_frames);
```
"""
function aws_backtrace(stack_frames, num_frames)
    ccall((:aws_backtrace, libawscrt), Csize_t, (Ptr{Ptr{Cvoid}}, Csize_t), stack_frames, num_frames)
end

"""
    aws_backtrace_symbols(stack_frames, stack_depth)

### Prototype
```c
char **aws_backtrace_symbols(void *const *stack_frames, size_t stack_depth);
```
"""
function aws_backtrace_symbols(stack_frames, stack_depth)
    ccall((:aws_backtrace_symbols, libawscrt), Ptr{Ptr{Cchar}}, (Ptr{Ptr{Cvoid}}, Csize_t), stack_frames, stack_depth)
end

"""
    aws_backtrace_addr2line(stack_frames, stack_depth)

### Prototype
```c
char **aws_backtrace_addr2line(void *const *stack_frames, size_t stack_depth);
```
"""
function aws_backtrace_addr2line(stack_frames, stack_depth)
    ccall((:aws_backtrace_addr2line, libawscrt), Ptr{Ptr{Cchar}}, (Ptr{Ptr{Cvoid}}, Csize_t), stack_frames, stack_depth)
end

"""
    aws_backtrace_print(fp, call_site_data)

Print a backtrace from either the current stack, or (if provided) the current exception/signal call\\_site\\_data is [`siginfo_t`](@ref)* on POSIX, and LPEXCEPTION\\_POINTERS on Windows, and can be null

### Prototype
```c
void aws_backtrace_print(FILE *fp, void *call_site_data);
```
"""
function aws_backtrace_print(fp, call_site_data)
    ccall((:aws_backtrace_print, libawscrt), Cvoid, (Ptr{Libc.FILE}, Ptr{Cvoid}), fp, call_site_data)
end

"""
    aws_backtrace_log(log_level)

### Prototype
```c
void aws_backtrace_log(int log_level);
```
"""
function aws_backtrace_log(log_level)
    ccall((:aws_backtrace_log, libawscrt), Cvoid, (Cint,), log_level)
end

@cenum aws_task_status::UInt32 begin
    AWS_TASK_STATUS_RUN_READY = 0
    AWS_TASK_STATUS_CANCELED = 1
end

# typedef void ( aws_task_fn ) ( struct aws_task * task , void * arg , enum aws_task_status )
"""
A scheduled function.
"""
const aws_task_fn = Cvoid

struct var"##Ctag#5976"
    data::NTuple{8, UInt8}
end

function Base.getproperty(x::Ptr{var"##Ctag#5976"}, f::Symbol)
    f === :scheduled && return Ptr{Bool}(x + 0)
    f === :reserved && return Ptr{Csize_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#5976", f::Symbol)
    r = Ref{var"##Ctag#5976"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#5976"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#5976"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct aws_task
    data::NTuple{64, UInt8}
end

function Base.getproperty(x::Ptr{aws_task}, f::Symbol)
    f === :fn && return Ptr{Ptr{Cvoid}}(x + 0)
    f === :arg && return Ptr{Ptr{Cvoid}}(x + 8)
    f === :timestamp && return Ptr{UInt64}(x + 16)
    f === :node && return Ptr{aws_linked_list_node}(x + 24)
    f === :priority_queue_node && return Ptr{aws_priority_queue_node}(x + 40)
    f === :type_tag && return Ptr{Ptr{Cchar}}(x + 48)
    f === :abi_extension && return Ptr{var"##Ctag#5976"}(x + 56)
    return getfield(x, f)
end

function Base.getproperty(x::aws_task, f::Symbol)
    r = Ref{aws_task}(x)
    ptr = Base.unsafe_convert(Ptr{aws_task}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{aws_task}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct aws_task_scheduler
    alloc::Ptr{aws_allocator}
    timed_queue::aws_priority_queue
    timed_list::aws_linked_list
    asap_list::aws_linked_list
end

"""
    aws_task_init(task, fn, arg, type_tag)

Init an [`aws_task`](@ref)

### Prototype
```c
void aws_task_init(struct aws_task *task, aws_task_fn *fn, void *arg, const char *type_tag);
```
"""
function aws_task_init(task, fn, arg, type_tag)
    ccall((:aws_task_init, libawscrt), Cvoid, (Ptr{aws_task}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cchar}), task, fn, arg, type_tag)
end

"""
    aws_task_run(task, status)

### Prototype
```c
void aws_task_run(struct aws_task *task, enum aws_task_status status);
```
"""
function aws_task_run(task, status)
    ccall((:aws_task_run, libawscrt), Cvoid, (Ptr{aws_task}, aws_task_status), task, status)
end

"""
    aws_task_scheduler_init(scheduler, alloc)

Initializes a task scheduler instance.

### Prototype
```c
int aws_task_scheduler_init(struct aws_task_scheduler *scheduler, struct aws_allocator *alloc);
```
"""
function aws_task_scheduler_init(scheduler, alloc)
    ccall((:aws_task_scheduler_init, libawscrt), Cint, (Ptr{aws_task_scheduler}, Ptr{aws_allocator}), scheduler, alloc)
end

"""
    aws_task_scheduler_clean_up(scheduler)

Empties and executes all queued tasks, passing the AWS\\_TASK\\_STATUS\\_CANCELED status to the task function. Cleans up any memory allocated, and prepares the instance for reuse or deletion.

### Prototype
```c
void aws_task_scheduler_clean_up(struct aws_task_scheduler *scheduler);
```
"""
function aws_task_scheduler_clean_up(scheduler)
    ccall((:aws_task_scheduler_clean_up, libawscrt), Cvoid, (Ptr{aws_task_scheduler},), scheduler)
end

"""
    aws_task_scheduler_is_valid(scheduler)

### Prototype
```c
bool aws_task_scheduler_is_valid(const struct aws_task_scheduler *scheduler);
```
"""
function aws_task_scheduler_is_valid(scheduler)
    ccall((:aws_task_scheduler_is_valid, libawscrt), Bool, (Ptr{aws_task_scheduler},), scheduler)
end

"""
    aws_task_scheduler_has_tasks(scheduler, next_task_time)

Returns whether the scheduler has any scheduled tasks. next\\_task\\_time (optional) will be set to time of the next task, note that 0 will be set if tasks were added via [`aws_task_scheduler_schedule_now`](@ref)() and UINT64\\_MAX will be set if no tasks are scheduled at all.

### Prototype
```c
bool aws_task_scheduler_has_tasks(const struct aws_task_scheduler *scheduler, uint64_t *next_task_time);
```
"""
function aws_task_scheduler_has_tasks(scheduler, next_task_time)
    ccall((:aws_task_scheduler_has_tasks, libawscrt), Bool, (Ptr{aws_task_scheduler}, Ptr{UInt64}), scheduler, next_task_time)
end

"""
    aws_task_scheduler_schedule_now(scheduler, task)

Schedules a task to run immediately. The task should not be cleaned up or modified until its function is executed.

### Prototype
```c
void aws_task_scheduler_schedule_now(struct aws_task_scheduler *scheduler, struct aws_task *task);
```
"""
function aws_task_scheduler_schedule_now(scheduler, task)
    ccall((:aws_task_scheduler_schedule_now, libawscrt), Cvoid, (Ptr{aws_task_scheduler}, Ptr{aws_task}), scheduler, task)
end

"""
    aws_task_scheduler_schedule_future(scheduler, task, time_to_run)

Schedules a task to run at time\\_to\\_run. The task should not be cleaned up or modified until its function is executed.

### Prototype
```c
void aws_task_scheduler_schedule_future( struct aws_task_scheduler *scheduler, struct aws_task *task, uint64_t time_to_run);
```
"""
function aws_task_scheduler_schedule_future(scheduler, task, time_to_run)
    ccall((:aws_task_scheduler_schedule_future, libawscrt), Cvoid, (Ptr{aws_task_scheduler}, Ptr{aws_task}, UInt64), scheduler, task, time_to_run)
end

"""
    aws_task_scheduler_cancel_task(scheduler, task)

Removes task from the scheduler and invokes the task with the AWS\\_TASK\\_STATUS\\_CANCELED status.

### Prototype
```c
void aws_task_scheduler_cancel_task(struct aws_task_scheduler *scheduler, struct aws_task *task);
```
"""
function aws_task_scheduler_cancel_task(scheduler, task)
    ccall((:aws_task_scheduler_cancel_task, libawscrt), Cvoid, (Ptr{aws_task_scheduler}, Ptr{aws_task}), scheduler, task)
end

"""
    aws_task_scheduler_run_all(scheduler, current_time)

Sequentially execute all tasks scheduled to run at, or before current\\_time. AWS\\_TASK\\_STATUS\\_RUN\\_READY will be passed to the task function as the task status.

If a task schedules another task, the new task will not be executed until the next call to this function.

### Prototype
```c
void aws_task_scheduler_run_all(struct aws_task_scheduler *scheduler, uint64_t current_time);
```
"""
function aws_task_scheduler_run_all(scheduler, current_time)
    ccall((:aws_task_scheduler_run_all, libawscrt), Cvoid, (Ptr{aws_task_scheduler}, UInt64), scheduler, current_time)
end

"""
    aws_task_status_to_c_str(status)

Convert a status value to a c-string suitable for logging

### Prototype
```c
const char *aws_task_status_to_c_str(enum aws_task_status status);
```
"""
function aws_task_status_to_c_str(status)
    ccall((:aws_task_status_to_c_str, libawscrt), Ptr{Cchar}, (aws_task_status,), status)
end

@cenum aws_thread_detach_state::UInt32 begin
    AWS_THREAD_NOT_CREATED = 1
    AWS_THREAD_JOINABLE = 2
    AWS_THREAD_JOIN_COMPLETED = 3
    AWS_THREAD_MANAGED = 4
end

"""
    aws_thread_join_strategy

Specifies the join strategy used on an [`aws_thread`](@ref), which in turn controls whether or not a thread participates in the managed thread system. The managed thread system provides logic to guarantee a join on all participating threads at the cost of laziness (the user cannot control when joins happen).

Manual - thread does not particpate in the managed thread system; any joins must be done by the user. This is the default. The user must call [`aws_thread_clean_up`](@ref)(), but only after any desired join operation has completed. Not doing so will cause the windows handle to leak.

Managed - the managed thread system will automatically perform a join some time after the thread's run function has completed. It is an error to call [`aws_thread_join`](@ref) on a thread configured with the managed join strategy. The managed thread system will call [`aws_thread_clean_up`](@ref)() on the thread after the background join has completed.

Additionally, an API exists, [`aws_thread_join_all_managed`](@ref)(), which blocks and returns when all outstanding threads with the managed strategy have fully joined. This API is useful for tests (rather than waiting for many individual signals) and program shutdown or DLL unload. This API is automatically invoked by the common library clean up function. If the common library clean up is called from a managed thread, this will cause deadlock.

Lazy thread joining is done only when threads finish their run function or when the user calls [`aws_thread_join_all_managed`](@ref)(). This means it may be a long time between thread function completion and the join being applied, but the queue of unjoined threads is always one or fewer so there is no critical resource backlog.

Currently, only event loop group async cleanup and host resolver threads participate in the managed thread system. Additionally, event loop threads will increment and decrement the pending join count (they are manually joined internally) in order to have an accurate view of internal thread usage and also to prevent failure to release an event loop group fully from allowing [`aws_thread_join_all_managed`](@ref)() from running to completion when its intent is such that it should block instead.
"""
@cenum aws_thread_join_strategy::UInt32 begin
    AWS_TJS_MANUAL = 0
    AWS_TJS_MANAGED = 1
end

struct aws_thread_options
    stack_size::Csize_t
    cpu_id::Int32
    join_strategy::aws_thread_join_strategy
end

const aws_thread_once = pthread_once_t

struct aws_thread
    allocator::Ptr{aws_allocator}
    detach_state::aws_thread_detach_state
    thread_id::aws_thread_id_t
end

"""
    aws_default_thread_options()

Returns an instance of system default thread options.

### Prototype
```c
const struct aws_thread_options *aws_default_thread_options(void);
```
"""
function aws_default_thread_options()
    ccall((:aws_default_thread_options, libawscrt), Ptr{aws_thread_options}, ())
end

"""
    aws_thread_call_once(flag, call_once, user_data)

### Prototype
```c
void aws_thread_call_once(aws_thread_once *flag, void (*call_once)(void *), void *user_data);
```
"""
function aws_thread_call_once(flag, call_once, user_data)
    ccall((:aws_thread_call_once, libawscrt), Cvoid, (Ptr{aws_thread_once}, Ptr{Cvoid}, Ptr{Cvoid}), flag, call_once, user_data)
end

"""
    aws_thread_init(thread, allocator)

Initializes a new platform specific thread object struct (not the os-level thread itself).

### Prototype
```c
int aws_thread_init(struct aws_thread *thread, struct aws_allocator *allocator);
```
"""
function aws_thread_init(thread, allocator)
    ccall((:aws_thread_init, libawscrt), Cint, (Ptr{aws_thread}, Ptr{aws_allocator}), thread, allocator)
end

"""
    aws_thread_launch(thread, func, arg, options)

Creates an OS level thread and associates it with func. context will be passed to func when it is executed. options will be applied to the thread if they are applicable for the platform.

After launch, you may join on the thread. A successfully launched thread must have clean\\_up called on it in order to avoid a handle leak. If you do not join before calling clean\\_up, the thread will become detached.

Managed threads must not have join or clean\\_up called on them by external code.

### Prototype
```c
int aws_thread_launch( struct aws_thread *thread, void (*func)(void *arg), void *arg, const struct aws_thread_options *options);
```
"""
function aws_thread_launch(thread, func, arg, options)
    ccall((:aws_thread_launch, libawscrt), Cint, (Ptr{aws_thread}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{aws_thread_options}), thread, func, arg, options)
end

"""
    aws_thread_get_id(thread)

Gets the id of thread

### Prototype
```c
aws_thread_id_t aws_thread_get_id(struct aws_thread *thread);
```
"""
function aws_thread_get_id(thread)
    ccall((:aws_thread_get_id, libawscrt), aws_thread_id_t, (Ptr{aws_thread},), thread)
end

"""
    aws_thread_get_detach_state(thread)

Gets the detach state of the thread. For example, is it safe to call join on this thread? Has it been detached()?

### Prototype
```c
enum aws_thread_detach_state aws_thread_get_detach_state(struct aws_thread *thread);
```
"""
function aws_thread_get_detach_state(thread)
    ccall((:aws_thread_get_detach_state, libawscrt), aws_thread_detach_state, (Ptr{aws_thread},), thread)
end

"""
    aws_thread_join(thread)

Joins the calling thread to a thread instance. Returns when thread is finished. Calling this from the associated OS thread will cause a deadlock.

### Prototype
```c
int aws_thread_join(struct aws_thread *thread);
```
"""
function aws_thread_join(thread)
    ccall((:aws_thread_join, libawscrt), Cint, (Ptr{aws_thread},), thread)
end

"""
    aws_thread_join_all_managed()

Blocking call that waits for all managed threads to complete their join call. This can only be called from the main thread or a non-managed thread.

This gets called automatically from library cleanup.

By default the wait is unbounded, but that default can be overridden via [`aws_thread_set_managed_join_timeout_ns`](@ref)()

### Prototype
```c
int aws_thread_join_all_managed(void);
```
"""
function aws_thread_join_all_managed()
    ccall((:aws_thread_join_all_managed, libawscrt), Cint, ())
end

"""
    aws_thread_set_managed_join_timeout_ns(timeout_in_ns)

Overrides how long, in nanoseconds, that [`aws_thread_join_all_managed`](@ref) will wait for threads to complete. A value of zero will result in an unbounded wait.

### Prototype
```c
void aws_thread_set_managed_join_timeout_ns(uint64_t timeout_in_ns);
```
"""
function aws_thread_set_managed_join_timeout_ns(timeout_in_ns)
    ccall((:aws_thread_set_managed_join_timeout_ns, libawscrt), Cvoid, (UInt64,), timeout_in_ns)
end

"""
    aws_thread_clean_up(thread)

Cleans up the thread handle. Don't call this on a managed thread. If you wish to join the thread, you must join before calling this function.

### Prototype
```c
void aws_thread_clean_up(struct aws_thread *thread);
```
"""
function aws_thread_clean_up(thread)
    ccall((:aws_thread_clean_up, libawscrt), Cvoid, (Ptr{aws_thread},), thread)
end

"""
    aws_thread_current_thread_id()

Returns the thread id of the calling thread.

### Prototype
```c
aws_thread_id_t aws_thread_current_thread_id(void);
```
"""
function aws_thread_current_thread_id()
    ccall((:aws_thread_current_thread_id, libawscrt), aws_thread_id_t, ())
end

"""
    aws_thread_thread_id_equal(t1, t2)

Compare thread ids.

### Prototype
```c
bool aws_thread_thread_id_equal(aws_thread_id_t t1, aws_thread_id_t t2);
```
"""
function aws_thread_thread_id_equal(t1, t2)
    ccall((:aws_thread_thread_id_equal, libawscrt), Bool, (aws_thread_id_t, aws_thread_id_t), t1, t2)
end

"""
    aws_thread_current_sleep(nanos)

Sleeps the current thread by nanos.

### Prototype
```c
void aws_thread_current_sleep(uint64_t nanos);
```
"""
function aws_thread_current_sleep(nanos)
    ccall((:aws_thread_current_sleep, libawscrt), Cvoid, (UInt64,), nanos)
end

# typedef void ( aws_thread_atexit_fn ) ( void * user_data )
const aws_thread_atexit_fn = Cvoid

"""
    aws_thread_current_at_exit(callback, user_data)

Adds a callback to the chain to be called when the current thread joins. Callbacks are called from the current thread, in the reverse order they were added, after the thread function returns. If not called from within an [`aws_thread`](@ref), has no effect.

### Prototype
```c
int aws_thread_current_at_exit(aws_thread_atexit_fn *callback, void *user_data);
```
"""
function aws_thread_current_at_exit(callback, user_data)
    ccall((:aws_thread_current_at_exit, libawscrt), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), callback, user_data)
end

"""
    aws_thread_increment_unjoined_count()

Increments the count of unjoined threads in the managed thread system. Used by managed threads and event loop threads. Additional usage requires the user to join corresponding threads themselves and correctly increment/decrement even in the face of launch/join errors.

[`aws_thread_join_all_managed`](@ref)() will not return until this count has gone to zero.

### Prototype
```c
void aws_thread_increment_unjoined_count(void);
```
"""
function aws_thread_increment_unjoined_count()
    ccall((:aws_thread_increment_unjoined_count, libawscrt), Cvoid, ())
end

"""
    aws_thread_decrement_unjoined_count()

Decrements the count of unjoined threads in the managed thread system. Used by managed threads and event loop threads. Additional usage requires the user to join corresponding threads themselves and correctly increment/decrement even in the face of launch/join errors.

[`aws_thread_join_all_managed`](@ref)() will not return until this count has gone to zero.

### Prototype
```c
void aws_thread_decrement_unjoined_count(void);
```
"""
function aws_thread_decrement_unjoined_count()
    ccall((:aws_thread_decrement_unjoined_count, libawscrt), Cvoid, ())
end

mutable struct aws_thread_scheduler end

"""
    aws_thread_scheduler_new(allocator, thread_options)

Creates a new instance of a thread scheduler. This object receives scheduled tasks and executes them inside a background thread. On success, this function returns an instance with a ref-count of 1. On failure it returns NULL.

thread\\_options are optional.

The semantics of this interface conform to the semantics of [`aws_task_scheduler`](@ref).

### Prototype
```c
struct aws_thread_scheduler *aws_thread_scheduler_new( struct aws_allocator *allocator, const struct aws_thread_options *thread_options);
```
"""
function aws_thread_scheduler_new(allocator, thread_options)
    ccall((:aws_thread_scheduler_new, libawscrt), Ptr{aws_thread_scheduler}, (Ptr{aws_allocator}, Ptr{aws_thread_options}), allocator, thread_options)
end

"""
    aws_thread_scheduler_acquire(scheduler)

Acquire a reference to the scheduler.

### Prototype
```c
void aws_thread_scheduler_acquire(struct aws_thread_scheduler *scheduler);
```
"""
function aws_thread_scheduler_acquire(scheduler)
    ccall((:aws_thread_scheduler_acquire, libawscrt), Cvoid, (Ptr{aws_thread_scheduler},), scheduler)
end

"""
    aws_thread_scheduler_release(scheduler)

Release a reference to the scheduler.

### Prototype
```c
void aws_thread_scheduler_release(const struct aws_thread_scheduler *scheduler);
```
"""
function aws_thread_scheduler_release(scheduler)
    ccall((:aws_thread_scheduler_release, libawscrt), Cvoid, (Ptr{aws_thread_scheduler},), scheduler)
end

"""
    aws_thread_scheduler_schedule_future(scheduler, task, time_to_run)

Schedules a task to run in the future. time\\_to\\_run is the absolute time from the system hw\\_clock.

### Prototype
```c
void aws_thread_scheduler_schedule_future( struct aws_thread_scheduler *scheduler, struct aws_task *task, uint64_t time_to_run);
```
"""
function aws_thread_scheduler_schedule_future(scheduler, task, time_to_run)
    ccall((:aws_thread_scheduler_schedule_future, libawscrt), Cvoid, (Ptr{aws_thread_scheduler}, Ptr{aws_task}, UInt64), scheduler, task, time_to_run)
end

"""
    aws_thread_scheduler_schedule_now(scheduler, task)

Schedules a task to run as soon as possible.

### Prototype
```c
void aws_thread_scheduler_schedule_now(struct aws_thread_scheduler *scheduler, struct aws_task *task);
```
"""
function aws_thread_scheduler_schedule_now(scheduler, task)
    ccall((:aws_thread_scheduler_schedule_now, libawscrt), Cvoid, (Ptr{aws_thread_scheduler}, Ptr{aws_task}), scheduler, task)
end

"""
    aws_thread_scheduler_cancel_task(scheduler, task)

Cancel a task that has been scheduled. The cancellation callback will be invoked in the background thread. This function is slow, so please don't do it in the hot path for your code.

### Prototype
```c
void aws_thread_scheduler_cancel_task(struct aws_thread_scheduler *scheduler, struct aws_task *task);
```
"""
function aws_thread_scheduler_cancel_task(scheduler, task)
    ccall((:aws_thread_scheduler_cancel_task, libawscrt), Cvoid, (Ptr{aws_thread_scheduler}, Ptr{aws_task}), scheduler, task)
end

"""
    aws_timegm(t)

Cross platform friendly version of timegm

### Prototype
```c
time_t aws_timegm(struct tm *const t);
```
"""
function aws_timegm(t)
    ccall((:aws_timegm, libawscrt), time_t, (Ptr{tm},), t)
end

"""
    aws_localtime(time, t)

Cross platform friendly version of localtime\\_r

### Prototype
```c
void aws_localtime(time_t time, struct tm *t);
```
"""
function aws_localtime(time, t)
    ccall((:aws_localtime, libawscrt), Cvoid, (time_t, Ptr{tm}), time, t)
end

"""
    aws_gmtime(time, t)

Cross platform friendly version of gmtime\\_r

### Prototype
```c
void aws_gmtime(time_t time, struct tm *t);
```
"""
function aws_gmtime(time, t)
    ccall((:aws_gmtime, libawscrt), Cvoid, (time_t, Ptr{tm}), time, t)
end

struct aws_uuid
    uuid_data::NTuple{16, UInt8}
end

"""
    aws_uuid_init(uuid)

### Prototype
```c
int aws_uuid_init(struct aws_uuid *uuid);
```
"""
function aws_uuid_init(uuid)
    ccall((:aws_uuid_init, libawscrt), Cint, (Ptr{aws_uuid},), uuid)
end

"""
    aws_uuid_init_from_str(uuid, uuid_str)

### Prototype
```c
int aws_uuid_init_from_str(struct aws_uuid *uuid, const struct aws_byte_cursor *uuid_str);
```
"""
function aws_uuid_init_from_str(uuid, uuid_str)
    ccall((:aws_uuid_init_from_str, libawscrt), Cint, (Ptr{aws_uuid}, Ptr{aws_byte_cursor}), uuid, uuid_str)
end

"""
    aws_uuid_to_str(uuid, output)

### Prototype
```c
int aws_uuid_to_str(const struct aws_uuid *uuid, struct aws_byte_buf *output);
```
"""
function aws_uuid_to_str(uuid, output)
    ccall((:aws_uuid_to_str, libawscrt), Cint, (Ptr{aws_uuid}, Ptr{aws_byte_buf}), uuid, output)
end

"""
    aws_uuid_equals(a, b)

### Prototype
```c
bool aws_uuid_equals(const struct aws_uuid *a, const struct aws_uuid *b);
```
"""
function aws_uuid_equals(a, b)
    ccall((:aws_uuid_equals, libawscrt), Bool, (Ptr{aws_uuid}, Ptr{aws_uuid}), a, b)
end

mutable struct aws_xml_parser end

mutable struct aws_xml_node end

struct aws_xml_attribute
    name::aws_byte_cursor
    value::aws_byte_cursor
end

# typedef bool ( aws_xml_parser_on_node_encountered_fn ) ( struct aws_xml_parser * parser , struct aws_xml_node * node , void * user_data )
"""
Callback for when an xml node is encountered in the document. As a user you have a few options:

1. reject the document parsing at this point by returning false. This will immediately stop doc parsing. 2. call [`aws_xml_node_traverse`](@ref)() on the node to descend into the node with a new callback and user\\_data. 3. call [`aws_xml_node_as_body`](@ref)() to retrieve the contents of the node as text.

return true to continue the parsing operation.
"""
const aws_xml_parser_on_node_encountered_fn = Cvoid

struct aws_xml_parser_options
    doc::aws_byte_cursor
    max_depth::Csize_t
end

"""
    aws_xml_parser_new(allocator, options)

Allocates an xml parser.

### Prototype
```c
struct aws_xml_parser *aws_xml_parser_new( struct aws_allocator *allocator, const struct aws_xml_parser_options *options);
```
"""
function aws_xml_parser_new(allocator, options)
    ccall((:aws_xml_parser_new, libawscrt), Ptr{aws_xml_parser}, (Ptr{aws_allocator}, Ptr{aws_xml_parser_options}), allocator, options)
end

"""
    aws_xml_parser_destroy(parser)

### Prototype
```c
void aws_xml_parser_destroy(struct aws_xml_parser *parser);
```
"""
function aws_xml_parser_destroy(parser)
    ccall((:aws_xml_parser_destroy, libawscrt), Cvoid, (Ptr{aws_xml_parser},), parser)
end

"""
    aws_xml_parser_parse(parser, on_node_encountered, user_data)

Parse the doc until the end or until a callback rejects the document. on\\_node\\_encountered will be invoked when the root node is encountered.

### Prototype
```c
int aws_xml_parser_parse( struct aws_xml_parser *parser, aws_xml_parser_on_node_encountered_fn *on_node_encountered, void *user_data);
```
"""
function aws_xml_parser_parse(parser, on_node_encountered, user_data)
    ccall((:aws_xml_parser_parse, libawscrt), Cint, (Ptr{aws_xml_parser}, Ptr{Cvoid}, Ptr{Cvoid}), parser, on_node_encountered, user_data)
end

"""
    aws_xml_node_as_body(parser, node, out_body)

Writes the contents of the body of node into out\\_body. out\\_body is an output parameter in this case. Upon success, out\\_body will contain the body of the node.

### Prototype
```c
int aws_xml_node_as_body(struct aws_xml_parser *parser, struct aws_xml_node *node, struct aws_byte_cursor *out_body);
```
"""
function aws_xml_node_as_body(parser, node, out_body)
    ccall((:aws_xml_node_as_body, libawscrt), Cint, (Ptr{aws_xml_parser}, Ptr{aws_xml_node}, Ptr{aws_byte_cursor}), parser, node, out_body)
end

"""
    aws_xml_node_traverse(parser, node, on_node_encountered, user_data)

Traverse node and invoke on\\_node\\_encountered when a nested node is encountered.

### Prototype
```c
int aws_xml_node_traverse( struct aws_xml_parser *parser, struct aws_xml_node *node, aws_xml_parser_on_node_encountered_fn *on_node_encountered, void *user_data);
```
"""
function aws_xml_node_traverse(parser, node, on_node_encountered, user_data)
    ccall((:aws_xml_node_traverse, libawscrt), Cint, (Ptr{aws_xml_parser}, Ptr{aws_xml_node}, Ptr{Cvoid}, Ptr{Cvoid}), parser, node, on_node_encountered, user_data)
end

"""
    aws_xml_node_get_name(node, out_name)

### Prototype
```c
int aws_xml_node_get_name(const struct aws_xml_node *node, struct aws_byte_cursor *out_name);
```
"""
function aws_xml_node_get_name(node, out_name)
    ccall((:aws_xml_node_get_name, libawscrt), Cint, (Ptr{aws_xml_node}, Ptr{aws_byte_cursor}), node, out_name)
end

"""
    aws_xml_node_get_num_attributes(node)

### Prototype
```c
size_t aws_xml_node_get_num_attributes(const struct aws_xml_node *node);
```
"""
function aws_xml_node_get_num_attributes(node)
    ccall((:aws_xml_node_get_num_attributes, libawscrt), Csize_t, (Ptr{aws_xml_node},), node)
end

"""
    aws_xml_node_get_attribute(node, attribute_index, out_attribute)

### Prototype
```c
int aws_xml_node_get_attribute( const struct aws_xml_node *node, size_t attribute_index, struct aws_xml_attribute *out_attribute);
```
"""
function aws_xml_node_get_attribute(node, attribute_index, out_attribute)
    ccall((:aws_xml_node_get_attribute, libawscrt), Cint, (Ptr{aws_xml_node}, Csize_t, Ptr{aws_xml_attribute}), node, attribute_index, out_attribute)
end

"""
    aws_secure_zero(pBuf, bufsize)

Securely zeroes a memory buffer. This function will attempt to ensure that the compiler will not optimize away this zeroing operation.

### Prototype
```c
void aws_secure_zero(void *pBuf, size_t bufsize);
```
"""
function aws_secure_zero(pBuf, bufsize)
    ccall((:aws_secure_zero, libawscrt), Cvoid, (Ptr{Cvoid}, Csize_t), pBuf, bufsize)
end

@cenum aws_compression_error::UInt32 begin
    AWS_ERROR_COMPRESSION_UNKNOWN_SYMBOL = 3072
    AWS_ERROR_END_COMPRESSION_RANGE = 4095
end

"""
    aws_compression_library_init(alloc)

Initializes internal datastructures used by aws-c-compression. Must be called before using any functionality in aws-c-compression.

### Prototype
```c
void aws_compression_library_init(struct aws_allocator *alloc);
```
"""
function aws_compression_library_init(alloc)
    ccall((:aws_compression_library_init, libawscrt), Cvoid, (Ptr{aws_allocator},), alloc)
end

"""
    aws_compression_library_clean_up()

Clean up internal datastructures used by aws-c-compression. Must not be called until application is done using functionality in aws-c-compression.

### Prototype
```c
void aws_compression_library_clean_up(void);
```
"""
function aws_compression_library_clean_up()
    ccall((:aws_compression_library_clean_up, libawscrt), Cvoid, ())
end

"""
    aws_huffman_code

Represents an encoded code
"""
struct aws_huffman_code
    pattern::UInt32
    num_bits::UInt8
end

# typedef struct aws_huffman_code ( aws_huffman_symbol_encoder_fn ) ( uint8_t symbol , void * userdata )
"""
Function used to encode a single symbol to an [`aws_huffman_code`](@ref)

### Parameters
* `symbol`:\\[in\\] The symbol to encode
* `userdata`:\\[in\\] Optional userdata ([`aws_huffman_symbol_coder`](@ref).userdata)
### Returns
The code representing the symbol. If this symbol is not recognized, return a code with num\\_bits set to 0.
"""
const aws_huffman_symbol_encoder_fn = Cvoid

# typedef uint8_t ( aws_huffman_symbol_decoder_fn ) ( uint32_t bits , uint8_t * symbol , void * userdata )
"""
Function used to decode a code into a symbol

### Parameters
* `bits`:\\[in\\] The bits to attept to decode a symbol from
* `symbol`:\\[out\\] The symbol found. Do not write to if no valid symbol found
* `userdata`:\\[in\\] Optional userdata ([`aws_huffman_symbol_coder`](@ref).userdata)
### Returns
The number of bits read from bits
"""
const aws_huffman_symbol_decoder_fn = Cvoid

"""
    aws_huffman_symbol_coder

Structure used to define how symbols are encoded and decoded
"""
struct aws_huffman_symbol_coder
    encode::Ptr{Cvoid}
    decode::Ptr{Cvoid}
    userdata::Ptr{Cvoid}
end

"""
    aws_huffman_encoder

Structure used for persistent encoding. Allows for reading from or writing to incomplete buffers.
"""
struct aws_huffman_encoder
    coder::Ptr{aws_huffman_symbol_coder}
    eos_padding::UInt8
    overflow_bits::aws_huffman_code
end

"""
    aws_huffman_decoder

Structure used for persistent decoding. Allows for reading from or writing to incomplete buffers.
"""
struct aws_huffman_decoder
    coder::Ptr{aws_huffman_symbol_coder}
    allow_growth::Bool
    working_bits::UInt64
    num_bits::UInt8
end

"""
    aws_huffman_encoder_init(encoder, coder)

Initialize a encoder object with a symbol coder.

### Prototype
```c
void aws_huffman_encoder_init(struct aws_huffman_encoder *encoder, struct aws_huffman_symbol_coder *coder);
```
"""
function aws_huffman_encoder_init(encoder, coder)
    ccall((:aws_huffman_encoder_init, libawscrt), Cvoid, (Ptr{aws_huffman_encoder}, Ptr{aws_huffman_symbol_coder}), encoder, coder)
end

"""
    aws_huffman_encoder_reset(encoder)

Resets a decoder for use with a new binary stream

### Prototype
```c
void aws_huffman_encoder_reset(struct aws_huffman_encoder *encoder);
```
"""
function aws_huffman_encoder_reset(encoder)
    ccall((:aws_huffman_encoder_reset, libawscrt), Cvoid, (Ptr{aws_huffman_encoder},), encoder)
end

"""
    aws_huffman_decoder_init(decoder, coder)

Initialize a decoder object with a symbol coder.

### Prototype
```c
void aws_huffman_decoder_init(struct aws_huffman_decoder *decoder, struct aws_huffman_symbol_coder *coder);
```
"""
function aws_huffman_decoder_init(decoder, coder)
    ccall((:aws_huffman_decoder_init, libawscrt), Cvoid, (Ptr{aws_huffman_decoder}, Ptr{aws_huffman_symbol_coder}), decoder, coder)
end

"""
    aws_huffman_decoder_reset(decoder)

Resets a decoder for use with a new binary stream

### Prototype
```c
void aws_huffman_decoder_reset(struct aws_huffman_decoder *decoder);
```
"""
function aws_huffman_decoder_reset(decoder)
    ccall((:aws_huffman_decoder_reset, libawscrt), Cvoid, (Ptr{aws_huffman_decoder},), decoder)
end

"""
    aws_huffman_get_encoded_length(encoder, to_encode)

Get the byte length of to\\_encode post-encoding.

### Parameters
* `encoder`:\\[in\\] The encoder object to use
* `to_encode`:\\[in\\] The symbol buffer to encode
### Returns
The length of the encoded string.
### Prototype
```c
size_t aws_huffman_get_encoded_length(struct aws_huffman_encoder *encoder, struct aws_byte_cursor to_encode);
```
"""
function aws_huffman_get_encoded_length(encoder, to_encode)
    ccall((:aws_huffman_get_encoded_length, libawscrt), Csize_t, (Ptr{aws_huffman_encoder}, aws_byte_cursor), encoder, to_encode)
end

"""
    aws_huffman_encode(encoder, to_encode, output)

Encode a symbol buffer into the output buffer.

### Parameters
* `encoder`:\\[in\\] The encoder object to use
* `to_encode`:\\[in\\] The symbol buffer to encode
* `output`:\\[in\\] The buffer to write encoded bytes to
### Returns
[`AWS_OP_SUCCESS`](@ref) if encoding is successful, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_huffman_encode( struct aws_huffman_encoder *encoder, struct aws_byte_cursor *to_encode, struct aws_byte_buf *output);
```
"""
function aws_huffman_encode(encoder, to_encode, output)
    ccall((:aws_huffman_encode, libawscrt), Cint, (Ptr{aws_huffman_encoder}, Ptr{aws_byte_cursor}, Ptr{aws_byte_buf}), encoder, to_encode, output)
end

"""
    aws_huffman_decode(decoder, to_decode, output)

Decodes a byte buffer into the provided symbol array.

### Parameters
* `decoder`:\\[in\\] The decoder object to use
* `to_decode`:\\[in\\] The encoded byte buffer to read from
* `output`:\\[in\\] The buffer to write decoded symbols to. If decoder is set to allow growth, capacity will be increased when necessary.
### Returns
[`AWS_OP_SUCCESS`](@ref) if encoding is successful, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_huffman_decode( struct aws_huffman_decoder *decoder, struct aws_byte_cursor *to_decode, struct aws_byte_buf *output);
```
"""
function aws_huffman_decode(decoder, to_decode, output)
    ccall((:aws_huffman_decode, libawscrt), Cint, (Ptr{aws_huffman_decoder}, Ptr{aws_byte_cursor}, Ptr{aws_byte_buf}), decoder, to_decode, output)
end

"""
    aws_huffman_decoder_allow_growth(decoder, allow_growth)

Set whether or not to increase capacity when the output buffer fills up while decoding. This is false by default.

### Prototype
```c
void aws_huffman_decoder_allow_growth(struct aws_huffman_decoder *decoder, bool allow_growth);
```
"""
function aws_huffman_decoder_allow_growth(decoder, allow_growth)
    ccall((:aws_huffman_decoder_allow_growth, libawscrt), Cvoid, (Ptr{aws_huffman_decoder}, Bool), decoder, allow_growth)
end

# typedef void ( aws_http_on_client_connection_setup_fn ) ( struct aws_http_connection * connection , int error_code , void * user_data )
"""
Invoked when connect completes.

If unsuccessful, error\\_code will be set, connection will be NULL, and the on\\_shutdown callback will never be invoked.

If successful, error\\_code will be 0 and connection will be valid. The user is now responsible for the connection and must call [`aws_http_connection_release`](@ref)() when they are done with it.

The connection uses one event-loop thread to do all its work. The thread invoking this callback will be the same thread that invokes all future callbacks for this connection and its streams.
"""
const aws_http_on_client_connection_setup_fn = Cvoid

# typedef void ( aws_http_on_client_connection_shutdown_fn ) ( struct aws_http_connection * connection , int error_code , void * user_data )
"""
Invoked when the connection has finished shutting down. Never invoked if on\\_setup failed. This is always invoked on connection's event-loop thread. Note that the connection is not completely done until on\\_shutdown has been invoked AND [`aws_http_connection_release`](@ref)() has been called.
"""
const aws_http_on_client_connection_shutdown_fn = Cvoid

# typedef void ( aws_http2_on_change_settings_complete_fn ) ( struct aws_http_connection * http2_connection , int error_code , void * user_data )
"""
Invoked when the HTTP/2 settings change is complete. If connection setup successfully this will always be invoked whether settings change successfully or unsuccessfully. If error\\_code is AWS\\_ERROR\\_SUCCESS (0), then the peer has acknowledged the settings and the change has been applied. If error\\_code is non-zero, then a connection error occurred before the settings could be fully acknowledged and applied. This is always invoked on the connection's event-loop thread.
"""
const aws_http2_on_change_settings_complete_fn = Cvoid

# typedef void ( aws_http2_on_ping_complete_fn ) ( struct aws_http_connection * http2_connection , uint64_t round_trip_time_ns , int error_code , void * user_data )
"""
Invoked when the HTTP/2 PING completes, whether peer has acknowledged it or not. If error\\_code is AWS\\_ERROR\\_SUCCESS (0), then the peer has acknowledged the PING and round\\_trip\\_time\\_ns will be the round trip time in nano seconds for the connection. If error\\_code is non-zero, then a connection error occurred before the PING get acknowledgment and round\\_trip\\_time\\_ns will be useless in this case.
"""
const aws_http2_on_ping_complete_fn = Cvoid

# typedef void ( aws_http2_on_goaway_received_fn ) ( struct aws_http_connection * http2_connection , uint32_t last_stream_id , uint32_t http2_error_code , struct aws_byte_cursor debug_data , void * user_data )
"""
Invoked when an HTTP/2 GOAWAY frame is received from peer. Implies that the peer has initiated shutdown, or encountered a serious error. Once a GOAWAY is received, no further streams may be created on this connection.

### Parameters
* `http2_connection`: This HTTP/2 connection.
* `last_stream_id`: ID of the last locally-initiated stream that peer will process. Any locally-initiated streams with a higher ID are ignored by peer, and are safe to retry on another connection.
* `http2_error_code`: The HTTP/2 error code (RFC-7540 section 7) sent by peer. `enum [`aws_http2_error_code`](@ref)` lists official codes.
* `debug_data`: The debug data sent by peer. It can be empty. (NOTE: this data is only valid for the lifetime of the callback. Make a deep copy if you wish to keep it longer.)
* `user_data`: User-data passed to the callback.
"""
const aws_http2_on_goaway_received_fn = Cvoid

# typedef void ( aws_http2_on_remote_settings_change_fn ) ( struct aws_http_connection * http2_connection , const struct aws_http2_setting * settings_array , size_t num_settings , void * user_data )
"""
Invoked when new HTTP/2 settings from peer have been applied. Settings\\_array is the array of aws\\_http2\\_settings that contains all the settings we just changed in the order we applied (the order settings arrived). Num\\_settings is the number of elements in that array.
"""
const aws_http2_on_remote_settings_change_fn = Cvoid

# typedef void ( aws_http_statistics_observer_fn ) ( size_t connection_nonce , const struct aws_array_list * stats_list , void * user_data )
"""
Callback invoked on each statistics sample.

connection\\_nonce is unique to each connection for disambiguation of each callback per connection.
"""
const aws_http_statistics_observer_fn = Cvoid

"""
    aws_http_connection_monitoring_options

Configuration options for connection monitoring
"""
struct aws_http_connection_monitoring_options
    minimum_throughput_bytes_per_second::UInt64
    allowable_throughput_failure_interval_seconds::UInt32
    statistics_observer_fn::Ptr{Cvoid}
    statistics_observer_user_data::Ptr{Cvoid}
end

"""
    aws_http1_connection_options

Options specific to HTTP/1.x connections.
"""
struct aws_http1_connection_options
    read_buffer_capacity::Csize_t
end

@cenum aws_http2_settings_id::UInt32 begin
    AWS_HTTP2_SETTINGS_BEGIN_RANGE = 1
    AWS_HTTP2_SETTINGS_HEADER_TABLE_SIZE = 1
    AWS_HTTP2_SETTINGS_ENABLE_PUSH = 2
    AWS_HTTP2_SETTINGS_MAX_CONCURRENT_STREAMS = 3
    AWS_HTTP2_SETTINGS_INITIAL_WINDOW_SIZE = 4
    AWS_HTTP2_SETTINGS_MAX_FRAME_SIZE = 5
    AWS_HTTP2_SETTINGS_MAX_HEADER_LIST_SIZE = 6
    AWS_HTTP2_SETTINGS_END_RANGE = 7
end

struct aws_http2_setting
    id::aws_http2_settings_id
    value::UInt32
end

"""
    aws_http2_connection_options

Options specific to HTTP/2 connections.
"""
struct aws_http2_connection_options
    initial_settings_array::Ptr{aws_http2_setting}
    num_initial_settings::Csize_t
    on_initial_settings_completed::Ptr{Cvoid}
    max_closed_streams::Csize_t
    on_goaway_received::Ptr{Cvoid}
    on_remote_settings_change::Ptr{Cvoid}
    conn_manual_window_management::Bool
end

@cenum aws_socket_type::UInt32 begin
    AWS_SOCKET_STREAM = 0
    AWS_SOCKET_DGRAM = 1
end

@cenum aws_socket_domain::UInt32 begin
    AWS_SOCKET_IPV4 = 0
    AWS_SOCKET_IPV6 = 1
    AWS_SOCKET_LOCAL = 2
    AWS_SOCKET_VSOCK = 3
end

struct aws_socket_options
    type::aws_socket_type
    domain::aws_socket_domain
    connect_timeout_ms::UInt32
    keep_alive_interval_sec::UInt16
    keep_alive_timeout_sec::UInt16
    keep_alive_max_failed_probes::UInt16
    keepalive::Bool
end

@cenum aws_http_proxy_env_var_type::UInt32 begin
    AWS_HPEV_DISABLE = 0
    AWS_HPEV_ENABLE = 1
end

struct proxy_env_var_settings
    env_var_type::aws_http_proxy_env_var_type
    connection_type::aws_http_proxy_connection_type
    tls_options::Ptr{aws_tls_connection_options}
end

"""
    aws_http_client_connection_options

Options for creating an HTTP client connection. Initialize with [`AWS_HTTP_CLIENT_CONNECTION_OPTIONS_INIT`](@ref) to set default values.
"""
struct aws_http_client_connection_options
    self_size::Csize_t
    allocator::Ptr{aws_allocator}
    bootstrap::Ptr{aws_client_bootstrap}
    host_name::aws_byte_cursor
    port::UInt16
    socket_options::Ptr{aws_socket_options}
    tls_options::Ptr{aws_tls_connection_options}
    proxy_options::Ptr{aws_http_proxy_options}
    proxy_ev_settings::Ptr{proxy_env_var_settings}
    monitoring_options::Ptr{aws_http_connection_monitoring_options}
    manual_window_management::Bool
    initial_window_size::Csize_t
    user_data::Ptr{Cvoid}
    on_setup::Ptr{Cvoid}
    on_shutdown::Ptr{Cvoid}
    prior_knowledge_http2::Bool
    alpn_string_map::Ptr{aws_hash_table}
    http1_options::Ptr{aws_http1_connection_options}
    http2_options::Ptr{aws_http2_connection_options}
end

"""
    aws_http_client_connect(options)

Asynchronously establish a client connection. The on\\_setup callback is invoked when the operation has created a connection or failed.

### Prototype
```c
int aws_http_client_connect(const struct aws_http_client_connection_options *options);
```
"""
function aws_http_client_connect(options)
    ccall((:aws_http_client_connect, libawscrt), Cint, (Ptr{aws_http_client_connection_options},), options)
end

mutable struct aws_http_connection end

"""
    aws_http_connection_release(connection)

Users must release the connection when they are done with it. The connection's memory cannot be reclaimed until this is done. If the connection was not already shutting down, it will be shut down.

Users should always wait for the on\\_shutdown() callback to be called before releasing any data passed to the http\\_connection (Eg [`aws_tls_connection_options`](@ref), [`aws_socket_options`](@ref)) otherwise there will be race conditions between http\\_connection shutdown tasks and memory release tasks, causing Segfaults.

### Prototype
```c
void aws_http_connection_release(struct aws_http_connection *connection);
```
"""
function aws_http_connection_release(connection)
    ccall((:aws_http_connection_release, libawscrt), Cvoid, (Ptr{aws_http_connection},), connection)
end

"""
    aws_http_connection_close(connection)

Begin shutdown sequence of the connection if it hasn't already started. This will schedule shutdown tasks on the EventLoop that may send HTTP/TLS/TCP shutdown messages to peers if necessary, and will eventually cause internal connection memory to stop being accessed and on\\_shutdown() callback to be called.

It's safe to call this function regardless of the connection state as long as you hold a reference to the connection.

### Prototype
```c
void aws_http_connection_close(struct aws_http_connection *connection);
```
"""
function aws_http_connection_close(connection)
    ccall((:aws_http_connection_close, libawscrt), Cvoid, (Ptr{aws_http_connection},), connection)
end

"""
    aws_http_connection_is_open(connection)

Returns true unless the connection is closed or closing.

### Prototype
```c
bool aws_http_connection_is_open(const struct aws_http_connection *connection);
```
"""
function aws_http_connection_is_open(connection)
    ccall((:aws_http_connection_is_open, libawscrt), Bool, (Ptr{aws_http_connection},), connection)
end

"""
    aws_http_connection_new_requests_allowed(connection)

Return whether the connection can make a new requests. If false, then a new connection must be established to make further requests.

### Prototype
```c
bool aws_http_connection_new_requests_allowed(const struct aws_http_connection *connection);
```
"""
function aws_http_connection_new_requests_allowed(connection)
    ccall((:aws_http_connection_new_requests_allowed, libawscrt), Bool, (Ptr{aws_http_connection},), connection)
end

"""
    aws_http_connection_is_client(connection)

Returns true if this is a client connection.

### Prototype
```c
bool aws_http_connection_is_client(const struct aws_http_connection *connection);
```
"""
function aws_http_connection_is_client(connection)
    ccall((:aws_http_connection_is_client, libawscrt), Bool, (Ptr{aws_http_connection},), connection)
end

@cenum aws_http_version::UInt32 begin
    AWS_HTTP_VERSION_UNKNOWN = 0
    AWS_HTTP_VERSION_1_0 = 1
    AWS_HTTP_VERSION_1_1 = 2
    AWS_HTTP_VERSION_2 = 3
    AWS_HTTP_VERSION_COUNT = 4
end

"""
    aws_http_connection_get_version(connection)

### Prototype
```c
enum aws_http_version aws_http_connection_get_version(const struct aws_http_connection *connection);
```
"""
function aws_http_connection_get_version(connection)
    ccall((:aws_http_connection_get_version, libawscrt), aws_http_version, (Ptr{aws_http_connection},), connection)
end

mutable struct aws_channel end

"""
    aws_http_connection_get_channel(connection)

Returns the channel hosting the HTTP connection. Do not expose this function to language bindings.

### Prototype
```c
struct aws_channel *aws_http_connection_get_channel(struct aws_http_connection *connection);
```
"""
function aws_http_connection_get_channel(connection)
    ccall((:aws_http_connection_get_channel, libawscrt), Ptr{aws_channel}, (Ptr{aws_http_connection},), connection)
end

"""
    aws_http_alpn_map_init_copy(allocator, dest, src)

Initialize an map copied from the *src map, which maps `struct [`aws_string`](@ref) *` to `enum [`aws_http_version`](@ref)`.

### Prototype
```c
int aws_http_alpn_map_init_copy( struct aws_allocator *allocator, struct aws_hash_table *dest, struct aws_hash_table *src);
```
"""
function aws_http_alpn_map_init_copy(allocator, dest, src)
    ccall((:aws_http_alpn_map_init_copy, libawscrt), Cint, (Ptr{aws_allocator}, Ptr{aws_hash_table}, Ptr{aws_hash_table}), allocator, dest, src)
end

"""
    aws_http_alpn_map_init(allocator, map)

Initialize an empty hash-table that maps `struct [`aws_string`](@ref) *` to `enum [`aws_http_version`](@ref)`. This map can used in aws\\_http\\_client\\_connections\\_options.alpn\\_string\\_map.

### Prototype
```c
int aws_http_alpn_map_init(struct aws_allocator *allocator, struct aws_hash_table *map);
```
"""
function aws_http_alpn_map_init(allocator, map)
    ccall((:aws_http_alpn_map_init, libawscrt), Cint, (Ptr{aws_allocator}, Ptr{aws_hash_table}), allocator, map)
end

"""
    aws_http_options_validate_proxy_configuration(options)

Checks http proxy options for correctness

### Prototype
```c
int aws_http_options_validate_proxy_configuration(const struct aws_http_client_connection_options *options);
```
"""
function aws_http_options_validate_proxy_configuration(options)
    ccall((:aws_http_options_validate_proxy_configuration, libawscrt), Cint, (Ptr{aws_http_client_connection_options},), options)
end

"""
    aws_http2_connection_change_settings(http2_connection, settings_array, num_settings, on_completed, user_data)

Send a SETTINGS frame (HTTP/2 only). SETTINGS will be applied locally when SETTINGS ACK is received from peer.

### Parameters
* `http2_connection`: HTTP/2 connection.
* `settings_array`: The array of settings to change. Note: each setting has its boundary.
* `num_settings`: The num of settings to change in settings\\_array.
* `on_completed`: Optional callback, see [`aws_http2_on_change_settings_complete_fn`](@ref).
* `user_data`: User-data pass to on\\_completed callback.
### Prototype
```c
int aws_http2_connection_change_settings( struct aws_http_connection *http2_connection, const struct aws_http2_setting *settings_array, size_t num_settings, aws_http2_on_change_settings_complete_fn *on_completed, void *user_data);
```
"""
function aws_http2_connection_change_settings(http2_connection, settings_array, num_settings, on_completed, user_data)
    ccall((:aws_http2_connection_change_settings, libawscrt), Cint, (Ptr{aws_http_connection}, Ptr{aws_http2_setting}, Csize_t, Ptr{Cvoid}, Ptr{Cvoid}), http2_connection, settings_array, num_settings, on_completed, user_data)
end

"""
    aws_http2_connection_ping(http2_connection, optional_opaque_data, on_completed, user_data)

Send a PING frame (HTTP/2 only). Round-trip-time is calculated when PING ACK is received from peer.

### Parameters
* `http2_connection`: HTTP/2 connection.
* `optional_opaque_data`: Optional payload for PING frame. Must be NULL, or exactly 8 bytes ([`AWS_HTTP2_PING_DATA_SIZE`](@ref)). If NULL, the 8 byte payload will be all zeroes.
* `on_completed`: Optional callback, invoked when PING ACK is received from peer, or when a connection error prevents the PING ACK from being received. Callback always fires on the connection's event-loop thread.
* `user_data`: User-data pass to on\\_completed callback.
### Prototype
```c
int aws_http2_connection_ping( struct aws_http_connection *http2_connection, const struct aws_byte_cursor *optional_opaque_data, aws_http2_on_ping_complete_fn *on_completed, void *user_data);
```
"""
function aws_http2_connection_ping(http2_connection, optional_opaque_data, on_completed, user_data)
    ccall((:aws_http2_connection_ping, libawscrt), Cint, (Ptr{aws_http_connection}, Ptr{aws_byte_cursor}, Ptr{Cvoid}, Ptr{Cvoid}), http2_connection, optional_opaque_data, on_completed, user_data)
end

"""
    aws_http2_connection_get_local_settings(http2_connection, out_settings)

Get the local settings we are using to affect the decoding.

### Parameters
* `http2_connection`: HTTP/2 connection.
* `out_settings`: fixed size array of [`aws_http2_setting`](@ref) gets set to the local settings
### Prototype
```c
void aws_http2_connection_get_local_settings( const struct aws_http_connection *http2_connection, struct aws_http2_setting out_settings[AWS_HTTP2_SETTINGS_COUNT]);
```
"""
function aws_http2_connection_get_local_settings(http2_connection, out_settings)
    ccall((:aws_http2_connection_get_local_settings, libawscrt), Cvoid, (Ptr{aws_http_connection}, Ptr{aws_http2_setting}), http2_connection, out_settings)
end

"""
    aws_http2_connection_get_remote_settings(http2_connection, out_settings)

Get the settings received from remote peer, which we are using to restricts the message to send.

### Parameters
* `http2_connection`: HTTP/2 connection.
* `out_settings`: fixed size array of [`aws_http2_setting`](@ref) gets set to the remote settings
### Prototype
```c
void aws_http2_connection_get_remote_settings( const struct aws_http_connection *http2_connection, struct aws_http2_setting out_settings[AWS_HTTP2_SETTINGS_COUNT]);
```
"""
function aws_http2_connection_get_remote_settings(http2_connection, out_settings)
    ccall((:aws_http2_connection_get_remote_settings, libawscrt), Cvoid, (Ptr{aws_http_connection}, Ptr{aws_http2_setting}), http2_connection, out_settings)
end

"""
    aws_http2_connection_send_goaway(http2_connection, http2_error, allow_more_streams, optional_debug_data)

Send a custom GOAWAY frame (HTTP/2 only).

Note that the connection automatically attempts to send a GOAWAY during shutdown (unless a GOAWAY with a valid Last-Stream-ID has already been sent).

This call can be used to gracefully warn the peer of an impending shutdown (http2\\_error=0, allow\\_more\\_streams=true), or to customize the final GOAWAY frame that is sent by this connection.

The other end may not receive the goaway, if the connection already closed.

### Parameters
* `http2_connection`: HTTP/2 connection.
* `http2_error`: The HTTP/2 error code (RFC-7540 section 7) to send. `enum [`aws_http2_error_code`](@ref)` lists official codes.
* `allow_more_streams`: If true, new peer-initiated streams will continue to be acknowledged and the GOAWAY's Last-Stream-ID will be set to a max value. If false, new peer-initiated streams will be ignored and the GOAWAY's Last-Stream-ID will be set to the latest acknowledged stream.
* `optional_debug_data`: Optional debug data to send. Size must not exceed 16KB.
### Prototype
```c
int aws_http2_connection_send_goaway( struct aws_http_connection *http2_connection, uint32_t http2_error, bool allow_more_streams, const struct aws_byte_cursor *optional_debug_data);
```
"""
function aws_http2_connection_send_goaway(http2_connection, http2_error, allow_more_streams, optional_debug_data)
    ccall((:aws_http2_connection_send_goaway, libawscrt), Cint, (Ptr{aws_http_connection}, UInt32, Bool, Ptr{aws_byte_cursor}), http2_connection, http2_error, allow_more_streams, optional_debug_data)
end

"""
    aws_http2_connection_get_sent_goaway(http2_connection, out_http2_error, out_last_stream_id)

Get data about the latest GOAWAY frame sent to peer (HTTP/2 only). If no GOAWAY has been sent, AWS\\_ERROR\\_HTTP\\_DATA\\_NOT\\_AVAILABLE will be raised. Note that GOAWAY frames are typically sent automatically by the connection during shutdown.

### Parameters
* `http2_connection`: HTTP/2 connection.
* `out_http2_error`: Gets set to HTTP/2 error code sent in most recent GOAWAY.
* `out_last_stream_id`: Gets set to Last-Stream-ID sent in most recent GOAWAY.
### Prototype
```c
int aws_http2_connection_get_sent_goaway( struct aws_http_connection *http2_connection, uint32_t *out_http2_error, uint32_t *out_last_stream_id);
```
"""
function aws_http2_connection_get_sent_goaway(http2_connection, out_http2_error, out_last_stream_id)
    ccall((:aws_http2_connection_get_sent_goaway, libawscrt), Cint, (Ptr{aws_http_connection}, Ptr{UInt32}, Ptr{UInt32}), http2_connection, out_http2_error, out_last_stream_id)
end

"""
    aws_http2_connection_get_received_goaway(http2_connection, out_http2_error, out_last_stream_id)

Get data about the latest GOAWAY frame received from peer (HTTP/2 only). If no GOAWAY has been received, or the GOAWAY payload is still in transmitting, AWS\\_ERROR\\_HTTP\\_DATA\\_NOT\\_AVAILABLE will be raised.

### Parameters
* `http2_connection`: HTTP/2 connection.
* `out_http2_error`: Gets set to HTTP/2 error code received in most recent GOAWAY.
* `out_last_stream_id`: Gets set to Last-Stream-ID received in most recent GOAWAY.
### Prototype
```c
int aws_http2_connection_get_received_goaway( struct aws_http_connection *http2_connection, uint32_t *out_http2_error, uint32_t *out_last_stream_id);
```
"""
function aws_http2_connection_get_received_goaway(http2_connection, out_http2_error, out_last_stream_id)
    ccall((:aws_http2_connection_get_received_goaway, libawscrt), Cint, (Ptr{aws_http_connection}, Ptr{UInt32}, Ptr{UInt32}), http2_connection, out_http2_error, out_last_stream_id)
end

"""
    aws_http2_connection_update_window(http2_connection, increment_size)

Increment the connection's flow-control window to keep data flowing (HTTP/2 only).

If the connection was created with `conn_manual_window_management` set true, the flow-control window of the connection will shrink as body data is received for all the streams created on it. (headers, padding, and other metadata do not affect the window). The initial connection flow-control window is 65,535. Once the connection's flow-control window reaches to 0, all the streams on the connection stop receiving any further data.

If `conn_manual_window_management` is false, this call will have no effect. The connection maintains its flow-control windows such that no back-pressure is applied and data arrives as fast as possible.

If you are not connected, this call will have no effect.

Crashes when the connection is not http2 connection. The limit of the Maximum Size is 2**31 - 1. If the increment size cause the connection flow window exceeds the Maximum size, this call will result in the connection lost.

### Parameters
* `http2_connection`: HTTP/2 connection.
* `increment_size`: The size to increment for the connection's flow control window
### Prototype
```c
void aws_http2_connection_update_window(struct aws_http_connection *http2_connection, uint32_t increment_size);
```
"""
function aws_http2_connection_update_window(http2_connection, increment_size)
    ccall((:aws_http2_connection_update_window, libawscrt), Cvoid, (Ptr{aws_http_connection}, UInt32), http2_connection, increment_size)
end

mutable struct aws_http_connection_manager end

# typedef void ( aws_http_connection_manager_on_connection_setup_fn ) ( struct aws_http_connection * connection , int error_code , void * user_data )
const aws_http_connection_manager_on_connection_setup_fn = Cvoid

# typedef void ( aws_http_connection_manager_shutdown_complete_fn ) ( void * user_data )
const aws_http_connection_manager_shutdown_complete_fn = Cvoid

struct aws_http_connection_manager_options
    bootstrap::Ptr{aws_client_bootstrap}
    initial_window_size::Csize_t
    socket_options::Ptr{aws_socket_options}
    tls_connection_options::Ptr{aws_tls_connection_options}
    monitoring_options::Ptr{aws_http_connection_monitoring_options}
    host::aws_byte_cursor
    port::UInt16
    prior_knowledge_http2::Bool
    initial_settings_array::Ptr{aws_http2_setting}
    num_initial_settings::Csize_t
    max_closed_streams::Csize_t
    http2_conn_manual_window_management::Bool
    proxy_options::Ptr{aws_http_proxy_options}
    proxy_ev_settings::Ptr{proxy_env_var_settings}
    max_connections::Csize_t
    shutdown_complete_user_data::Ptr{Cvoid}
    shutdown_complete_callback::Ptr{Cvoid}
    enable_read_back_pressure::Bool
    max_connection_idle_in_milliseconds::UInt64
end

"""
    aws_http_connection_manager_acquire(manager)

### Prototype
```c
void aws_http_connection_manager_acquire(struct aws_http_connection_manager *manager);
```
"""
function aws_http_connection_manager_acquire(manager)
    ccall((:aws_http_connection_manager_acquire, libawscrt), Cvoid, (Ptr{aws_http_connection_manager},), manager)
end

"""
    aws_http_connection_manager_release(manager)

### Prototype
```c
void aws_http_connection_manager_release(struct aws_http_connection_manager *manager);
```
"""
function aws_http_connection_manager_release(manager)
    ccall((:aws_http_connection_manager_release, libawscrt), Cvoid, (Ptr{aws_http_connection_manager},), manager)
end

"""
    aws_http_connection_manager_new(allocator, options)

### Prototype
```c
struct aws_http_connection_manager *aws_http_connection_manager_new( struct aws_allocator *allocator, struct aws_http_connection_manager_options *options);
```
"""
function aws_http_connection_manager_new(allocator, options)
    ccall((:aws_http_connection_manager_new, libawscrt), Ptr{aws_http_connection_manager}, (Ptr{aws_allocator}, Ptr{aws_http_connection_manager_options}), allocator, options)
end

"""
    aws_http_connection_manager_acquire_connection(manager, callback, user_data)

### Prototype
```c
void aws_http_connection_manager_acquire_connection( struct aws_http_connection_manager *manager, aws_http_connection_manager_on_connection_setup_fn *callback, void *user_data);
```
"""
function aws_http_connection_manager_acquire_connection(manager, callback, user_data)
    ccall((:aws_http_connection_manager_acquire_connection, libawscrt), Cvoid, (Ptr{aws_http_connection_manager}, Ptr{Cvoid}, Ptr{Cvoid}), manager, callback, user_data)
end

"""
    aws_http_connection_manager_release_connection(manager, connection)

### Prototype
```c
int aws_http_connection_manager_release_connection( struct aws_http_connection_manager *manager, struct aws_http_connection *connection);
```
"""
function aws_http_connection_manager_release_connection(manager, connection)
    ccall((:aws_http_connection_manager_release_connection, libawscrt), Cint, (Ptr{aws_http_connection_manager}, Ptr{aws_http_connection}), manager, connection)
end

@cenum aws_http_errors::UInt32 begin
    AWS_ERROR_HTTP_UNKNOWN = 2048
    AWS_ERROR_HTTP_HEADER_NOT_FOUND = 2049
    AWS_ERROR_HTTP_INVALID_HEADER_FIELD = 2050
    AWS_ERROR_HTTP_INVALID_HEADER_NAME = 2051
    AWS_ERROR_HTTP_INVALID_HEADER_VALUE = 2052
    AWS_ERROR_HTTP_INVALID_METHOD = 2053
    AWS_ERROR_HTTP_INVALID_PATH = 2054
    AWS_ERROR_HTTP_INVALID_STATUS_CODE = 2055
    AWS_ERROR_HTTP_MISSING_BODY_STREAM = 2056
    AWS_ERROR_HTTP_INVALID_BODY_STREAM = 2057
    AWS_ERROR_HTTP_CONNECTION_CLOSED = 2058
    AWS_ERROR_HTTP_SWITCHED_PROTOCOLS = 2059
    AWS_ERROR_HTTP_UNSUPPORTED_PROTOCOL = 2060
    AWS_ERROR_HTTP_REACTION_REQUIRED = 2061
    AWS_ERROR_HTTP_DATA_NOT_AVAILABLE = 2062
    AWS_ERROR_HTTP_OUTGOING_STREAM_LENGTH_INCORRECT = 2063
    AWS_ERROR_HTTP_CALLBACK_FAILURE = 2064
    AWS_ERROR_HTTP_WEBSOCKET_UPGRADE_FAILURE = 2065
    AWS_ERROR_HTTP_WEBSOCKET_CLOSE_FRAME_SENT = 2066
    AWS_ERROR_HTTP_WEBSOCKET_IS_MIDCHANNEL_HANDLER = 2067
    AWS_ERROR_HTTP_CONNECTION_MANAGER_INVALID_STATE_FOR_ACQUIRE = 2068
    AWS_ERROR_HTTP_CONNECTION_MANAGER_VENDED_CONNECTION_UNDERFLOW = 2069
    AWS_ERROR_HTTP_SERVER_CLOSED = 2070
    AWS_ERROR_HTTP_PROXY_CONNECT_FAILED = 2071
    AWS_ERROR_HTTP_CONNECTION_MANAGER_SHUTTING_DOWN = 2072
    AWS_ERROR_HTTP_CHANNEL_THROUGHPUT_FAILURE = 2073
    AWS_ERROR_HTTP_PROTOCOL_ERROR = 2074
    AWS_ERROR_HTTP_STREAM_IDS_EXHAUSTED = 2075
    AWS_ERROR_HTTP_GOAWAY_RECEIVED = 2076
    AWS_ERROR_HTTP_RST_STREAM_RECEIVED = 2077
    AWS_ERROR_HTTP_RST_STREAM_SENT = 2078
    AWS_ERROR_HTTP_STREAM_NOT_ACTIVATED = 2079
    AWS_ERROR_HTTP_STREAM_HAS_COMPLETED = 2080
    AWS_ERROR_HTTP_PROXY_STRATEGY_NTLM_CHALLENGE_TOKEN_MISSING = 2081
    AWS_ERROR_HTTP_PROXY_STRATEGY_TOKEN_RETRIEVAL_FAILURE = 2082
    AWS_ERROR_HTTP_PROXY_CONNECT_FAILED_RETRYABLE = 2083
    AWS_ERROR_HTTP_PROTOCOL_SWITCH_FAILURE = 2084
    AWS_ERROR_HTTP_MAX_CONCURRENT_STREAMS_EXCEEDED = 2085
    AWS_ERROR_HTTP_STREAM_MANAGER_SHUTTING_DOWN = 2086
    AWS_ERROR_HTTP_STREAM_MANAGER_CONNECTION_ACQUIRE_FAILURE = 2087
    AWS_ERROR_HTTP_STREAM_MANAGER_UNEXPECTED_HTTP_VERSION = 2088
    AWS_ERROR_HTTP_END_RANGE = 3071
end

@cenum aws_http2_error_code::UInt32 begin
    AWS_HTTP2_ERR_NO_ERROR = 0
    AWS_HTTP2_ERR_PROTOCOL_ERROR = 1
    AWS_HTTP2_ERR_INTERNAL_ERROR = 2
    AWS_HTTP2_ERR_FLOW_CONTROL_ERROR = 3
    AWS_HTTP2_ERR_SETTINGS_TIMEOUT = 4
    AWS_HTTP2_ERR_STREAM_CLOSED = 5
    AWS_HTTP2_ERR_FRAME_SIZE_ERROR = 6
    AWS_HTTP2_ERR_REFUSED_STREAM = 7
    AWS_HTTP2_ERR_CANCEL = 8
    AWS_HTTP2_ERR_COMPRESSION_ERROR = 9
    AWS_HTTP2_ERR_CONNECT_ERROR = 10
    AWS_HTTP2_ERR_ENHANCE_YOUR_CALM = 11
    AWS_HTTP2_ERR_INADEQUATE_SECURITY = 12
    AWS_HTTP2_ERR_HTTP_1_1_REQUIRED = 13
    AWS_HTTP2_ERR_COUNT = 14
end

@cenum aws_http_log_subject::UInt32 begin
    AWS_LS_HTTP_GENERAL = 2048
    AWS_LS_HTTP_CONNECTION = 2049
    AWS_LS_HTTP_ENCODER = 2050
    AWS_LS_HTTP_DECODER = 2051
    AWS_LS_HTTP_SERVER = 2052
    AWS_LS_HTTP_STREAM = 2053
    AWS_LS_HTTP_CONNECTION_MANAGER = 2054
    AWS_LS_HTTP_STREAM_MANAGER = 2055
    AWS_LS_HTTP_WEBSOCKET = 2056
    AWS_LS_HTTP_WEBSOCKET_SETUP = 2057
    AWS_LS_HTTP_PROXY_NEGOTIATION = 2058
end

"""
    aws_http_library_init(alloc)

Initializes internal datastructures used by aws-c-http. Must be called before using any functionality in aws-c-http.

### Prototype
```c
void aws_http_library_init(struct aws_allocator *alloc);
```
"""
function aws_http_library_init(alloc)
    ccall((:aws_http_library_init, libawscrt), Cvoid, (Ptr{aws_allocator},), alloc)
end

"""
    aws_http_library_clean_up()

Clean up internal datastructures used by aws-c-http. Must not be called until application is done using functionality in aws-c-http.

### Prototype
```c
void aws_http_library_clean_up(void);
```
"""
function aws_http_library_clean_up()
    ccall((:aws_http_library_clean_up, libawscrt), Cvoid, ())
end

"""
    aws_http_status_text(status_code)

Returns the description of common status codes. Ex: 404 -> "Not Found" An empty string is returned if the status code is not recognized.

### Prototype
```c
const char *aws_http_status_text(int status_code);
```
"""
function aws_http_status_text(status_code)
    ccall((:aws_http_status_text, libawscrt), Ptr{Cchar}, (Cint,), status_code)
end

mutable struct aws_http2_stream_manager end

mutable struct aws_http_stream end

# typedef void ( aws_http2_stream_manager_on_stream_acquired_fn ) ( struct aws_http_stream * stream , int error_code , void * user_data )
"""
Always invoked asynchronously when the stream was created, successfully or not. When stream is NULL, error code will be set to indicate what happened. If there is a stream returned, you own the stream completely. Invoked on the same thread as other callback of the stream, which will be the thread of the connection, ideally. If there is no connection made, the callback will be invoked from a sperate thread.
"""
const aws_http2_stream_manager_on_stream_acquired_fn = Cvoid

# typedef void ( aws_http2_stream_manager_shutdown_complete_fn ) ( void * user_data )
"""
Invoked asynchronously when the stream manager has been shutdown completely. Never invoked when [`aws_http2_stream_manager_new`](@ref) failed.
"""
const aws_http2_stream_manager_shutdown_complete_fn = Cvoid

"""
    aws_http2_stream_manager_options

HTTP/2 stream manager configuration struct.

Contains all of the configuration needed to create an http2 connection as well as connection manager under the hood.
"""
struct aws_http2_stream_manager_options
    bootstrap::Ptr{aws_client_bootstrap}
    socket_options::Ptr{aws_socket_options}
    tls_connection_options::Ptr{aws_tls_connection_options}
    host::aws_byte_cursor
    port::UInt16
    enable_read_back_pressure::Bool
    initial_window_size::UInt32
    monitoring_options::Ptr{aws_http_connection_monitoring_options}
    proxy_options::Ptr{aws_http_proxy_options}
    proxy_ev_settings::Ptr{proxy_env_var_settings}
    shutdown_complete_user_data::Ptr{Cvoid}
    shutdown_complete_callback::Ptr{Cvoid}
    ideal_concurrent_streams_per_connection::Csize_t
    max_concurrent_streams_per_connection::Csize_t
    max_connections::Csize_t
end

"""
    aws_http_make_request_options

Options for creating a stream which sends a request from the client and receives a response from the server.
"""
struct aws_http_make_request_options
    self_size::Csize_t
    request::Ptr{aws_http_message}
    user_data::Ptr{Cvoid}
    on_response_headers::Ptr{Cvoid}
    on_response_header_block_done::Ptr{Cvoid}
    on_response_body::Ptr{Cvoid}
    on_complete::Ptr{Cvoid}
end

struct aws_http2_stream_manager_acquire_stream_options
    callback::Ptr{Cvoid}
    user_data::Ptr{Cvoid}
    options::Ptr{aws_http_make_request_options}
end

"""
    aws_http2_stream_manager_acquire(manager)

Acquire a refcount from the stream manager, stream manager will start to destroy after the refcount drops to zero. NULL is acceptable. Initial refcount after new is 1.

### Parameters
* `manager`:
### Returns
The same pointer acquiring.
### Prototype
```c
struct aws_http2_stream_manager *aws_http2_stream_manager_acquire(struct aws_http2_stream_manager *manager);
```
"""
function aws_http2_stream_manager_acquire(manager)
    ccall((:aws_http2_stream_manager_acquire, libawscrt), Ptr{aws_http2_stream_manager}, (Ptr{aws_http2_stream_manager},), manager)
end

"""
    aws_http2_stream_manager_release(manager)

Release a refcount from the stream manager, stream manager will start to destroy after the refcount drops to zero. NULL is acceptable. Initial refcount after new is 1.

### Parameters
* `manager`:
### Returns
NULL
### Prototype
```c
struct aws_http2_stream_manager *aws_http2_stream_manager_release(struct aws_http2_stream_manager *manager);
```
"""
function aws_http2_stream_manager_release(manager)
    ccall((:aws_http2_stream_manager_release, libawscrt), Ptr{aws_http2_stream_manager}, (Ptr{aws_http2_stream_manager},), manager)
end

"""
    aws_http2_stream_manager_new(allocator, options)

### Prototype
```c
struct aws_http2_stream_manager *aws_http2_stream_manager_new( struct aws_allocator *allocator, struct aws_http2_stream_manager_options *options);
```
"""
function aws_http2_stream_manager_new(allocator, options)
    ccall((:aws_http2_stream_manager_new, libawscrt), Ptr{aws_http2_stream_manager}, (Ptr{aws_allocator}, Ptr{aws_http2_stream_manager_options}), allocator, options)
end

"""
    aws_http2_stream_manager_acquire_stream(http2_stream_manager, acquire_stream_option)

Acquire a stream from stream manager asynchronously.

### Parameters
* `http2_stream_manager`:
* `acquire_stream_option`: see [`aws_http2_stream_manager_acquire_stream_options`](@ref)
### Prototype
```c
void aws_http2_stream_manager_acquire_stream( struct aws_http2_stream_manager *http2_stream_manager, const struct aws_http2_stream_manager_acquire_stream_options *acquire_stream_option);
```
"""
function aws_http2_stream_manager_acquire_stream(http2_stream_manager, acquire_stream_option)
    ccall((:aws_http2_stream_manager_acquire_stream, libawscrt), Cvoid, (Ptr{aws_http2_stream_manager}, Ptr{aws_http2_stream_manager_acquire_stream_options}), http2_stream_manager, acquire_stream_option)
end

mutable struct aws_http_proxy_config end

# typedef struct aws_string * ( aws_http_proxy_negotiation_get_token_sync_fn ) ( void * user_data , int * out_error_code )
"""
Synchronous (for now) callback function to fetch a token used in modifying CONNECT requests
"""
const aws_http_proxy_negotiation_get_token_sync_fn = Cvoid

# typedef struct aws_string * ( aws_http_proxy_negotiation_get_challenge_token_sync_fn ) ( void * user_data , const struct aws_byte_cursor * challenge_context , int * out_error_code )
"""
Synchronous (for now) callback function to fetch a token used in modifying CONNECT request. Includes a (byte string) context intended to be used as part of a challenge-response flow.
"""
const aws_http_proxy_negotiation_get_challenge_token_sync_fn = Cvoid

# typedef void ( aws_http_proxy_negotiation_terminate_fn ) ( struct aws_http_message * message , int error_code , void * internal_proxy_user_data )
"""
Proxy negotiation logic must call this function to indicate an unsuccessful outcome
"""
const aws_http_proxy_negotiation_terminate_fn = Cvoid

# typedef void ( aws_http_proxy_negotiation_http_request_forward_fn ) ( struct aws_http_message * message , void * internal_proxy_user_data )
"""
Proxy negotiation logic must call this function to forward the potentially-mutated request back to the proxy connection logic.
"""
const aws_http_proxy_negotiation_http_request_forward_fn = Cvoid

# typedef void ( aws_http_proxy_negotiation_http_request_transform_async_fn ) ( struct aws_http_proxy_negotiator * proxy_negotiator , struct aws_http_message * message , aws_http_proxy_negotiation_terminate_fn * negotiation_termination_callback , aws_http_proxy_negotiation_http_request_forward_fn * negotiation_http_request_forward_callback , void * internal_proxy_user_data )
"""
User-supplied transform callback which implements the proxy request flow and ultimately, across all execution pathways, invokes either the terminate function or the forward function appropriately.

For tunneling proxy connections, this request flow transform only applies to the CONNECT stage of proxy connection establishment.

For forwarding proxy connections, this request flow transform applies to every single http request that goes out on the connection.

Forwarding proxy connections cannot yet support a truly async request transform without major surgery on http stream creation, so for now, we split into an async version (for tunneling proxies) and a separate synchronous version for forwarding proxies. Also forwarding proxies are a kind of legacy dead-end in some sense.
"""
const aws_http_proxy_negotiation_http_request_transform_async_fn = Cvoid

# typedef int ( aws_http_proxy_negotiation_http_request_transform_fn ) ( struct aws_http_proxy_negotiator * proxy_negotiator , struct aws_http_message * message )
const aws_http_proxy_negotiation_http_request_transform_fn = Cvoid

# typedef int ( aws_http_proxy_negotiation_connect_on_incoming_headers_fn ) ( struct aws_http_proxy_negotiator * proxy_negotiator , enum aws_http_header_block header_block , const struct aws_http_header * header_array , size_t num_headers )
"""
Tunneling proxy connections only. A callback that lets the negotiator examine the headers in the response to the most recent CONNECT request as they arrive.
"""
const aws_http_proxy_negotiation_connect_on_incoming_headers_fn = Cvoid

# typedef int ( aws_http_proxy_negotiator_connect_status_fn ) ( struct aws_http_proxy_negotiator * proxy_negotiator , enum aws_http_status_code status_code )
"""
Tunneling proxy connections only. A callback that lets the negotiator examine the status code of the response to the most recent CONNECT request.
"""
const aws_http_proxy_negotiator_connect_status_fn = Cvoid

# typedef int ( aws_http_proxy_negotiator_connect_on_incoming_body_fn ) ( struct aws_http_proxy_negotiator * proxy_negotiator , const struct aws_byte_cursor * data )
"""
Tunneling proxy connections only. A callback that lets the negotiator examine the body of the response to the most recent CONNECT request.
"""
const aws_http_proxy_negotiator_connect_on_incoming_body_fn = Cvoid

@cenum aws_http_proxy_negotiation_retry_directive::UInt32 begin
    AWS_HPNRD_STOP = 0
    AWS_HPNRD_NEW_CONNECTION = 1
    AWS_HPNRD_CURRENT_CONNECTION = 2
end

# typedef enum aws_http_proxy_negotiation_retry_directive ( aws_http_proxy_negotiator_get_retry_directive_fn ) ( struct aws_http_proxy_negotiator * proxy_negotiator )
const aws_http_proxy_negotiator_get_retry_directive_fn = Cvoid

"""
    aws_http_proxy_negotiator_forwarding_vtable

Vtable for forwarding-based proxy negotiators
"""
struct aws_http_proxy_negotiator_forwarding_vtable
    forward_request_transform::Ptr{Cvoid}
end

"""
    aws_http_proxy_negotiator_tunnelling_vtable

Vtable for tunneling-based proxy negotiators
"""
struct aws_http_proxy_negotiator_tunnelling_vtable
    connect_request_transform::Ptr{Cvoid}
    on_incoming_headers_callback::Ptr{Cvoid}
    on_status_callback::Ptr{Cvoid}
    on_incoming_body_callback::Ptr{Cvoid}
    get_retry_directive::Ptr{Cvoid}
end

struct var"##Ctag#6046"
    data::NTuple{8, UInt8}
end

function Base.getproperty(x::Ptr{var"##Ctag#6046"}, f::Symbol)
    f === :forwarding_vtable && return Ptr{Ptr{aws_http_proxy_negotiator_forwarding_vtable}}(x + 0)
    f === :tunnelling_vtable && return Ptr{Ptr{aws_http_proxy_negotiator_tunnelling_vtable}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#6046", f::Symbol)
    r = Ref{var"##Ctag#6046"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#6046"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#6046"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct aws_http_proxy_negotiator
    data::NTuple{40, UInt8}
end

function Base.getproperty(x::Ptr{aws_http_proxy_negotiator}, f::Symbol)
    f === :ref_count && return Ptr{aws_ref_count}(x + 0)
    f === :impl && return Ptr{Ptr{Cvoid}}(x + 24)
    f === :strategy_vtable && return Ptr{var"##Ctag#6046"}(x + 32)
    return getfield(x, f)
end

function Base.getproperty(x::aws_http_proxy_negotiator, f::Symbol)
    r = Ref{aws_http_proxy_negotiator}(x)
    ptr = Base.unsafe_convert(Ptr{aws_http_proxy_negotiator}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{aws_http_proxy_negotiator}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

# typedef struct aws_http_proxy_negotiator * ( aws_http_proxy_strategy_create_negotiator_fn ) ( struct aws_http_proxy_strategy * proxy_strategy , struct aws_allocator * allocator )
"""
******************************************************************************************
"""
const aws_http_proxy_strategy_create_negotiator_fn = Cvoid

struct aws_http_proxy_strategy_basic_auth_options
    proxy_connection_type::aws_http_proxy_connection_type
    user_name::aws_byte_cursor
    password::aws_byte_cursor
end

struct aws_http_proxy_strategy_tunneling_kerberos_options
    get_token::Ptr{Cvoid}
    get_token_user_data::Ptr{Cvoid}
end

struct aws_http_proxy_strategy_tunneling_ntlm_options
    get_token::Ptr{Cvoid}
    get_challenge_token::Ptr{Cvoid}
    get_challenge_token_user_data::Ptr{Cvoid}
end

struct aws_http_proxy_strategy_tunneling_adaptive_options
    kerberos_options::Ptr{aws_http_proxy_strategy_tunneling_kerberos_options}
    ntlm_options::Ptr{aws_http_proxy_strategy_tunneling_ntlm_options}
end

struct aws_http_proxy_strategy_tunneling_sequence_options
    strategies::Ptr{Ptr{aws_http_proxy_strategy}}
    strategy_count::UInt32
end

"""
    aws_http_proxy_negotiator_acquire(proxy_negotiator)

Take a reference to an http proxy negotiator

### Parameters
* `proxy_negotiator`: negotiator to take a reference to
### Returns
the strategy
### Prototype
```c
struct aws_http_proxy_negotiator *aws_http_proxy_negotiator_acquire(struct aws_http_proxy_negotiator *proxy_negotiator);
```
"""
function aws_http_proxy_negotiator_acquire(proxy_negotiator)
    ccall((:aws_http_proxy_negotiator_acquire, libawscrt), Ptr{aws_http_proxy_negotiator}, (Ptr{aws_http_proxy_negotiator},), proxy_negotiator)
end

"""
    aws_http_proxy_negotiator_release(proxy_negotiator)

Release a reference to an http proxy negotiator

### Parameters
* `proxy_negotiator`: negotiator to release a reference to
### Prototype
```c
void aws_http_proxy_negotiator_release(struct aws_http_proxy_negotiator *proxy_negotiator);
```
"""
function aws_http_proxy_negotiator_release(proxy_negotiator)
    ccall((:aws_http_proxy_negotiator_release, libawscrt), Cvoid, (Ptr{aws_http_proxy_negotiator},), proxy_negotiator)
end

"""
    aws_http_proxy_strategy_create_negotiator(strategy, allocator)

Creates a new proxy negotiator from a proxy strategy

### Parameters
* `allocator`: memory allocator to use
* `strategy`: strategy to creation a new negotiator for
### Returns
a new proxy negotiator if successful, otherwise NULL
### Prototype
```c
struct aws_http_proxy_negotiator *aws_http_proxy_strategy_create_negotiator( struct aws_http_proxy_strategy *strategy, struct aws_allocator *allocator);
```
"""
function aws_http_proxy_strategy_create_negotiator(strategy, allocator)
    ccall((:aws_http_proxy_strategy_create_negotiator, libawscrt), Ptr{aws_http_proxy_negotiator}, (Ptr{aws_http_proxy_strategy}, Ptr{aws_allocator}), strategy, allocator)
end

"""
    aws_http_proxy_strategy_acquire(proxy_strategy)

Take a reference to an http proxy strategy

### Parameters
* `proxy_strategy`: strategy to take a reference to
### Returns
the strategy
### Prototype
```c
struct aws_http_proxy_strategy *aws_http_proxy_strategy_acquire(struct aws_http_proxy_strategy *proxy_strategy);
```
"""
function aws_http_proxy_strategy_acquire(proxy_strategy)
    ccall((:aws_http_proxy_strategy_acquire, libawscrt), Ptr{aws_http_proxy_strategy}, (Ptr{aws_http_proxy_strategy},), proxy_strategy)
end

"""
    aws_http_proxy_strategy_release(proxy_strategy)

Release a reference to an http proxy strategy

### Parameters
* `proxy_strategy`: strategy to release a reference to
### Prototype
```c
void aws_http_proxy_strategy_release(struct aws_http_proxy_strategy *proxy_strategy);
```
"""
function aws_http_proxy_strategy_release(proxy_strategy)
    ccall((:aws_http_proxy_strategy_release, libawscrt), Cvoid, (Ptr{aws_http_proxy_strategy},), proxy_strategy)
end

"""
    aws_http_proxy_strategy_new_basic_auth(allocator, config)

A constructor for a proxy strategy that performs basic authentication by adding the appropriate header and header value to requests or CONNECT requests.

### Parameters
* `allocator`: memory allocator to use
* `config`: basic authentication configuration info
### Returns
a new proxy strategy if successfully constructed, otherwise NULL
### Prototype
```c
struct aws_http_proxy_strategy *aws_http_proxy_strategy_new_basic_auth( struct aws_allocator *allocator, struct aws_http_proxy_strategy_basic_auth_options *config);
```
"""
function aws_http_proxy_strategy_new_basic_auth(allocator, config)
    ccall((:aws_http_proxy_strategy_new_basic_auth, libawscrt), Ptr{aws_http_proxy_strategy}, (Ptr{aws_allocator}, Ptr{aws_http_proxy_strategy_basic_auth_options}), allocator, config)
end

"""
    aws_http_proxy_strategy_new_tunneling_adaptive(allocator, config)

Constructor for an adaptive tunneling proxy strategy. This strategy attempts a vanilla CONNECT and if that fails it may make followup CONNECT attempts using kerberos or ntlm tokens, based on configuration and proxy response properties.

### Parameters
* `allocator`: memory allocator to use
* `config`: configuration options for the strategy
### Returns
a new proxy strategy if successfully constructed, otherwise NULL
### Prototype
```c
struct aws_http_proxy_strategy *aws_http_proxy_strategy_new_tunneling_adaptive( struct aws_allocator *allocator, struct aws_http_proxy_strategy_tunneling_adaptive_options *config);
```
"""
function aws_http_proxy_strategy_new_tunneling_adaptive(allocator, config)
    ccall((:aws_http_proxy_strategy_new_tunneling_adaptive, libawscrt), Ptr{aws_http_proxy_strategy}, (Ptr{aws_allocator}, Ptr{aws_http_proxy_strategy_tunneling_adaptive_options}), allocator, config)
end

"""
    aws_http_proxy_config_new_from_connection_options(allocator, options)

Create a persistent proxy configuration from http connection options

### Parameters
* `allocator`: memory allocator to use
* `options`: http connection options to source proxy configuration from
### Returns

### Prototype
```c
struct aws_http_proxy_config *aws_http_proxy_config_new_from_connection_options( struct aws_allocator *allocator, const struct aws_http_client_connection_options *options);
```
"""
function aws_http_proxy_config_new_from_connection_options(allocator, options)
    ccall((:aws_http_proxy_config_new_from_connection_options, libawscrt), Ptr{aws_http_proxy_config}, (Ptr{aws_allocator}, Ptr{aws_http_client_connection_options}), allocator, options)
end

"""
    aws_http_proxy_config_new_from_manager_options(allocator, options)

Create a persistent proxy configuration from http connection manager options

### Parameters
* `allocator`: memory allocator to use
* `options`: http connection manager options to source proxy configuration from
### Returns

### Prototype
```c
struct aws_http_proxy_config *aws_http_proxy_config_new_from_manager_options( struct aws_allocator *allocator, const struct aws_http_connection_manager_options *options);
```
"""
function aws_http_proxy_config_new_from_manager_options(allocator, options)
    ccall((:aws_http_proxy_config_new_from_manager_options, libawscrt), Ptr{aws_http_proxy_config}, (Ptr{aws_allocator}, Ptr{aws_http_connection_manager_options}), allocator, options)
end

"""
    aws_http_proxy_config_new_tunneling_from_proxy_options(allocator, options)

Create a persistent proxy configuration from non-persistent proxy options. The resulting proxy configuration assumes a tunneling connection type.

### Parameters
* `allocator`: memory allocator to use
* `options`: http proxy options to source proxy configuration from
### Returns

### Prototype
```c
struct aws_http_proxy_config *aws_http_proxy_config_new_tunneling_from_proxy_options( struct aws_allocator *allocator, const struct aws_http_proxy_options *options);
```
"""
function aws_http_proxy_config_new_tunneling_from_proxy_options(allocator, options)
    ccall((:aws_http_proxy_config_new_tunneling_from_proxy_options, libawscrt), Ptr{aws_http_proxy_config}, (Ptr{aws_allocator}, Ptr{aws_http_proxy_options}), allocator, options)
end

"""
    aws_http_proxy_config_new_from_proxy_options(allocator, options)

Create a persistent proxy configuration from non-persistent proxy options. Legacy connection type of proxy options will be rejected.

### Parameters
* `allocator`: memory allocator to use
* `options`: http proxy options to source proxy configuration from
### Returns

### Prototype
```c
struct aws_http_proxy_config *aws_http_proxy_config_new_from_proxy_options( struct aws_allocator *allocator, const struct aws_http_proxy_options *options);
```
"""
function aws_http_proxy_config_new_from_proxy_options(allocator, options)
    ccall((:aws_http_proxy_config_new_from_proxy_options, libawscrt), Ptr{aws_http_proxy_config}, (Ptr{aws_allocator}, Ptr{aws_http_proxy_options}), allocator, options)
end

"""
    aws_http_proxy_config_new_clone(allocator, proxy_config)

Clones an existing proxy configuration. A refactor could remove this (do a "move" between the old and new user data in the one spot it's used) but that should wait until we have better test cases for the logic where this gets invoked (ntlm/kerberos chains).

### Parameters
* `allocator`: memory allocator to use
* `proxy_config`: http proxy configuration to clone
### Returns

### Prototype
```c
struct aws_http_proxy_config *aws_http_proxy_config_new_clone( struct aws_allocator *allocator, const struct aws_http_proxy_config *proxy_config);
```
"""
function aws_http_proxy_config_new_clone(allocator, proxy_config)
    ccall((:aws_http_proxy_config_new_clone, libawscrt), Ptr{aws_http_proxy_config}, (Ptr{aws_allocator}, Ptr{aws_http_proxy_config}), allocator, proxy_config)
end

"""
    aws_http_proxy_config_destroy(config)

Destroys an http proxy configuration

### Parameters
* `config`: http proxy configuration to destroy
### Prototype
```c
void aws_http_proxy_config_destroy(struct aws_http_proxy_config *config);
```
"""
function aws_http_proxy_config_destroy(config)
    ccall((:aws_http_proxy_config_destroy, libawscrt), Cvoid, (Ptr{aws_http_proxy_config},), config)
end

"""
    aws_http_proxy_options_init_from_config(options, config)

Initializes non-persistent http proxy options from a persistent http proxy configuration

### Parameters
* `options`: http proxy options to initialize
* `config`: the http proxy config to use as an initialization source
### Prototype
```c
void aws_http_proxy_options_init_from_config( struct aws_http_proxy_options *options, const struct aws_http_proxy_config *config);
```
"""
function aws_http_proxy_options_init_from_config(options, config)
    ccall((:aws_http_proxy_options_init_from_config, libawscrt), Cvoid, (Ptr{aws_http_proxy_options}, Ptr{aws_http_proxy_config}), options, config)
end

struct aws_event_loop_vtable
    destroy::Ptr{Cvoid}
    run::Ptr{Cvoid}
    stop::Ptr{Cvoid}
    wait_for_stop_completion::Ptr{Cvoid}
    schedule_task_now::Ptr{Cvoid}
    schedule_task_future::Ptr{Cvoid}
    cancel_task::Ptr{Cvoid}
    subscribe_to_io_events::Ptr{Cvoid}
    unsubscribe_from_io_events::Ptr{Cvoid}
    free_io_event_resources::Ptr{Cvoid}
    is_on_callers_thread::Ptr{Cvoid}
end

struct aws_event_loop
    vtable::Ptr{aws_event_loop_vtable}
    alloc::Ptr{aws_allocator}
    clock::Ptr{Cvoid}
    local_data::aws_hash_table
    current_load_factor::aws_atomic_var
    latest_tick_start::UInt64
    current_tick_latency_sum::Csize_t
    next_flush_time::aws_atomic_var
    impl_data::Ptr{Cvoid}
end

"""
    aws_socket_channel_bootstrap_options

Socket-based channel creation options.

bootstrap - configs name resolution and which event loop group the connection will be seated into host\\_name - host to connect to; if a dns address, will be resolved prior to connecting port - port to connect to socket\\_options - socket properties, including type (tcp vs. udp vs. unix domain) and connect timeout. TLS connections are currently restricted to tcp (AWS\\_SOCKET\\_STREAM) only. tls\\_options - (optional) tls context to apply after connection establishment. If NULL, the connection will not be protected by TLS. creation\\_callback - (optional) callback invoked when the channel is first created. This is always right after the connection was successfully established. *Does NOT* get called if the initial connect failed. setup\\_callback - callback invoked once the channel is ready for use and TLS has been negotiated or if an error is encountered shutdown\\_callback - callback invoked once the channel has shutdown. enable\\_read\\_back\\_pressure - controls whether or not back pressure will be applied in the channel user\\_data - arbitrary data to pass back to the various callbacks requested\\_event\\_loop - if set, the connection will be placed on the requested event loop rather than one chosen internally from the bootstrap's associated event loop group. It is an error to pass in an event loop that is not associated with the bootstrap's event loop group.

Immediately after the `shutdown_callback` returns, the channel is cleaned up automatically. All callbacks are invoked in the thread of the event-loop that the new channel is assigned to.
"""
struct aws_socket_channel_bootstrap_options
    bootstrap::Ptr{aws_client_bootstrap}
    host_name::Ptr{Cchar}
    port::UInt16
    socket_options::Ptr{aws_socket_options}
    tls_options::Ptr{aws_tls_connection_options}
    creation_callback::Ptr{Cvoid}
    setup_callback::Ptr{Cvoid}
    shutdown_callback::Ptr{Cvoid}
    enable_read_back_pressure::Bool
    user_data::Ptr{Cvoid}
    requested_event_loop::Ptr{aws_event_loop}
end

"""
    aws_http_proxy_new_socket_channel(channel_options, proxy_options)

Establish an arbitrary protocol connection through an http proxy via tunneling CONNECT. Alpn is not required for this connection process to succeed, but we encourage its use if available.

### Parameters
* `channel_options`: configuration options for the socket level connection
* `proxy_options`: configuration options for the proxy connection
### Returns
[`AWS_OP_SUCCESS`](@ref) if the asynchronous channel kickoff succeeded, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_http_proxy_new_socket_channel( struct aws_socket_channel_bootstrap_options *channel_options, const struct aws_http_proxy_options *proxy_options);
```
"""
function aws_http_proxy_new_socket_channel(channel_options, proxy_options)
    ccall((:aws_http_proxy_new_socket_channel, libawscrt), Cint, (Ptr{aws_socket_channel_bootstrap_options}, Ptr{aws_http_proxy_options}), channel_options, proxy_options)
end

"""
    aws_http_header_compression

Controls whether a header's strings may be compressed by encoding the index of strings in a cache, rather than encoding the literal string.

This setting has no effect on HTTP/1.x connections. On HTTP/2 connections this controls HPACK behavior. See RFC-7541 Section 7.1 for security considerations.
"""
@cenum aws_http_header_compression::UInt32 begin
    AWS_HTTP_HEADER_COMPRESSION_USE_CACHE = 0
    AWS_HTTP_HEADER_COMPRESSION_NO_CACHE = 1
    AWS_HTTP_HEADER_COMPRESSION_NO_FORWARD_CACHE = 2
end

"""
    aws_http_header

A lightweight HTTP header struct. Note that the underlying strings are not owned by the byte cursors.
"""
struct aws_http_header
    name::aws_byte_cursor
    value::aws_byte_cursor
    compression::aws_http_header_compression
end

"""
    aws_http_header_block

Header block type. INFORMATIONAL: Header block for 1xx informational (interim) responses. MAIN: Main header block sent with request or response. TRAILING: Headers sent after the body of a request or response.
"""
@cenum aws_http_header_block::UInt32 begin
    AWS_HTTP_HEADER_BLOCK_MAIN = 0
    AWS_HTTP_HEADER_BLOCK_INFORMATIONAL = 1
    AWS_HTTP_HEADER_BLOCK_TRAILING = 2
end

# typedef void ( aws_http_message_transform_complete_fn ) ( struct aws_http_message * message , int error_code , void * complete_ctx )
"""
Function to invoke when a message transformation completes. This function MUST be invoked or the application will soft-lock. `message` and `complete_ctx` must be the same pointers provided to the [`aws_http_message_transform_fn`](@ref). `error_code` should should be AWS\\_ERROR\\_SUCCESS if transformation was successful, otherwise pass a different AWS\\_ERROR\\_X value.
"""
const aws_http_message_transform_complete_fn = Cvoid

# typedef void ( aws_http_message_transform_fn ) ( struct aws_http_message * message , void * user_data , aws_http_message_transform_complete_fn * complete_fn , void * complete_ctx )
"""
A function that may modify a request or response before it is sent. The transformation may be asynchronous or immediate. The user MUST invoke the `complete_fn` when transformation is complete or the application will soft-lock. When invoking the `complete_fn`, pass along the `message` and `complete_ctx` provided here and an error code. The error code should be AWS\\_ERROR\\_SUCCESS if transformation was successful, otherwise pass a different AWS\\_ERROR\\_X value.
"""
const aws_http_message_transform_fn = Cvoid

# typedef int ( aws_http_on_incoming_headers_fn ) ( struct aws_http_stream * stream , enum aws_http_header_block header_block , const struct aws_http_header * header_array , size_t num_headers , void * user_data )
"""
Invoked repeatedly times as headers are received. At this point, [`aws_http_stream_get_incoming_response_status`](@ref)() can be called for the client. And [`aws_http_stream_get_incoming_request_method`](@ref)() and [`aws_http_stream_get_incoming_request_uri`](@ref)() can be called for the server. This is always invoked on the HTTP connection's event-loop thread.

Return [`AWS_OP_SUCCESS`](@ref) to continue processing the stream. Return [`AWS_OP_ERR`](@ref) to indicate failure and cancel the stream.
"""
const aws_http_on_incoming_headers_fn = Cvoid

# typedef int ( aws_http_on_incoming_header_block_done_fn ) ( struct aws_http_stream * stream , enum aws_http_header_block header_block , void * user_data )
"""
Invoked when the incoming header block of this type(informational/main/trailing) has been completely read. This is always invoked on the HTTP connection's event-loop thread.

Return [`AWS_OP_SUCCESS`](@ref) to continue processing the stream. Return [`AWS_OP_ERR`](@ref) to indicate failure and cancel the stream.
"""
const aws_http_on_incoming_header_block_done_fn = Cvoid

# typedef int ( aws_http_on_incoming_body_fn ) ( struct aws_http_stream * stream , const struct aws_byte_cursor * data , void * user_data )
"""
Called repeatedly as body data is received. The data must be copied immediately if you wish to preserve it. This is always invoked on the HTTP connection's event-loop thread.

Note that, if the connection is using manual\\_window\\_management then the window size has shrunk by the amount of body data received. If the window size reaches 0 no further data will be received. Increment the window size with [`aws_http_stream_update_window`](@ref)().

Return [`AWS_OP_SUCCESS`](@ref) to continue processing the stream. Return [`AWS_OP_ERR`](@ref) to indicate failure and cancel the stream.
"""
const aws_http_on_incoming_body_fn = Cvoid

# typedef int ( aws_http_on_incoming_request_done_fn ) ( struct aws_http_stream * stream , void * user_data )
"""
Invoked when request has been completely read. This is always invoked on the HTTP connection's event-loop thread.

Return [`AWS_OP_SUCCESS`](@ref) to continue processing the stream. Return [`AWS_OP_ERR`](@ref) to indicate failure and cancel the stream.
"""
const aws_http_on_incoming_request_done_fn = Cvoid

# typedef void ( aws_http_on_stream_complete_fn ) ( struct aws_http_stream * stream , int error_code , void * user_data )
"""
Invoked when request/response stream is complete, whether successful or unsuccessful This is always invoked on the HTTP connection's event-loop thread.
"""
const aws_http_on_stream_complete_fn = Cvoid

struct aws_http_request_handler_options
    self_size::Csize_t
    server_connection::Ptr{aws_http_connection}
    user_data::Ptr{Cvoid}
    on_request_headers::Ptr{Cvoid}
    on_request_header_block_done::Ptr{Cvoid}
    on_request_body::Ptr{Cvoid}
    on_request_done::Ptr{Cvoid}
    on_complete::Ptr{Cvoid}
end

# typedef void aws_http1_stream_write_chunk_complete_fn ( struct aws_http_stream * stream , int error_code , void * user_data )
"""
Invoked when the data of an outgoing HTTP/1.1 chunk is no longer in use. This is always invoked on the HTTP connection's event-loop thread.

### Parameters
* `stream`: HTTP-stream this chunk was submitted to.
* `error_code`: If error\\_code is AWS\\_ERROR\\_SUCCESS (0), the data was successfully sent. Any other error\\_code indicates that the HTTP-stream is in the process of terminating. If the error\\_code is AWS\\_ERROR\\_HTTP\\_STREAM\\_HAS\\_COMPLETED, the stream's termination has nothing to do with this chunk. Any other non-zero error code indicates a problem with this particular chunk's data.
* `user_data`: User data for this chunk.
"""
const aws_http1_stream_write_chunk_complete_fn = Cvoid

"""
    aws_http1_chunk_extension

HTTP/1.1 chunk extension for chunked encoding. Note that the underlying strings are not owned by the byte cursors.
"""
struct aws_http1_chunk_extension
    key::aws_byte_cursor
    value::aws_byte_cursor
end

"""
    aws_http1_chunk_options

Encoding options for an HTTP/1.1 chunked transfer encoding chunk.
"""
struct aws_http1_chunk_options
    chunk_data::Ptr{aws_input_stream}
    chunk_data_size::UInt64
    extensions::Ptr{aws_http1_chunk_extension}
    num_extensions::Csize_t
    on_complete::Ptr{Cvoid}
    user_data::Ptr{Cvoid}
end

"""
    aws_http_header_name_eq(name_a, name_b)

Return whether both names are equivalent. This is a case-insensitive string comparison.

Example Matches: "Content-Length" == "content-length" // upper or lower case ok

Example Mismatches: "Content-Length" != " Content-Length" // leading whitespace bad

### Prototype
```c
bool aws_http_header_name_eq(struct aws_byte_cursor name_a, struct aws_byte_cursor name_b);
```
"""
function aws_http_header_name_eq(name_a, name_b)
    ccall((:aws_http_header_name_eq, libawscrt), Bool, (aws_byte_cursor, aws_byte_cursor), name_a, name_b)
end

"""
    aws_http_headers_new(allocator)

Create a new headers object. The caller has a hold on the object and must call [`aws_http_headers_release`](@ref)() when they are done with it.

### Prototype
```c
struct aws_http_headers *aws_http_headers_new(struct aws_allocator *allocator);
```
"""
function aws_http_headers_new(allocator)
    ccall((:aws_http_headers_new, libawscrt), Ptr{aws_http_headers}, (Ptr{aws_allocator},), allocator)
end

"""
    aws_http_headers_acquire(headers)

Acquire a hold on the object, preventing it from being deleted until [`aws_http_headers_release`](@ref)() is called by all those with a hold on it.

### Prototype
```c
void aws_http_headers_acquire(struct aws_http_headers *headers);
```
"""
function aws_http_headers_acquire(headers)
    ccall((:aws_http_headers_acquire, libawscrt), Cvoid, (Ptr{aws_http_headers},), headers)
end

"""
    aws_http_headers_release(headers)

Release a hold on the object. The object is deleted when all holds on it are released.

### Prototype
```c
void aws_http_headers_release(struct aws_http_headers *headers);
```
"""
function aws_http_headers_release(headers)
    ccall((:aws_http_headers_release, libawscrt), Cvoid, (Ptr{aws_http_headers},), headers)
end

"""
    aws_http_headers_add_header(headers, header)

Add a header. The underlying strings are copied.

### Prototype
```c
int aws_http_headers_add_header(struct aws_http_headers *headers, const struct aws_http_header *header);
```
"""
function aws_http_headers_add_header(headers, header)
    ccall((:aws_http_headers_add_header, libawscrt), Cint, (Ptr{aws_http_headers}, Ptr{aws_http_header}), headers, header)
end

"""
    aws_http_headers_add(headers, name, value)

Add a header. The underlying strings are copied.

### Prototype
```c
int aws_http_headers_add(struct aws_http_headers *headers, struct aws_byte_cursor name, struct aws_byte_cursor value);
```
"""
function aws_http_headers_add(headers, name, value)
    ccall((:aws_http_headers_add, libawscrt), Cint, (Ptr{aws_http_headers}, aws_byte_cursor, aws_byte_cursor), headers, name, value)
end

"""
    aws_http_headers_add_array(headers, array, count)

Add an array of headers. The underlying strings are copied.

### Prototype
```c
int aws_http_headers_add_array(struct aws_http_headers *headers, const struct aws_http_header *array, size_t count);
```
"""
function aws_http_headers_add_array(headers, array, count)
    ccall((:aws_http_headers_add_array, libawscrt), Cint, (Ptr{aws_http_headers}, Ptr{aws_http_header}, Csize_t), headers, array, count)
end

"""
    aws_http_headers_set(headers, name, value)

Set a header value. The header is added if necessary and any existing values for this name are removed. The underlying strings are copied.

### Prototype
```c
int aws_http_headers_set(struct aws_http_headers *headers, struct aws_byte_cursor name, struct aws_byte_cursor value);
```
"""
function aws_http_headers_set(headers, name, value)
    ccall((:aws_http_headers_set, libawscrt), Cint, (Ptr{aws_http_headers}, aws_byte_cursor, aws_byte_cursor), headers, name, value)
end

"""
    aws_http_headers_count(headers)

Get the total number of headers.

### Prototype
```c
size_t aws_http_headers_count(const struct aws_http_headers *headers);
```
"""
function aws_http_headers_count(headers)
    ccall((:aws_http_headers_count, libawscrt), Csize_t, (Ptr{aws_http_headers},), headers)
end

"""
    aws_http_headers_get_index(headers, index, out_header)

Get the header at the specified index. The index of a given header may change any time headers are modified. When iterating headers, the following ordering rules apply:

- Headers with the same name will always be in the same order, relative to one another. If "A: one" is added before "A: two", then "A: one" will always precede "A: two".

- Headers with different names could be in any order, relative to one another. If "A: one" is seen before "B: bee" in one iteration, you might see "B: bee" before "A: one" on the next.

AWS\\_ERROR\\_INVALID\\_INDEX is raised if the index is invalid.

### Prototype
```c
int aws_http_headers_get_index( const struct aws_http_headers *headers, size_t index, struct aws_http_header *out_header);
```
"""
function aws_http_headers_get_index(headers, index, out_header)
    ccall((:aws_http_headers_get_index, libawscrt), Cint, (Ptr{aws_http_headers}, Csize_t, Ptr{aws_http_header}), headers, index, out_header)
end

"""
    aws_http_headers_get(headers, name, out_value)

Get the first value for this name, ignoring any additional values. AWS\\_ERROR\\_HTTP\\_HEADER\\_NOT\\_FOUND is raised if the name is not found.

### Prototype
```c
int aws_http_headers_get( const struct aws_http_headers *headers, struct aws_byte_cursor name, struct aws_byte_cursor *out_value);
```
"""
function aws_http_headers_get(headers, name, out_value)
    ccall((:aws_http_headers_get, libawscrt), Cint, (Ptr{aws_http_headers}, aws_byte_cursor, Ptr{aws_byte_cursor}), headers, name, out_value)
end

"""
    aws_http_headers_has(headers, name)

Test if header name exists or not in headers

### Prototype
```c
bool aws_http_headers_has(const struct aws_http_headers *headers, struct aws_byte_cursor name);
```
"""
function aws_http_headers_has(headers, name)
    ccall((:aws_http_headers_has, libawscrt), Bool, (Ptr{aws_http_headers}, aws_byte_cursor), headers, name)
end

"""
    aws_http_headers_erase(headers, name)

Remove all headers with this name. AWS\\_ERROR\\_HTTP\\_HEADER\\_NOT\\_FOUND is raised if no headers with this name are found.

### Prototype
```c
int aws_http_headers_erase(struct aws_http_headers *headers, struct aws_byte_cursor name);
```
"""
function aws_http_headers_erase(headers, name)
    ccall((:aws_http_headers_erase, libawscrt), Cint, (Ptr{aws_http_headers}, aws_byte_cursor), headers, name)
end

"""
    aws_http_headers_erase_value(headers, name, value)

Remove the first header found with this name and value. AWS\\_ERROR\\_HTTP\\_HEADER\\_NOT\\_FOUND is raised if no such header is found.

### Prototype
```c
int aws_http_headers_erase_value( struct aws_http_headers *headers, struct aws_byte_cursor name, struct aws_byte_cursor value);
```
"""
function aws_http_headers_erase_value(headers, name, value)
    ccall((:aws_http_headers_erase_value, libawscrt), Cint, (Ptr{aws_http_headers}, aws_byte_cursor, aws_byte_cursor), headers, name, value)
end

"""
    aws_http_headers_erase_index(headers, index)

Remove the header at the specified index.

AWS\\_ERROR\\_INVALID\\_INDEX is raised if the index is invalid.

### Prototype
```c
int aws_http_headers_erase_index(struct aws_http_headers *headers, size_t index);
```
"""
function aws_http_headers_erase_index(headers, index)
    ccall((:aws_http_headers_erase_index, libawscrt), Cint, (Ptr{aws_http_headers}, Csize_t), headers, index)
end

"""
    aws_http_headers_clear(headers)

Clear all headers.

### Prototype
```c
void aws_http_headers_clear(struct aws_http_headers *headers);
```
"""
function aws_http_headers_clear(headers)
    ccall((:aws_http_headers_clear, libawscrt), Cvoid, (Ptr{aws_http_headers},), headers)
end

"""
    aws_http2_headers_get_request_method(h2_headers, out_method)

Get the `:method` value (HTTP/2 headers only).

### Prototype
```c
int aws_http2_headers_get_request_method(const struct aws_http_headers *h2_headers, struct aws_byte_cursor *out_method);
```
"""
function aws_http2_headers_get_request_method(h2_headers, out_method)
    ccall((:aws_http2_headers_get_request_method, libawscrt), Cint, (Ptr{aws_http_headers}, Ptr{aws_byte_cursor}), h2_headers, out_method)
end

"""
    aws_http2_headers_set_request_method(h2_headers, method)

Set `:method` (HTTP/2 headers only). The headers makes its own copy of the underlying string.

### Prototype
```c
int aws_http2_headers_set_request_method(struct aws_http_headers *h2_headers, struct aws_byte_cursor method);
```
"""
function aws_http2_headers_set_request_method(h2_headers, method)
    ccall((:aws_http2_headers_set_request_method, libawscrt), Cint, (Ptr{aws_http_headers}, aws_byte_cursor), h2_headers, method)
end

"""
    aws_http2_headers_get_request_scheme(h2_headers, out_scheme)

### Prototype
```c
int aws_http2_headers_get_request_scheme(const struct aws_http_headers *h2_headers, struct aws_byte_cursor *out_scheme);
```
"""
function aws_http2_headers_get_request_scheme(h2_headers, out_scheme)
    ccall((:aws_http2_headers_get_request_scheme, libawscrt), Cint, (Ptr{aws_http_headers}, Ptr{aws_byte_cursor}), h2_headers, out_scheme)
end

"""
    aws_http2_headers_set_request_scheme(h2_headers, scheme)

Set `:scheme` (request pseudo headers only). The pseudo headers makes its own copy of the underlying string.

### Prototype
```c
int aws_http2_headers_set_request_scheme(struct aws_http_headers *h2_headers, struct aws_byte_cursor scheme);
```
"""
function aws_http2_headers_set_request_scheme(h2_headers, scheme)
    ccall((:aws_http2_headers_set_request_scheme, libawscrt), Cint, (Ptr{aws_http_headers}, aws_byte_cursor), h2_headers, scheme)
end

"""
    aws_http2_headers_get_request_authority(h2_headers, out_authority)

### Prototype
```c
int aws_http2_headers_get_request_authority( const struct aws_http_headers *h2_headers, struct aws_byte_cursor *out_authority);
```
"""
function aws_http2_headers_get_request_authority(h2_headers, out_authority)
    ccall((:aws_http2_headers_get_request_authority, libawscrt), Cint, (Ptr{aws_http_headers}, Ptr{aws_byte_cursor}), h2_headers, out_authority)
end

"""
    aws_http2_headers_set_request_authority(h2_headers, authority)

Set `:authority` (request pseudo headers only). The pseudo headers makes its own copy of the underlying string.

### Prototype
```c
int aws_http2_headers_set_request_authority(struct aws_http_headers *h2_headers, struct aws_byte_cursor authority);
```
"""
function aws_http2_headers_set_request_authority(h2_headers, authority)
    ccall((:aws_http2_headers_set_request_authority, libawscrt), Cint, (Ptr{aws_http_headers}, aws_byte_cursor), h2_headers, authority)
end

"""
    aws_http2_headers_get_request_path(h2_headers, out_path)

### Prototype
```c
int aws_http2_headers_get_request_path(const struct aws_http_headers *h2_headers, struct aws_byte_cursor *out_path);
```
"""
function aws_http2_headers_get_request_path(h2_headers, out_path)
    ccall((:aws_http2_headers_get_request_path, libawscrt), Cint, (Ptr{aws_http_headers}, Ptr{aws_byte_cursor}), h2_headers, out_path)
end

"""
    aws_http2_headers_set_request_path(h2_headers, path)

Set `:path` (request pseudo headers only). The pseudo headers makes its own copy of the underlying string.

### Prototype
```c
int aws_http2_headers_set_request_path(struct aws_http_headers *h2_headers, struct aws_byte_cursor path);
```
"""
function aws_http2_headers_set_request_path(h2_headers, path)
    ccall((:aws_http2_headers_set_request_path, libawscrt), Cint, (Ptr{aws_http_headers}, aws_byte_cursor), h2_headers, path)
end

"""
    aws_http2_headers_get_response_status(h2_headers, out_status_code)

Get `:status` (response pseudo headers only). If no status is set, AWS\\_ERROR\\_HTTP\\_DATA\\_NOT\\_AVAILABLE is raised.

### Prototype
```c
int aws_http2_headers_get_response_status(const struct aws_http_headers *h2_headers, int *out_status_code);
```
"""
function aws_http2_headers_get_response_status(h2_headers, out_status_code)
    ccall((:aws_http2_headers_get_response_status, libawscrt), Cint, (Ptr{aws_http_headers}, Ptr{Cint}), h2_headers, out_status_code)
end

"""
    aws_http2_headers_set_response_status(h2_headers, status_code)

Set `:status` (response pseudo headers only).

### Prototype
```c
int aws_http2_headers_set_response_status(struct aws_http_headers *h2_headers, int status_code);
```
"""
function aws_http2_headers_set_response_status(h2_headers, status_code)
    ccall((:aws_http2_headers_set_response_status, libawscrt), Cint, (Ptr{aws_http_headers}, Cint), h2_headers, status_code)
end

"""
    aws_http_message_new_request(allocator)

Create a new HTTP/1.1 request message. The message is blank, all properties (method, path, etc) must be set individually. If HTTP/1.1 message used in HTTP/2 connection, the transformation will be automatically applied. A HTTP/2 message will created and sent based on the HTTP/1.1 message.

The caller has a hold on the object and must call [`aws_http_message_release`](@ref)() when they are done with it.

### Prototype
```c
struct aws_http_message *aws_http_message_new_request(struct aws_allocator *allocator);
```
"""
function aws_http_message_new_request(allocator)
    ccall((:aws_http_message_new_request, libawscrt), Ptr{aws_http_message}, (Ptr{aws_allocator},), allocator)
end

"""
    aws_http_message_new_request_with_headers(allocator, existing_headers)

Like [`aws_http_message_new_request`](@ref)(), but uses existing [`aws_http_headers`](@ref) instead of creating a new one. Acquires a hold on the headers, and releases it when the request is destroyed.

### Prototype
```c
struct aws_http_message *aws_http_message_new_request_with_headers( struct aws_allocator *allocator, struct aws_http_headers *existing_headers);
```
"""
function aws_http_message_new_request_with_headers(allocator, existing_headers)
    ccall((:aws_http_message_new_request_with_headers, libawscrt), Ptr{aws_http_message}, (Ptr{aws_allocator}, Ptr{aws_http_headers}), allocator, existing_headers)
end

"""
    aws_http_message_new_response(allocator)

Create a new HTTP/1.1 response message. The message is blank, all properties (status, headers, etc) must be set individually.

The caller has a hold on the object and must call [`aws_http_message_release`](@ref)() when they are done with it.

### Prototype
```c
struct aws_http_message *aws_http_message_new_response(struct aws_allocator *allocator);
```
"""
function aws_http_message_new_response(allocator)
    ccall((:aws_http_message_new_response, libawscrt), Ptr{aws_http_message}, (Ptr{aws_allocator},), allocator)
end

"""
    aws_http2_message_new_request(allocator)

Create a new HTTP/2 request message. pseudo headers need to be set from aws\\_http2\\_headers\\_set\\_request\\_* to the headers of the [`aws_http_message`](@ref). Will be errored out if used in HTTP/1.1 connection.

The caller has a hold on the object and must call [`aws_http_message_release`](@ref)() when they are done with it.

### Prototype
```c
struct aws_http_message *aws_http2_message_new_request(struct aws_allocator *allocator);
```
"""
function aws_http2_message_new_request(allocator)
    ccall((:aws_http2_message_new_request, libawscrt), Ptr{aws_http_message}, (Ptr{aws_allocator},), allocator)
end

"""
    aws_http2_message_new_response(allocator)

Create a new HTTP/2 response message. pseudo headers need to be set from [`aws_http2_headers_set_response_status`](@ref) to the headers of the [`aws_http_message`](@ref). Will be errored out if used in HTTP/1.1 connection.

The caller has a hold on the object and must call [`aws_http_message_release`](@ref)() when they are done with it.

### Prototype
```c
struct aws_http_message *aws_http2_message_new_response(struct aws_allocator *allocator);
```
"""
function aws_http2_message_new_response(allocator)
    ccall((:aws_http2_message_new_response, libawscrt), Ptr{aws_http_message}, (Ptr{aws_allocator},), allocator)
end

"""
    aws_http_message_acquire(message)

Acquire a hold on the object, preventing it from being deleted until [`aws_http_message_release`](@ref)() is called by all those with a hold on it.

This function returns the passed in message (possibly NULL) so that acquire-and-assign can be done with a single statement.

### Prototype
```c
struct aws_http_message *aws_http_message_acquire(struct aws_http_message *message);
```
"""
function aws_http_message_acquire(message)
    ccall((:aws_http_message_acquire, libawscrt), Ptr{aws_http_message}, (Ptr{aws_http_message},), message)
end

"""
    aws_http_message_release(message)

Release a hold on the object. The object is deleted when all holds on it are released.

This function always returns NULL so that release-and-assign-NULL can be done with a single statement.

### Prototype
```c
struct aws_http_message *aws_http_message_release(struct aws_http_message *message);
```
"""
function aws_http_message_release(message)
    ccall((:aws_http_message_release, libawscrt), Ptr{aws_http_message}, (Ptr{aws_http_message},), message)
end

"""
    aws_http_message_destroy(message)

Deprecated. This is equivalent to [`aws_http_message_release`](@ref)().

### Prototype
```c
void aws_http_message_destroy(struct aws_http_message *message);
```
"""
function aws_http_message_destroy(message)
    ccall((:aws_http_message_destroy, libawscrt), Cvoid, (Ptr{aws_http_message},), message)
end

"""
    aws_http_message_is_request(message)

### Prototype
```c
bool aws_http_message_is_request(const struct aws_http_message *message);
```
"""
function aws_http_message_is_request(message)
    ccall((:aws_http_message_is_request, libawscrt), Bool, (Ptr{aws_http_message},), message)
end

"""
    aws_http_message_is_response(message)

### Prototype
```c
bool aws_http_message_is_response(const struct aws_http_message *message);
```
"""
function aws_http_message_is_response(message)
    ccall((:aws_http_message_is_response, libawscrt), Bool, (Ptr{aws_http_message},), message)
end

"""
    aws_http_message_get_protocol_version(message)

Get the protocol version of the http message.

### Prototype
```c
enum aws_http_version aws_http_message_get_protocol_version(const struct aws_http_message *message);
```
"""
function aws_http_message_get_protocol_version(message)
    ccall((:aws_http_message_get_protocol_version, libawscrt), aws_http_version, (Ptr{aws_http_message},), message)
end

"""
    aws_http_message_get_request_method(request_message, out_method)

Get the method (request messages only).

### Prototype
```c
int aws_http_message_get_request_method( const struct aws_http_message *request_message, struct aws_byte_cursor *out_method);
```
"""
function aws_http_message_get_request_method(request_message, out_method)
    ccall((:aws_http_message_get_request_method, libawscrt), Cint, (Ptr{aws_http_message}, Ptr{aws_byte_cursor}), request_message, out_method)
end

"""
    aws_http_message_set_request_method(request_message, method)

Set the method (request messages only). The request makes its own copy of the underlying string.

### Prototype
```c
int aws_http_message_set_request_method(struct aws_http_message *request_message, struct aws_byte_cursor method);
```
"""
function aws_http_message_set_request_method(request_message, method)
    ccall((:aws_http_message_set_request_method, libawscrt), Cint, (Ptr{aws_http_message}, aws_byte_cursor), request_message, method)
end

"""
    aws_http_message_get_request_path(request_message, out_path)

### Prototype
```c
int aws_http_message_get_request_path(const struct aws_http_message *request_message, struct aws_byte_cursor *out_path);
```
"""
function aws_http_message_get_request_path(request_message, out_path)
    ccall((:aws_http_message_get_request_path, libawscrt), Cint, (Ptr{aws_http_message}, Ptr{aws_byte_cursor}), request_message, out_path)
end

"""
    aws_http_message_set_request_path(request_message, path)

Set the path-and-query value (request messages only). The request makes its own copy of the underlying string.

### Prototype
```c
int aws_http_message_set_request_path(struct aws_http_message *request_message, struct aws_byte_cursor path);
```
"""
function aws_http_message_set_request_path(request_message, path)
    ccall((:aws_http_message_set_request_path, libawscrt), Cint, (Ptr{aws_http_message}, aws_byte_cursor), request_message, path)
end

"""
    aws_http_message_get_response_status(response_message, out_status_code)

Get the status code (response messages only). If no status is set, AWS\\_ERROR\\_HTTP\\_DATA\\_NOT\\_AVAILABLE is raised.

### Prototype
```c
int aws_http_message_get_response_status(const struct aws_http_message *response_message, int *out_status_code);
```
"""
function aws_http_message_get_response_status(response_message, out_status_code)
    ccall((:aws_http_message_get_response_status, libawscrt), Cint, (Ptr{aws_http_message}, Ptr{Cint}), response_message, out_status_code)
end

"""
    aws_http_message_set_response_status(response_message, status_code)

Set the status code (response messages only).

### Prototype
```c
int aws_http_message_set_response_status(struct aws_http_message *response_message, int status_code);
```
"""
function aws_http_message_set_response_status(response_message, status_code)
    ccall((:aws_http_message_set_response_status, libawscrt), Cint, (Ptr{aws_http_message}, Cint), response_message, status_code)
end

"""
    aws_http_message_get_body_stream(message)

Get the body stream. Returns NULL if no body stream is set.

### Prototype
```c
struct aws_input_stream *aws_http_message_get_body_stream(const struct aws_http_message *message);
```
"""
function aws_http_message_get_body_stream(message)
    ccall((:aws_http_message_get_body_stream, libawscrt), Ptr{aws_input_stream}, (Ptr{aws_http_message},), message)
end

"""
    aws_http_message_set_body_stream(message, body_stream)

Set the body stream. NULL is an acceptable value for messages with no body. Note: The message does NOT take ownership of the body stream. The stream must not be destroyed until the message is complete.

### Prototype
```c
void aws_http_message_set_body_stream(struct aws_http_message *message, struct aws_input_stream *body_stream);
```
"""
function aws_http_message_set_body_stream(message, body_stream)
    ccall((:aws_http_message_set_body_stream, libawscrt), Cvoid, (Ptr{aws_http_message}, Ptr{aws_input_stream}), message, body_stream)
end

"""
    aws_http1_stream_write_chunk(http1_stream, options)

Submit a chunk of data to be sent on an HTTP/1.1 stream. The stream must have specified "chunked" in a "transfer-encoding" header. For client streams, activate() must be called before any chunks are submitted. For server streams, the response must be submitted before any chunks. A final chunk with size 0 must be submitted to successfully complete the HTTP-stream.

Returns [`AWS_OP_SUCCESS`](@ref) if the chunk has been submitted. The chunk's completion callback will be invoked when the HTTP-stream is done with the chunk data, whether or not it was successfully sent (see [`aws_http1_stream_write_chunk_complete_fn`](@ref)). The chunk data must remain valid until the completion callback is invoked.

Returns [`AWS_OP_ERR`](@ref) and raises an error if the chunk could not be submitted. In this case, the chunk's completion callback will never be invoked. Note that it is always possible for the HTTP-stream to terminate unexpectedly prior to this call being made, in which case the error raised is AWS\\_ERROR\\_HTTP\\_STREAM\\_HAS\\_COMPLETED.

### Prototype
```c
int aws_http1_stream_write_chunk( struct aws_http_stream *http1_stream, const struct aws_http1_chunk_options *options);
```
"""
function aws_http1_stream_write_chunk(http1_stream, options)
    ccall((:aws_http1_stream_write_chunk, libawscrt), Cint, (Ptr{aws_http_stream}, Ptr{aws_http1_chunk_options}), http1_stream, options)
end

"""
    aws_http1_stream_add_chunked_trailer(http1_stream, trailing_headers)

Add a list of headers to be added as trailing headers sent after the last chunk is sent. The stream must have specified "chunked" in a "transfer-encoding" header. The stream should also have a "Trailer" header field which indicates the fields present in the trailer.

Certain headers are forbidden in the trailer (e.g., Transfer-Encoding, Content-Length, Host). See RFC-7541 Section 4.1.2 for more details.

For client streams, activate() must be called before any chunks are submitted.

For server streams, the response must be submitted before the trailer can be added

[`aws_http1_stream_add_chunked_trailer`](@ref) must be called before the final size 0 chunk, and at the moment can only be called once, though this could change if need be.

Returns [`AWS_OP_SUCCESS`](@ref) if the chunk has been submitted.

### Prototype
```c
int aws_http1_stream_add_chunked_trailer( struct aws_http_stream *http1_stream, const struct aws_http_headers *trailing_headers);
```
"""
function aws_http1_stream_add_chunked_trailer(http1_stream, trailing_headers)
    ccall((:aws_http1_stream_add_chunked_trailer, libawscrt), Cint, (Ptr{aws_http_stream}, Ptr{aws_http_headers}), http1_stream, trailing_headers)
end

"""
    aws_http_message_get_headers(message)

Get the message's [`aws_http_headers`](@ref).

This datastructure has more functions for inspecting and modifying headers than are available on the [`aws_http_message`](@ref) datastructure.

### Prototype
```c
struct aws_http_headers *aws_http_message_get_headers(struct aws_http_message *message);
```
"""
function aws_http_message_get_headers(message)
    ccall((:aws_http_message_get_headers, libawscrt), Ptr{aws_http_headers}, (Ptr{aws_http_message},), message)
end

"""
    aws_http_message_get_const_headers(message)

Get the message's const [`aws_http_headers`](@ref).

### Prototype
```c
const struct aws_http_headers *aws_http_message_get_const_headers(const struct aws_http_message *message);
```
"""
function aws_http_message_get_const_headers(message)
    ccall((:aws_http_message_get_const_headers, libawscrt), Ptr{aws_http_headers}, (Ptr{aws_http_message},), message)
end

"""
    aws_http_message_get_header_count(message)

Get the number of headers.

### Prototype
```c
size_t aws_http_message_get_header_count(const struct aws_http_message *message);
```
"""
function aws_http_message_get_header_count(message)
    ccall((:aws_http_message_get_header_count, libawscrt), Csize_t, (Ptr{aws_http_message},), message)
end

"""
    aws_http_message_get_header(message, out_header, index)

Get the header at the specified index. This function cannot fail if a valid index is provided. Otherwise, AWS\\_ERROR\\_INVALID\\_INDEX will be raised.

The underlying strings are stored within the message.

### Prototype
```c
int aws_http_message_get_header( const struct aws_http_message *message, struct aws_http_header *out_header, size_t index);
```
"""
function aws_http_message_get_header(message, out_header, index)
    ccall((:aws_http_message_get_header, libawscrt), Cint, (Ptr{aws_http_message}, Ptr{aws_http_header}, Csize_t), message, out_header, index)
end

"""
    aws_http_message_add_header(message, header)

Add a header to the end of the array. The message makes its own copy of the underlying strings.

### Prototype
```c
int aws_http_message_add_header(struct aws_http_message *message, struct aws_http_header header);
```
"""
function aws_http_message_add_header(message, header)
    ccall((:aws_http_message_add_header, libawscrt), Cint, (Ptr{aws_http_message}, aws_http_header), message, header)
end

"""
    aws_http_message_add_header_array(message, headers, num_headers)

Add an array of headers to the end of the header array. The message makes its own copy of the underlying strings.

This is a helper function useful when it's easier to define headers as a stack array, rather than calling add\\_header repeatedly.

### Prototype
```c
int aws_http_message_add_header_array( struct aws_http_message *message, const struct aws_http_header *headers, size_t num_headers);
```
"""
function aws_http_message_add_header_array(message, headers, num_headers)
    ccall((:aws_http_message_add_header_array, libawscrt), Cint, (Ptr{aws_http_message}, Ptr{aws_http_header}, Csize_t), message, headers, num_headers)
end

"""
    aws_http_message_erase_header(message, index)

Remove the header at the specified index. Headers after this index are all shifted back one position.

This function cannot fail if a valid index is provided. Otherwise, AWS\\_ERROR\\_INVALID\\_INDEX will be raised.

### Prototype
```c
int aws_http_message_erase_header(struct aws_http_message *message, size_t index);
```
"""
function aws_http_message_erase_header(message, index)
    ccall((:aws_http_message_erase_header, libawscrt), Cint, (Ptr{aws_http_message}, Csize_t), message, index)
end

"""
    aws_http_connection_make_request(client_connection, options)

Create a stream, with a client connection sending a request. The request does not start sending automatically once the stream is created. You must call [`aws_http_stream_activate`](@ref) to begin execution of the request.

The `options` are copied during this call.

Tip for language bindings: Do not bind the `options` struct. Use something more natural for your language, such as Builder Pattern in Java, or Python's ability to take many optional arguments by name.

### Prototype
```c
struct aws_http_stream *aws_http_connection_make_request( struct aws_http_connection *client_connection, const struct aws_http_make_request_options *options);
```
"""
function aws_http_connection_make_request(client_connection, options)
    ccall((:aws_http_connection_make_request, libawscrt), Ptr{aws_http_stream}, (Ptr{aws_http_connection}, Ptr{aws_http_make_request_options}), client_connection, options)
end

"""
    aws_http_stream_new_server_request_handler(options)

Create a stream, with a server connection receiving and responding to a request. This function can only be called from the [`aws_http_on_incoming_request_fn`](@ref) callback. [`aws_http_stream_send_response`](@ref)() should be used to send a response.

### Prototype
```c
struct aws_http_stream *aws_http_stream_new_server_request_handler( const struct aws_http_request_handler_options *options);
```
"""
function aws_http_stream_new_server_request_handler(options)
    ccall((:aws_http_stream_new_server_request_handler, libawscrt), Ptr{aws_http_stream}, (Ptr{aws_http_request_handler_options},), options)
end

"""
    aws_http_stream_release(stream)

Users must release the stream when they are done with it, or its memory will never be cleaned up. This will not cancel the stream, its callbacks will still fire if the stream is still in progress.

Tips for language bindings: - Invoke this from the wrapper class's finalizer/destructor. - Do not let the wrapper class be destroyed until on\\_complete() has fired.

### Prototype
```c
void aws_http_stream_release(struct aws_http_stream *stream);
```
"""
function aws_http_stream_release(stream)
    ccall((:aws_http_stream_release, libawscrt), Cvoid, (Ptr{aws_http_stream},), stream)
end

"""
    aws_http_stream_activate(stream)

Only used for client initiated streams (immediately following a call to [`aws_http_connection_make_request`](@ref)).

Activates the request's outgoing stream processing.

### Prototype
```c
int aws_http_stream_activate(struct aws_http_stream *stream);
```
"""
function aws_http_stream_activate(stream)
    ccall((:aws_http_stream_activate, libawscrt), Cint, (Ptr{aws_http_stream},), stream)
end

"""
    aws_http_stream_get_connection(stream)

### Prototype
```c
struct aws_http_connection *aws_http_stream_get_connection(const struct aws_http_stream *stream);
```
"""
function aws_http_stream_get_connection(stream)
    ccall((:aws_http_stream_get_connection, libawscrt), Ptr{aws_http_connection}, (Ptr{aws_http_stream},), stream)
end

"""
    aws_http_stream_get_incoming_response_status(stream, out_status)

### Prototype
```c
int aws_http_stream_get_incoming_response_status(const struct aws_http_stream *stream, int *out_status);
```
"""
function aws_http_stream_get_incoming_response_status(stream, out_status)
    ccall((:aws_http_stream_get_incoming_response_status, libawscrt), Cint, (Ptr{aws_http_stream}, Ptr{Cint}), stream, out_status)
end

"""
    aws_http_stream_get_incoming_request_method(stream, out_method)

### Prototype
```c
int aws_http_stream_get_incoming_request_method( const struct aws_http_stream *stream, struct aws_byte_cursor *out_method);
```
"""
function aws_http_stream_get_incoming_request_method(stream, out_method)
    ccall((:aws_http_stream_get_incoming_request_method, libawscrt), Cint, (Ptr{aws_http_stream}, Ptr{aws_byte_cursor}), stream, out_method)
end

"""
    aws_http_stream_get_incoming_request_uri(stream, out_uri)

### Prototype
```c
int aws_http_stream_get_incoming_request_uri(const struct aws_http_stream *stream, struct aws_byte_cursor *out_uri);
```
"""
function aws_http_stream_get_incoming_request_uri(stream, out_uri)
    ccall((:aws_http_stream_get_incoming_request_uri, libawscrt), Cint, (Ptr{aws_http_stream}, Ptr{aws_byte_cursor}), stream, out_uri)
end

"""
    aws_http_stream_send_response(stream, response)

Send response (only callable from "request handler" streams) The response object must stay alive at least until the stream's on\\_complete is called.

### Prototype
```c
int aws_http_stream_send_response(struct aws_http_stream *stream, struct aws_http_message *response);
```
"""
function aws_http_stream_send_response(stream, response)
    ccall((:aws_http_stream_send_response, libawscrt), Cint, (Ptr{aws_http_stream}, Ptr{aws_http_message}), stream, response)
end

"""
    aws_http_stream_update_window(stream, increment_size)

Increment the stream's flow-control window to keep data flowing.

If the connection was created with `manual_window_management` set true, the flow-control window of each stream will shrink as body data is received (headers, padding, and other metadata do not affect the window). The connection's `initial_window_size` determines the starting size of each stream's window. If a stream's flow-control window reaches 0, no further data will be received.

If `manual_window_management` is false, this call will have no effect. The connection maintains its flow-control windows such that no back-pressure is applied and data arrives as fast as possible.

### Prototype
```c
void aws_http_stream_update_window(struct aws_http_stream *stream, size_t increment_size);
```
"""
function aws_http_stream_update_window(stream, increment_size)
    ccall((:aws_http_stream_update_window, libawscrt), Cvoid, (Ptr{aws_http_stream}, Csize_t), stream, increment_size)
end

"""
    aws_http_stream_get_id(stream)

Gets the HTTP/2 id associated with a stream. Even h1 streams have an id (using the same allocation procedure as http/2) for easier tracking purposes. For client streams, this will only be non-zero after a successful call to [`aws_http_stream_activate`](@ref)()

### Prototype
```c
uint32_t aws_http_stream_get_id(const struct aws_http_stream *stream);
```
"""
function aws_http_stream_get_id(stream)
    ccall((:aws_http_stream_get_id, libawscrt), UInt32, (Ptr{aws_http_stream},), stream)
end

"""
    aws_http2_stream_reset(http2_stream, http2_error)

Reset the HTTP/2 stream (HTTP/2 only). Note that if the stream closes before this async call is fully processed, the RST\\_STREAM frame will not be sent.

### Parameters
* `http2_stream`: HTTP/2 stream.
* `http2_error`: [`aws_http2_error_code`](@ref). Reason to reset the stream.
### Prototype
```c
int aws_http2_stream_reset(struct aws_http_stream *http2_stream, uint32_t http2_error);
```
"""
function aws_http2_stream_reset(http2_stream, http2_error)
    ccall((:aws_http2_stream_reset, libawscrt), Cint, (Ptr{aws_http_stream}, UInt32), http2_stream, http2_error)
end

"""
    aws_http2_stream_get_received_reset_error_code(http2_stream, out_http2_error)

Get the error code received in rst\\_stream. Only valid if the stream has completed, and an RST\\_STREAM frame has received.

### Parameters
* `http2_stream`: HTTP/2 stream.
* `out_http2_error`: Gets to set to HTTP/2 error code received in rst\\_stream.
### Prototype
```c
int aws_http2_stream_get_received_reset_error_code(struct aws_http_stream *http2_stream, uint32_t *out_http2_error);
```
"""
function aws_http2_stream_get_received_reset_error_code(http2_stream, out_http2_error)
    ccall((:aws_http2_stream_get_received_reset_error_code, libawscrt), Cint, (Ptr{aws_http_stream}, Ptr{UInt32}), http2_stream, out_http2_error)
end

"""
    aws_http2_stream_get_sent_reset_error_code(http2_stream, out_http2_error)

Get the HTTP/2 error code sent in the RST\\_STREAM frame (HTTP/2 only). Only valid if the stream has completed, and has sent an RST\\_STREAM frame.

### Parameters
* `http2_stream`: HTTP/2 stream.
* `out_http2_error`: Gets to set to HTTP/2 error code sent in rst\\_stream.
### Prototype
```c
int aws_http2_stream_get_sent_reset_error_code(struct aws_http_stream *http2_stream, uint32_t *out_http2_error);
```
"""
function aws_http2_stream_get_sent_reset_error_code(http2_stream, out_http2_error)
    ccall((:aws_http2_stream_get_sent_reset_error_code, libawscrt), Cint, (Ptr{aws_http_stream}, Ptr{UInt32}), http2_stream, out_http2_error)
end

"""
A listening socket which accepts incoming HTTP connections, creating a server-side [`aws_http_connection`](@ref) to handle each one.
"""
mutable struct aws_http_server end

# typedef void ( aws_http_server_on_incoming_connection_fn ) ( struct aws_http_server * server , struct aws_http_connection * connection , int error_code , void * user_data )
const aws_http_server_on_incoming_connection_fn = Cvoid

# typedef void ( aws_http_server_on_destroy_fn ) ( void * user_data )
const aws_http_server_on_destroy_fn = Cvoid

"""
    aws_server_bootstrap

[`aws_server_bootstrap`](@ref) manages listening sockets, creating and setting up channels to handle each incoming connection.
"""
struct aws_server_bootstrap
    allocator::Ptr{aws_allocator}
    event_loop_group::Ptr{aws_event_loop_group}
    on_protocol_negotiated::Ptr{Cvoid}
    ref_count::aws_ref_count
end

struct aws_socket_endpoint
    address::NTuple{108, Cchar}
    port::UInt16
end

"""
    aws_http_server_options

Options for creating an HTTP server. Initialize with [`AWS_HTTP_SERVER_OPTIONS_INIT`](@ref) to set default values.
"""
struct aws_http_server_options
    self_size::Csize_t
    allocator::Ptr{aws_allocator}
    bootstrap::Ptr{aws_server_bootstrap}
    endpoint::Ptr{aws_socket_endpoint}
    socket_options::Ptr{aws_socket_options}
    tls_options::Ptr{aws_tls_connection_options}
    initial_window_size::Csize_t
    server_user_data::Ptr{Cvoid}
    on_incoming_connection::Ptr{Cvoid}
    on_destroy_complete::Ptr{Cvoid}
    manual_window_management::Bool
end

# typedef struct aws_http_stream * ( aws_http_on_incoming_request_fn ) ( struct aws_http_connection * connection , void * user_data )
"""
Invoked at the start of an incoming request. To process the request, the user must create a request handler stream and return it to the connection. If NULL is returned, the request will not be processed and the last error will be reported as the reason for failure.
"""
const aws_http_on_incoming_request_fn = Cvoid

# typedef void ( aws_http_on_server_connection_shutdown_fn ) ( struct aws_http_connection * connection , int error_code , void * connection_user_data )
const aws_http_on_server_connection_shutdown_fn = Cvoid

"""
    aws_http_server_connection_options

Options for configuring a server-side [`aws_http_connection`](@ref). Initialized with [`AWS_HTTP_SERVER_CONNECTION_OPTIONS_INIT`](@ref) to set default values.
"""
struct aws_http_server_connection_options
    self_size::Csize_t
    connection_user_data::Ptr{Cvoid}
    on_incoming_request::Ptr{Cvoid}
    on_shutdown::Ptr{Cvoid}
end

"""
    aws_http_server_new(options)

Create server, a listening socket that accepts incoming connections.

### Prototype
```c
struct aws_http_server *aws_http_server_new(const struct aws_http_server_options *options);
```
"""
function aws_http_server_new(options)
    ccall((:aws_http_server_new, libawscrt), Ptr{aws_http_server}, (Ptr{aws_http_server_options},), options)
end

"""
    aws_http_server_release(server)

Release the server. It will close the listening socket and all the connections existing in the server. The on\\_destroy\\_complete will be invoked when the destroy operation completes

### Prototype
```c
void aws_http_server_release(struct aws_http_server *server);
```
"""
function aws_http_server_release(server)
    ccall((:aws_http_server_release, libawscrt), Cvoid, (Ptr{aws_http_server},), server)
end

"""
    aws_http_connection_configure_server(connection, options)

Configure a server connection. This must be called from the server's on\\_incoming\\_connection callback.

### Prototype
```c
int aws_http_connection_configure_server( struct aws_http_connection *connection, const struct aws_http_server_connection_options *options);
```
"""
function aws_http_connection_configure_server(connection, options)
    ccall((:aws_http_connection_configure_server, libawscrt), Cint, (Ptr{aws_http_connection}, Ptr{aws_http_server_connection_options}), connection, options)
end

"""
    aws_http_connection_is_server(connection)

Returns true if this is a server connection.

### Prototype
```c
bool aws_http_connection_is_server(const struct aws_http_connection *connection);
```
"""
function aws_http_connection_is_server(connection)
    ccall((:aws_http_connection_is_server, libawscrt), Bool, (Ptr{aws_http_connection},), connection)
end

@cenum aws_crt_http_statistics_category::UInt32 begin
    AWSCRT_STAT_CAT_HTTP1_CHANNEL = 512
end

"""
    aws_crt_statistics_http1_channel

A statistics struct for http handlers. Tracks the actual amount of time that incoming and outgoing requests are waiting for their IO to complete.
"""
struct aws_crt_statistics_http1_channel
    category::aws_crt_statistics_category_t
    pending_outgoing_stream_ms::UInt64
    pending_incoming_stream_ms::UInt64
    current_outgoing_stream_id::UInt32
    current_incoming_stream_id::UInt32
end

"""
    aws_crt_statistics_http1_channel_init(stats)

Initializes a http channel handler statistics struct

### Prototype
```c
int aws_crt_statistics_http1_channel_init(struct aws_crt_statistics_http1_channel *stats);
```
"""
function aws_crt_statistics_http1_channel_init(stats)
    ccall((:aws_crt_statistics_http1_channel_init, libawscrt), Cint, (Ptr{aws_crt_statistics_http1_channel},), stats)
end

"""
    aws_crt_statistics_http1_channel_cleanup(stats)

Cleans up a http channel handler statistics struct

### Prototype
```c
void aws_crt_statistics_http1_channel_cleanup(struct aws_crt_statistics_http1_channel *stats);
```
"""
function aws_crt_statistics_http1_channel_cleanup(stats)
    ccall((:aws_crt_statistics_http1_channel_cleanup, libawscrt), Cvoid, (Ptr{aws_crt_statistics_http1_channel},), stats)
end

"""
    aws_crt_statistics_http1_channel_reset(stats)

Resets a http channel handler statistics struct's statistics

### Prototype
```c
void aws_crt_statistics_http1_channel_reset(struct aws_crt_statistics_http1_channel *stats);
```
"""
function aws_crt_statistics_http1_channel_reset(stats)
    ccall((:aws_crt_statistics_http1_channel_reset, libawscrt), Cvoid, (Ptr{aws_crt_statistics_http1_channel},), stats)
end

"""
    aws_http_status_code

Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved. SPDX-License-Identifier: Apache-2.0.
"""
@cenum aws_http_status_code::Int32 begin
    AWS_HTTP_STATUS_CODE_UNKNOWN = -1
    AWS_HTTP_STATUS_CODE_100_CONTINUE = 100
    AWS_HTTP_STATUS_CODE_101_SWITCHING_PROTOCOLS = 101
    AWS_HTTP_STATUS_CODE_102_PROCESSING = 102
    AWS_HTTP_STATUS_CODE_103_EARLY_HINTS = 103
    AWS_HTTP_STATUS_CODE_200_OK = 200
    AWS_HTTP_STATUS_CODE_201_CREATED = 201
    AWS_HTTP_STATUS_CODE_202_ACCEPTED = 202
    AWS_HTTP_STATUS_CODE_203_NON_AUTHORITATIVE_INFORMATION = 203
    AWS_HTTP_STATUS_CODE_204_NO_CONTENT = 204
    AWS_HTTP_STATUS_CODE_205_RESET_CONTENT = 205
    AWS_HTTP_STATUS_CODE_206_PARTIAL_CONTENT = 206
    AWS_HTTP_STATUS_CODE_207_MULTI_STATUS = 207
    AWS_HTTP_STATUS_CODE_208_ALREADY_REPORTED = 208
    AWS_HTTP_STATUS_CODE_226_IM_USED = 226
    AWS_HTTP_STATUS_CODE_300_MULTIPLE_CHOICES = 300
    AWS_HTTP_STATUS_CODE_301_MOVED_PERMANENTLY = 301
    AWS_HTTP_STATUS_CODE_302_FOUND = 302
    AWS_HTTP_STATUS_CODE_303_SEE_OTHER = 303
    AWS_HTTP_STATUS_CODE_304_NOT_MODIFIED = 304
    AWS_HTTP_STATUS_CODE_305_USE_PROXY = 305
    AWS_HTTP_STATUS_CODE_307_TEMPORARY_REDIRECT = 307
    AWS_HTTP_STATUS_CODE_308_PERMANENT_REDIRECT = 308
    AWS_HTTP_STATUS_CODE_400_BAD_REQUEST = 400
    AWS_HTTP_STATUS_CODE_401_UNAUTHORIZED = 401
    AWS_HTTP_STATUS_CODE_402_PAYMENT_REQUIRED = 402
    AWS_HTTP_STATUS_CODE_403_FORBIDDEN = 403
    AWS_HTTP_STATUS_CODE_404_NOT_FOUND = 404
    AWS_HTTP_STATUS_CODE_405_METHOD_NOT_ALLOWED = 405
    AWS_HTTP_STATUS_CODE_406_NOT_ACCEPTABLE = 406
    AWS_HTTP_STATUS_CODE_407_PROXY_AUTHENTICATION_REQUIRED = 407
    AWS_HTTP_STATUS_CODE_408_REQUEST_TIMEOUT = 408
    AWS_HTTP_STATUS_CODE_409_CONFLICT = 409
    AWS_HTTP_STATUS_CODE_410_GONE = 410
    AWS_HTTP_STATUS_CODE_411_LENGTH_REQUIRED = 411
    AWS_HTTP_STATUS_CODE_412_PRECONDITION_FAILED = 412
    AWS_HTTP_STATUS_CODE_413_REQUEST_ENTITY_TOO_LARGE = 413
    AWS_HTTP_STATUS_CODE_414_REQUEST_URI_TOO_LONG = 414
    AWS_HTTP_STATUS_CODE_415_UNSUPPORTED_MEDIA_TYPE = 415
    AWS_HTTP_STATUS_CODE_416_REQUESTED_RANGE_NOT_SATISFIABLE = 416
    AWS_HTTP_STATUS_CODE_417_EXPECTATION_FAILED = 417
    AWS_HTTP_STATUS_CODE_421_MISDIRECTED_REQUEST = 421
    AWS_HTTP_STATUS_CODE_422_UNPROCESSABLE_ENTITY = 422
    AWS_HTTP_STATUS_CODE_423_LOCKED = 423
    AWS_HTTP_STATUS_CODE_424_FAILED_DEPENDENCY = 424
    AWS_HTTP_STATUS_CODE_425_TOO_EARLY = 425
    AWS_HTTP_STATUS_CODE_426_UPGRADE_REQUIRED = 426
    AWS_HTTP_STATUS_CODE_428_PRECONDITION_REQUIRED = 428
    AWS_HTTP_STATUS_CODE_429_TOO_MANY_REQUESTS = 429
    AWS_HTTP_STATUS_CODE_431_REQUEST_HEADER_FIELDS_TOO_LARGE = 431
    AWS_HTTP_STATUS_CODE_451_UNAVAILABLE_FOR_LEGAL_REASON = 451
    AWS_HTTP_STATUS_CODE_500_INTERNAL_SERVER_ERROR = 500
    AWS_HTTP_STATUS_CODE_501_NOT_IMPLEMENTED = 501
    AWS_HTTP_STATUS_CODE_502_BAD_GATEWAY = 502
    AWS_HTTP_STATUS_CODE_503_SERVICE_UNAVAILABLE = 503
    AWS_HTTP_STATUS_CODE_504_GATEWAY_TIMEOUT = 504
    AWS_HTTP_STATUS_CODE_505_HTTP_VERSION_NOT_SUPPORTED = 505
    AWS_HTTP_STATUS_CODE_506_VARIANT_ALSO_NEGOTIATES = 506
    AWS_HTTP_STATUS_CODE_507_INSUFFICIENT_STORAGE = 507
    AWS_HTTP_STATUS_CODE_508_LOOP_DETECTED = 508
    AWS_HTTP_STATUS_CODE_510_NOT_EXTENDED = 510
    AWS_HTTP_STATUS_CODE_511_NETWORK_AUTHENTICATION_REQUIRED = 511
end

"""
A websocket connection.
"""
mutable struct aws_websocket end

"""
    aws_websocket_opcode

Opcode describing the type of a websocket frame. RFC-6455 Section 5.2
"""
@cenum aws_websocket_opcode::UInt32 begin
    AWS_WEBSOCKET_OPCODE_CONTINUATION = 0
    AWS_WEBSOCKET_OPCODE_TEXT = 1
    AWS_WEBSOCKET_OPCODE_BINARY = 2
    AWS_WEBSOCKET_OPCODE_CLOSE = 8
    AWS_WEBSOCKET_OPCODE_PING = 9
    AWS_WEBSOCKET_OPCODE_PONG = 10
end

# typedef void ( aws_websocket_on_connection_setup_fn ) ( struct aws_websocket * websocket , int error_code , int handshake_response_status , const struct aws_http_header * handshake_response_header_array , size_t num_handshake_response_headers , void * user_data )
"""
Called when websocket setup is complete. An error\\_code of zero indicates that setup was completely successful. Called exactly once on the websocket's event-loop thread.

websocket: if successful, a valid pointer to the websocket, otherwise NULL. error\\_code: the operation was completely successful if this value is zero. handshake\\_response\\_status: The response status code of the HTTP handshake, 101 if successful, -1 if the connection failed before a response was received. handshake\\_response\\_header\\_array: Headers from the HTTP handshake response. May be NULL if num\\_handshake\\_response\\_headers is 0. Copy if necessary, this memory becomes invalid once the callback completes. num\\_handshake\\_response\\_headers: Number of entries in handshake\\_response\\_header\\_array. May be 0 if the response did not complete, or was invalid.
"""
const aws_websocket_on_connection_setup_fn = Cvoid

# typedef void ( aws_websocket_on_connection_shutdown_fn ) ( struct aws_websocket * websocket , int error_code , void * user_data )
"""
Called when the websocket has finished shutting down. Called once on the websocket's event-loop thread if setup succeeded. If setup failed, this is never called.
"""
const aws_websocket_on_connection_shutdown_fn = Cvoid

"""
    aws_websocket_incoming_frame

Data about an incoming frame. See RFC-6455 Section 5.2.
"""
struct aws_websocket_incoming_frame
    payload_length::UInt64
    opcode::UInt8
    fin::Bool
    rsv::NTuple{3, Bool}
end

# typedef bool ( aws_websocket_on_incoming_frame_begin_fn ) ( struct aws_websocket * websocket , const struct aws_websocket_incoming_frame * frame , void * user_data )
"""
Called when a new frame arrives. Invoked once per frame on the websocket's event-loop thread. Each incoming-frame-begin call will eventually be followed by an incoming-frame-complete call, before the next frame begins and before the websocket shuts down.

Return true to proceed normally. If false is returned, the websocket will read no further data, the frame will complete with an error-code, and the connection will close.
"""
const aws_websocket_on_incoming_frame_begin_fn = Cvoid

# typedef bool ( aws_websocket_on_incoming_frame_payload_fn ) ( struct aws_websocket * websocket , const struct aws_websocket_incoming_frame * frame , struct aws_byte_cursor data , void * user_data )
"""
Called repeatedly as payload data arrives. Invoked 0 or more times on the websocket's event-loop thread. Payload data will not be valid after this call, so copy if necessary. The payload data is always unmasked at this point.

Return true to proceed normally. If false is returned, the websocket will read no further data, the frame will complete with an error-code, and the connection will close.
"""
const aws_websocket_on_incoming_frame_payload_fn = Cvoid

# typedef bool ( aws_websocket_on_incoming_frame_complete_fn ) ( struct aws_websocket * websocket , const struct aws_websocket_incoming_frame * frame , int error_code , void * user_data )
"""
Called when done processing an incoming frame. If error\\_code is non-zero, an error occurred and the payload may not have been completely received. Invoked once per frame on the websocket's event-loop thread.

Return true to proceed normally. If false is returned, the websocket will read no further data and the connection will close.
"""
const aws_websocket_on_incoming_frame_complete_fn = Cvoid

"""
    aws_websocket_client_connection_options

Options for creating a websocket client connection.
"""
struct aws_websocket_client_connection_options
    allocator::Ptr{aws_allocator}
    bootstrap::Ptr{aws_client_bootstrap}
    socket_options::Ptr{aws_socket_options}
    tls_options::Ptr{aws_tls_connection_options}
    proxy_options::Ptr{aws_http_proxy_options}
    host::aws_byte_cursor
    port::UInt16
    handshake_request::Ptr{aws_http_message}
    initial_window_size::Csize_t
    user_data::Ptr{Cvoid}
    on_connection_setup::Ptr{Cvoid}
    on_connection_shutdown::Ptr{Cvoid}
    on_incoming_frame_begin::Ptr{Cvoid}
    on_incoming_frame_payload::Ptr{Cvoid}
    on_incoming_frame_complete::Ptr{Cvoid}
    manual_window_management::Bool
end

# typedef bool ( aws_websocket_stream_outgoing_payload_fn ) ( struct aws_websocket * websocket , struct aws_byte_buf * out_buf , void * user_data )
"""
Called repeatedly as the websocket's payload is streamed out. The user should write payload data to out\\_buf, up to available capacity. The websocket will mask this data for you, if necessary. Invoked repeatedly on the websocket's event-loop thread.

Return true to proceed normally. If false is returned, the websocket will send no further data, the frame will complete with an error-code, and the connection will close.
"""
const aws_websocket_stream_outgoing_payload_fn = Cvoid

# typedef void ( aws_websocket_outgoing_frame_complete_fn ) ( struct aws_websocket * websocket , int error_code , void * user_data )
"""
Called when a [`aws_websocket_send_frame`](@ref)() operation completes. error\\_code will be zero if the operation was successful. "Success" does not guarantee that the peer actually received or processed the frame. Invoked exactly once per sent frame on the websocket's event-loop thread.
"""
const aws_websocket_outgoing_frame_complete_fn = Cvoid

"""
    aws_websocket_send_frame_options

Options for sending a websocket frame. This structure is copied immediately by aws\\_websocket\\_send(). For descriptions of opcode, fin, rsv, and payload\\_length see in RFC-6455 Section 5.2.
"""
struct aws_websocket_send_frame_options
    payload_length::UInt64
    user_data::Ptr{Cvoid}
    stream_outgoing_payload::Ptr{Cvoid}
    on_complete::Ptr{Cvoid}
    opcode::UInt8
    fin::Bool
    high_priority::Bool
    rsv::NTuple{3, Bool}
end

"""
    aws_websocket_is_data_frame(opcode)

Return true if opcode is for a data frame, false if opcode if for a control frame.

### Prototype
```c
bool aws_websocket_is_data_frame(uint8_t opcode);
```
"""
function aws_websocket_is_data_frame(opcode)
    ccall((:aws_websocket_is_data_frame, libawscrt), Bool, (UInt8,), opcode)
end

"""
    aws_websocket_client_connect(options)

Asynchronously establish a client websocket connection. The on\\_connection\\_setup callback is invoked when the operation has finished creating a connection, or failed.

### Prototype
```c
int aws_websocket_client_connect(const struct aws_websocket_client_connection_options *options);
```
"""
function aws_websocket_client_connect(options)
    ccall((:aws_websocket_client_connect, libawscrt), Cint, (Ptr{aws_websocket_client_connection_options},), options)
end

"""
    aws_websocket_release(websocket)

Users must release the websocket when they are done with it. The websocket's memory cannot be reclaimed until this is done. If the websocket connection was not already shutting down, it will be shut down. Callbacks may continue firing after this is called, with "shutdown" being the final callback. This function may be called from any thread.

### Prototype
```c
void aws_websocket_release(struct aws_websocket *websocket);
```
"""
function aws_websocket_release(websocket)
    ccall((:aws_websocket_release, libawscrt), Cvoid, (Ptr{aws_websocket},), websocket)
end

"""
    aws_websocket_close(websocket, free_scarce_resources_immediately)

Close the websocket connection. It is safe to call this, even if the connection is already closed or closing. The websocket will attempt to send a CLOSE frame during normal shutdown. If `free_scarce_resources_immediately` is true, the connection will be torn down as quickly as possible. This function may be called from any thread.

### Prototype
```c
void aws_websocket_close(struct aws_websocket *websocket, bool free_scarce_resources_immediately);
```
"""
function aws_websocket_close(websocket, free_scarce_resources_immediately)
    ccall((:aws_websocket_close, libawscrt), Cvoid, (Ptr{aws_websocket}, Bool), websocket, free_scarce_resources_immediately)
end

"""
    aws_websocket_send_frame(websocket, options)

Send a websocket frame. The `options` struct is copied. A callback will be invoked when the operation completes. This function may be called from any thread.

### Prototype
```c
int aws_websocket_send_frame(struct aws_websocket *websocket, const struct aws_websocket_send_frame_options *options);
```
"""
function aws_websocket_send_frame(websocket, options)
    ccall((:aws_websocket_send_frame, libawscrt), Cint, (Ptr{aws_websocket}, Ptr{aws_websocket_send_frame_options}), websocket, options)
end

"""
    aws_websocket_increment_read_window(websocket, size)

Manually increment the read window. The read window shrinks as payload data is received, and reading stops when its size reaches 0. Note that the read window can also be controlled from the [`aws_websocket_on_incoming_frame_payload_fn`](@ref)(), callback, by manipulating the `out_increment_window` argument. This function may be called from any thread.

### Prototype
```c
void aws_websocket_increment_read_window(struct aws_websocket *websocket, size_t size);
```
"""
function aws_websocket_increment_read_window(websocket, size)
    ccall((:aws_websocket_increment_read_window, libawscrt), Cvoid, (Ptr{aws_websocket}, Csize_t), websocket, size)
end

"""
    aws_websocket_convert_to_midchannel_handler(websocket)

Convert the websocket into a mid-channel handler. The websocket will stop being usable via its public API and become just another handler in the channel. The caller will likely install a channel handler to the right. This must not be called in the middle of an incoming frame (between "frame begin" and "frame complete" callbacks). This MUST be called from the websocket's thread.

If successful: - Other than [`aws_websocket_release`](@ref)(), all calls to aws\\_websocket\\_x() functions are ignored. - The websocket will no longer invoke any "incoming frame" callbacks. - aws\\_io\\_messages written by a downstream handler will be wrapped in binary data frames and sent upstream. The data may be split/combined as it is sent along. - aws\\_io\\_messages read from upstream handlers will be scanned for binary data frames. The payloads of these frames will be sent downstream. The payloads may be split/combined as they are sent along. - An incoming close frame will automatically result in channel-shutdown. - [`aws_websocket_release`](@ref)() must still be called or the websocket and its channel will never be cleaned up. - The websocket will still invoke its "on connection shutdown" callback when channel shutdown completes.

If unsuccessful, NULL is returned and the websocket is unchanged.

### Prototype
```c
int aws_websocket_convert_to_midchannel_handler(struct aws_websocket *websocket);
```
"""
function aws_websocket_convert_to_midchannel_handler(websocket)
    ccall((:aws_websocket_convert_to_midchannel_handler, libawscrt), Cint, (Ptr{aws_websocket},), websocket)
end

"""
    aws_websocket_get_channel(websocket)

Returns the websocket's underlying I/O channel.

### Prototype
```c
struct aws_channel *aws_websocket_get_channel(const struct aws_websocket *websocket);
```
"""
function aws_websocket_get_channel(websocket)
    ccall((:aws_websocket_get_channel, libawscrt), Ptr{aws_channel}, (Ptr{aws_websocket},), websocket)
end

"""
    aws_websocket_random_handshake_key(dst)

Generate value for a Sec-WebSocket-Key header and write it into `dst` buffer. The buffer should have at least [`AWS_WEBSOCKET_MAX_HANDSHAKE_KEY_LENGTH`](@ref) space available.

This value is the base64 encoding of a random 16-byte value. RFC-6455 Section 4.1

### Prototype
```c
int aws_websocket_random_handshake_key(struct aws_byte_buf *dst);
```
"""
function aws_websocket_random_handshake_key(dst)
    ccall((:aws_websocket_random_handshake_key, libawscrt), Cint, (Ptr{aws_byte_buf},), dst)
end

"""
    aws_http_message_new_websocket_handshake_request(allocator, path, host)

Create request with all required fields for a websocket upgrade request. The method and path are set, and the the following headers are added:

Host: <host> Upgrade: websocket Connection: Upgrade Sec-WebSocket-Key: <base64 encoding of 16 random bytes> Sec-WebSocket-Version: 13

### Prototype
```c
struct aws_http_message *aws_http_message_new_websocket_handshake_request( struct aws_allocator *allocator, struct aws_byte_cursor path, struct aws_byte_cursor host);
```
"""
function aws_http_message_new_websocket_handshake_request(allocator, path, host)
    ccall((:aws_http_message_new_websocket_handshake_request, libawscrt), Ptr{aws_http_message}, (Ptr{aws_allocator}, aws_byte_cursor, aws_byte_cursor), allocator, path, host)
end

@cenum aws_channel_direction::UInt32 begin
    AWS_CHANNEL_DIR_READ = 0
    AWS_CHANNEL_DIR_WRITE = 1
end

# typedef void ( aws_channel_on_setup_completed_fn ) ( struct aws_channel * channel , int error_code , void * user_data )
const aws_channel_on_setup_completed_fn = Cvoid

# typedef void ( aws_channel_on_shutdown_completed_fn ) ( struct aws_channel * channel , int error_code , void * user_data )
const aws_channel_on_shutdown_completed_fn = Cvoid

struct aws_channel_slot
    alloc::Ptr{aws_allocator}
    channel::Ptr{aws_channel}
    adj_left::Ptr{aws_channel_slot}
    adj_right::Ptr{aws_channel_slot}
    handler::Ptr{Cvoid} # handler::Ptr{aws_channel_handler}
    window_size::Csize_t
    upstream_message_overhead::Csize_t
    current_window_update_batch_size::Csize_t
end

function Base.getproperty(x::aws_channel_slot, f::Symbol)
    f === :handler && return Ptr{aws_channel_handler}(getfield(x, f))
    return getfield(x, f)
end

# typedef void ( aws_channel_task_fn ) ( struct aws_channel_task * channel_task , void * arg , enum aws_task_status status )
const aws_channel_task_fn = Cvoid

struct aws_channel_task
    data::NTuple{104, UInt8}
end

function Base.getproperty(x::Ptr{aws_channel_task}, f::Symbol)
    f === :wrapper_task && return Ptr{aws_task}(x + 0)
    f === :task_fn && return Ptr{Ptr{Cvoid}}(x + 64)
    f === :arg && return Ptr{Ptr{Cvoid}}(x + 72)
    f === :type_tag && return Ptr{Ptr{Cchar}}(x + 80)
    f === :node && return Ptr{aws_linked_list_node}(x + 88)
    return getfield(x, f)
end

function Base.getproperty(x::aws_channel_task, f::Symbol)
    r = Ref{aws_channel_task}(x)
    ptr = Base.unsafe_convert(Ptr{aws_channel_task}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{aws_channel_task}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct aws_channel_handler_vtable
    process_read_message::Ptr{Cvoid}
    process_write_message::Ptr{Cvoid}
    increment_read_window::Ptr{Cvoid}
    shutdown::Ptr{Cvoid}
    initial_window_size::Ptr{Cvoid}
    message_overhead::Ptr{Cvoid}
    destroy::Ptr{Cvoid}
    reset_statistics::Ptr{Cvoid}
    gather_statistics::Ptr{Cvoid}
    trigger_read::Ptr{Cvoid}
end

struct aws_channel_handler
    vtable::Ptr{aws_channel_handler_vtable}
    alloc::Ptr{aws_allocator}
    slot::Ptr{aws_channel_slot}
    impl::Ptr{Cvoid}
end

"""
    aws_channel_options

Args for creating a new channel. event\\_loop to use for IO and tasks. on\\_setup\\_completed will be invoked when the setup process is finished It will be executed in the event loop's thread. on\\_shutdown\\_completed will be executed upon channel shutdown.

enable\\_read\\_back\\_pressure toggles whether or not back pressure will be applied in the channel. Leave this option off unless you're using something like reactive-streams, since it is a slight throughput penalty.

Unless otherwise specified all functions for channels and channel slots must be executed within that channel's event-loop's thread.
"""
struct aws_channel_options
    event_loop::Ptr{aws_event_loop}
    on_setup_completed::Ptr{Cvoid}
    on_shutdown_completed::Ptr{Cvoid}
    setup_user_data::Ptr{Cvoid}
    shutdown_user_data::Ptr{Cvoid}
    enable_read_back_pressure::Bool
end

"""
    aws_channel_task_init(channel_task, task_fn, arg, type_tag)

Initializes channel\\_task for use.

### Prototype
```c
void aws_channel_task_init( struct aws_channel_task *channel_task, aws_channel_task_fn *task_fn, void *arg, const char *type_tag);
```
"""
function aws_channel_task_init(channel_task, task_fn, arg, type_tag)
    ccall((:aws_channel_task_init, libawscrt), Cvoid, (Ptr{aws_channel_task}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cchar}), channel_task, task_fn, arg, type_tag)
end

"""
    aws_channel_new(allocator, creation_args)

Allocates new channel, Unless otherwise specified all functions for channels and channel slots must be executed within that channel's event-loop's thread. channel\\_options are copied.

### Prototype
```c
struct aws_channel *aws_channel_new(struct aws_allocator *allocator, const struct aws_channel_options *creation_args);
```
"""
function aws_channel_new(allocator, creation_args)
    ccall((:aws_channel_new, libawscrt), Ptr{aws_channel}, (Ptr{aws_allocator}, Ptr{aws_channel_options}), allocator, creation_args)
end

"""
    aws_channel_destroy(channel)

Mark the channel, along with all slots and handlers, for destruction. Must be called after shutdown has completed. Can be called from any thread assuming '[`aws_channel_shutdown`](@ref)()' has completed. Note that memory will not be freed until all users which acquired holds on the channel via [`aws_channel_acquire_hold`](@ref)(), release them via [`aws_channel_release_hold`](@ref)().

### Prototype
```c
void aws_channel_destroy(struct aws_channel *channel);
```
"""
function aws_channel_destroy(channel)
    ccall((:aws_channel_destroy, libawscrt), Cvoid, (Ptr{aws_channel},), channel)
end

"""
    aws_channel_shutdown(channel, error_code)

Initiates shutdown of the channel. Shutdown will begin with the left-most slot. Each handler will invoke '[`aws_channel_slot_on_handler_shutdown_complete`](@ref)' once they've finished their shutdown process for the read direction. Once the right-most slot has shutdown in the read direction, the process will start shutting down starting on the right-most slot. Once the left-most slot has shutdown in the write direction, 'callbacks->shutdown\\_completed' will be invoked in the event loop's thread.

This function can be called from any thread.

### Prototype
```c
int aws_channel_shutdown(struct aws_channel *channel, int error_code);
```
"""
function aws_channel_shutdown(channel, error_code)
    ccall((:aws_channel_shutdown, libawscrt), Cint, (Ptr{aws_channel}, Cint), channel, error_code)
end

"""
    aws_channel_acquire_hold(channel)

Prevent a channel's memory from being freed. Any number of users may acquire a hold to prevent a channel and its handlers from being unexpectedly freed. Any user which acquires a hold must release it via [`aws_channel_release_hold`](@ref)(). Memory will be freed once all holds are released and [`aws_channel_destroy`](@ref)() has been called.

### Prototype
```c
void aws_channel_acquire_hold(struct aws_channel *channel);
```
"""
function aws_channel_acquire_hold(channel)
    ccall((:aws_channel_acquire_hold, libawscrt), Cvoid, (Ptr{aws_channel},), channel)
end

"""
    aws_channel_release_hold(channel)

Release a hold on the channel's memory, allowing it to be freed. This may be called before or after [`aws_channel_destroy`](@ref)().

### Prototype
```c
void aws_channel_release_hold(struct aws_channel *channel);
```
"""
function aws_channel_release_hold(channel)
    ccall((:aws_channel_release_hold, libawscrt), Cvoid, (Ptr{aws_channel},), channel)
end

"""
    aws_channel_slot_new(channel)

Allocates and initializes a new slot for use with the channel. If this is the first slot in the channel, it will automatically be added to the channel as the first slot. For all subsequent calls on a given channel, the slot will need to be added to the channel via. the [`aws_channel_slot_insert_right`](@ref)(), [`aws_channel_slot_insert_end`](@ref)(), and [`aws_channel_slot_insert_left`](@ref)() APIs.

### Prototype
```c
struct aws_channel_slot *aws_channel_slot_new(struct aws_channel *channel);
```
"""
function aws_channel_slot_new(channel)
    ccall((:aws_channel_slot_new, libawscrt), Ptr{aws_channel_slot}, (Ptr{aws_channel},), channel)
end

"""
    aws_channel_get_event_loop(channel)

Fetches the event loop the channel is a part of.

### Prototype
```c
struct aws_event_loop *aws_channel_get_event_loop(struct aws_channel *channel);
```
"""
function aws_channel_get_event_loop(channel)
    ccall((:aws_channel_get_event_loop, libawscrt), Ptr{aws_event_loop}, (Ptr{aws_channel},), channel)
end

"""
    aws_channel_current_clock_time(channel, time_nanos)

Fetches the current timestamp from the event-loop's clock, in nanoseconds.

### Prototype
```c
int aws_channel_current_clock_time(struct aws_channel *channel, uint64_t *time_nanos);
```
"""
function aws_channel_current_clock_time(channel, time_nanos)
    ccall((:aws_channel_current_clock_time, libawscrt), Cint, (Ptr{aws_channel}, Ptr{UInt64}), channel, time_nanos)
end

struct aws_event_loop_local_object
    key::Ptr{Cvoid}
    object::Ptr{Cvoid}
    on_object_removed::Ptr{Cvoid}
end

"""
    aws_channel_fetch_local_object(channel, key, obj)

Retrieves an object by key from the event loop's local storage.

### Prototype
```c
int aws_channel_fetch_local_object( struct aws_channel *channel, const void *key, struct aws_event_loop_local_object *obj);
```
"""
function aws_channel_fetch_local_object(channel, key, obj)
    ccall((:aws_channel_fetch_local_object, libawscrt), Cint, (Ptr{aws_channel}, Ptr{Cvoid}, Ptr{aws_event_loop_local_object}), channel, key, obj)
end

"""
    aws_channel_put_local_object(channel, key, obj)

Stores an object by key in the event loop's local storage.

### Prototype
```c
int aws_channel_put_local_object( struct aws_channel *channel, const void *key, const struct aws_event_loop_local_object *obj);
```
"""
function aws_channel_put_local_object(channel, key, obj)
    ccall((:aws_channel_put_local_object, libawscrt), Cint, (Ptr{aws_channel}, Ptr{Cvoid}, Ptr{aws_event_loop_local_object}), channel, key, obj)
end

"""
    aws_channel_remove_local_object(channel, key, removed_obj)

Removes an object by key from the event loop's local storage.

### Prototype
```c
int aws_channel_remove_local_object( struct aws_channel *channel, const void *key, struct aws_event_loop_local_object *removed_obj);
```
"""
function aws_channel_remove_local_object(channel, key, removed_obj)
    ccall((:aws_channel_remove_local_object, libawscrt), Cint, (Ptr{aws_channel}, Ptr{Cvoid}, Ptr{aws_event_loop_local_object}), channel, key, removed_obj)
end

@cenum aws_io_message_type::UInt32 begin
    AWS_IO_MESSAGE_APPLICATION_DATA = 0
end

struct aws_io_message
    allocator::Ptr{aws_allocator}
    message_data::aws_byte_buf
    message_type::aws_io_message_type
    message_tag::Cint
    copy_mark::Csize_t
    owning_channel::Ptr{aws_channel}
    on_completion::Ptr{Cvoid}
    user_data::Ptr{Cvoid}
    queueing_handle::aws_linked_list_node
end

"""
    aws_channel_acquire_message_from_pool(channel, message_type, size_hint)

Acquires a message from the event loop's message pool. size\\_hint is merely a hint, it may be smaller than you requested and you are responsible for checking the bounds of it. If the returned message is not large enough, you must send multiple messages.

### Prototype
```c
struct aws_io_message *aws_channel_acquire_message_from_pool( struct aws_channel *channel, enum aws_io_message_type message_type, size_t size_hint);
```
"""
function aws_channel_acquire_message_from_pool(channel, message_type, size_hint)
    ccall((:aws_channel_acquire_message_from_pool, libawscrt), Ptr{aws_io_message}, (Ptr{aws_channel}, aws_io_message_type, Csize_t), channel, message_type, size_hint)
end

"""
    aws_channel_schedule_task_now(channel, task)

Schedules a task to run on the event loop as soon as possible. This is the ideal way to move a task into the correct thread. It's also handy for context switches. This function is safe to call from any thread.

The task should not be cleaned up or modified until its function is executed.

### Prototype
```c
void aws_channel_schedule_task_now(struct aws_channel *channel, struct aws_channel_task *task);
```
"""
function aws_channel_schedule_task_now(channel, task)
    ccall((:aws_channel_schedule_task_now, libawscrt), Cvoid, (Ptr{aws_channel}, Ptr{aws_channel_task}), channel, task)
end

"""
    aws_channel_schedule_task_future(channel, task, run_at_nanos)

Schedules a task to run on the event loop at the specified time. This is the ideal way to move a task into the correct thread. It's also handy for context switches. Use [`aws_channel_current_clock_time`](@ref)() to get the current time in nanoseconds. This function is safe to call from any thread.

The task should not be cleaned up or modified until its function is executed.

### Prototype
```c
void aws_channel_schedule_task_future( struct aws_channel *channel, struct aws_channel_task *task, uint64_t run_at_nanos);
```
"""
function aws_channel_schedule_task_future(channel, task, run_at_nanos)
    ccall((:aws_channel_schedule_task_future, libawscrt), Cvoid, (Ptr{aws_channel}, Ptr{aws_channel_task}, UInt64), channel, task, run_at_nanos)
end

"""
    aws_channel_set_statistics_handler(channel, handler)

Instrument a channel with a statistics handler. While instrumented with a statistics handler, the channel will periodically report per-channel-handler-specific statistics about handler performance and state.

Assigning a statistics handler to a channel is a transfer of ownership -- the channel will clean up the handler appropriately. Statistics handlers may be changed dynamically (for example, the upgrade from a vanilla http channel to a websocket channel), but this function may only be called from the event loop thread that the channel is a part of.

The first possible hook to set a statistics handler is the channel's creation callback.

### Prototype
```c
int aws_channel_set_statistics_handler(struct aws_channel *channel, struct aws_crt_statistics_handler *handler);
```
"""
function aws_channel_set_statistics_handler(channel, handler)
    ccall((:aws_channel_set_statistics_handler, libawscrt), Cint, (Ptr{aws_channel}, Ptr{aws_crt_statistics_handler}), channel, handler)
end

"""
    aws_channel_thread_is_callers_thread(channel)

Returns true if the caller is on the event loop's thread. If false, you likely need to use aws\\_channel\\_schedule\\_task(). This function is safe to call from any thread.

### Prototype
```c
bool aws_channel_thread_is_callers_thread(struct aws_channel *channel);
```
"""
function aws_channel_thread_is_callers_thread(channel)
    ccall((:aws_channel_thread_is_callers_thread, libawscrt), Bool, (Ptr{aws_channel},), channel)
end

"""
    aws_channel_slot_set_handler(slot, handler)

Sets the handler for a slot, the slot will also call get\\_current\\_window\\_size() and propagate a window update upstream.

### Prototype
```c
int aws_channel_slot_set_handler(struct aws_channel_slot *slot, struct aws_channel_handler *handler);
```
"""
function aws_channel_slot_set_handler(slot, handler)
    ccall((:aws_channel_slot_set_handler, libawscrt), Cint, (Ptr{aws_channel_slot}, Ptr{aws_channel_handler}), slot, handler)
end

"""
    aws_channel_slot_remove(slot)

Removes slot from the channel and deallocates the slot and its handler.

### Prototype
```c
int aws_channel_slot_remove(struct aws_channel_slot *slot);
```
"""
function aws_channel_slot_remove(slot)
    ccall((:aws_channel_slot_remove, libawscrt), Cint, (Ptr{aws_channel_slot},), slot)
end

"""
    aws_channel_slot_replace(remove, new_slot)

Replaces remove with new\\_slot. Deallocates remove and its handler.

### Prototype
```c
int aws_channel_slot_replace(struct aws_channel_slot *remove, struct aws_channel_slot *new_slot);
```
"""
function aws_channel_slot_replace(remove, new_slot)
    ccall((:aws_channel_slot_replace, libawscrt), Cint, (Ptr{aws_channel_slot}, Ptr{aws_channel_slot}), remove, new_slot)
end

"""
    aws_channel_slot_insert_right(slot, to_add)

inserts 'to\\_add' to the position immediately to the right of slot. Note that the first call to [`aws_channel_slot_new`](@ref)() adds it to the channel implicitly.

### Prototype
```c
int aws_channel_slot_insert_right(struct aws_channel_slot *slot, struct aws_channel_slot *to_add);
```
"""
function aws_channel_slot_insert_right(slot, to_add)
    ccall((:aws_channel_slot_insert_right, libawscrt), Cint, (Ptr{aws_channel_slot}, Ptr{aws_channel_slot}), slot, to_add)
end

"""
    aws_channel_slot_insert_end(channel, to_add)

Inserts to 'to\\_add' the end of the channel. Note that the first call to [`aws_channel_slot_new`](@ref)() adds it to the channel implicitly.

### Prototype
```c
int aws_channel_slot_insert_end(struct aws_channel *channel, struct aws_channel_slot *to_add);
```
"""
function aws_channel_slot_insert_end(channel, to_add)
    ccall((:aws_channel_slot_insert_end, libawscrt), Cint, (Ptr{aws_channel}, Ptr{aws_channel_slot}), channel, to_add)
end

"""
    aws_channel_slot_insert_left(slot, to_add)

inserts 'to\\_add' to the position immediately to the left of slot. Note that the first call to [`aws_channel_slot_new`](@ref)() adds it to the channel implicitly.

### Prototype
```c
int aws_channel_slot_insert_left(struct aws_channel_slot *slot, struct aws_channel_slot *to_add);
```
"""
function aws_channel_slot_insert_left(slot, to_add)
    ccall((:aws_channel_slot_insert_left, libawscrt), Cint, (Ptr{aws_channel_slot}, Ptr{aws_channel_slot}), slot, to_add)
end

"""
    aws_channel_slot_send_message(slot, message, dir)

Sends a message to the adjacent slot in the channel based on dir. Also does window size checking.

NOTE: if this function returns an error code, it is the caller's responsibility to release message back to the pool. If this function returns [`AWS_OP_SUCCESS`](@ref), the recipient of the message has taken ownership of the message. So, for example, don't release a message to the pool and then return an error. If you encounter an error condition in this case, shutdown the channel with the appropriate error code.

### Prototype
```c
int aws_channel_slot_send_message( struct aws_channel_slot *slot, struct aws_io_message *message, enum aws_channel_direction dir);
```
"""
function aws_channel_slot_send_message(slot, message, dir)
    ccall((:aws_channel_slot_send_message, libawscrt), Cint, (Ptr{aws_channel_slot}, Ptr{aws_io_message}, aws_channel_direction), slot, message, dir)
end

"""
    aws_channel_slot_acquire_max_message_for_write(slot)

Convenience function that invokes [`aws_channel_acquire_message_from_pool`](@ref)(), asking for the largest reasonable DATA message that can be sent in the write direction, with upstream overhead accounted for.

### Prototype
```c
struct aws_io_message *aws_channel_slot_acquire_max_message_for_write(struct aws_channel_slot *slot);
```
"""
function aws_channel_slot_acquire_max_message_for_write(slot)
    ccall((:aws_channel_slot_acquire_max_message_for_write, libawscrt), Ptr{aws_io_message}, (Ptr{aws_channel_slot},), slot)
end

"""
    aws_channel_slot_increment_read_window(slot, window)

Issues a window update notification upstream (to the left.)

### Prototype
```c
int aws_channel_slot_increment_read_window(struct aws_channel_slot *slot, size_t window);
```
"""
function aws_channel_slot_increment_read_window(slot, window)
    ccall((:aws_channel_slot_increment_read_window, libawscrt), Cint, (Ptr{aws_channel_slot}, Csize_t), slot, window)
end

"""
    aws_channel_slot_on_handler_shutdown_complete(slot, dir, err_code, free_scarce_resources_immediately)

Called by handlers once they have finished their shutdown in the 'dir' direction. Propagates the shutdown process to the next handler in the channel.

### Prototype
```c
int aws_channel_slot_on_handler_shutdown_complete( struct aws_channel_slot *slot, enum aws_channel_direction dir, int err_code, bool free_scarce_resources_immediately);
```
"""
function aws_channel_slot_on_handler_shutdown_complete(slot, dir, err_code, free_scarce_resources_immediately)
    ccall((:aws_channel_slot_on_handler_shutdown_complete, libawscrt), Cint, (Ptr{aws_channel_slot}, aws_channel_direction, Cint, Bool), slot, dir, err_code, free_scarce_resources_immediately)
end

"""
    aws_channel_slot_shutdown(slot, dir, err_code, free_scarce_resources_immediately)

Initiates shutdown on slot. callbacks->on\\_shutdown\\_completed will be called once the shutdown process is completed.

### Prototype
```c
int aws_channel_slot_shutdown( struct aws_channel_slot *slot, enum aws_channel_direction dir, int err_code, bool free_scarce_resources_immediately);
```
"""
function aws_channel_slot_shutdown(slot, dir, err_code, free_scarce_resources_immediately)
    ccall((:aws_channel_slot_shutdown, libawscrt), Cint, (Ptr{aws_channel_slot}, aws_channel_direction, Cint, Bool), slot, dir, err_code, free_scarce_resources_immediately)
end

"""
    aws_channel_slot_downstream_read_window(slot)

Fetches the downstream read window. This gives you the information necessary to honor the read window. If you call send\\_message() and it exceeds this window, the message will be rejected.

### Prototype
```c
size_t aws_channel_slot_downstream_read_window(struct aws_channel_slot *slot);
```
"""
function aws_channel_slot_downstream_read_window(slot)
    ccall((:aws_channel_slot_downstream_read_window, libawscrt), Csize_t, (Ptr{aws_channel_slot},), slot)
end

"""
    aws_channel_slot_upstream_message_overhead(slot)

Fetches the current overhead of upstream handlers. This provides a hint to avoid fragmentation if you care.

### Prototype
```c
size_t aws_channel_slot_upstream_message_overhead(struct aws_channel_slot *slot);
```
"""
function aws_channel_slot_upstream_message_overhead(slot)
    ccall((:aws_channel_slot_upstream_message_overhead, libawscrt), Csize_t, (Ptr{aws_channel_slot},), slot)
end

"""
    aws_channel_handler_destroy(handler)

Calls destroy on handler's vtable

### Prototype
```c
void aws_channel_handler_destroy(struct aws_channel_handler *handler);
```
"""
function aws_channel_handler_destroy(handler)
    ccall((:aws_channel_handler_destroy, libawscrt), Cvoid, (Ptr{aws_channel_handler},), handler)
end

"""
    aws_channel_handler_process_read_message(handler, slot, message)

Calls process\\_read\\_message on handler's vtable

### Prototype
```c
int aws_channel_handler_process_read_message( struct aws_channel_handler *handler, struct aws_channel_slot *slot, struct aws_io_message *message);
```
"""
function aws_channel_handler_process_read_message(handler, slot, message)
    ccall((:aws_channel_handler_process_read_message, libawscrt), Cint, (Ptr{aws_channel_handler}, Ptr{aws_channel_slot}, Ptr{aws_io_message}), handler, slot, message)
end

"""
    aws_channel_handler_process_write_message(handler, slot, message)

Calls process\\_write\\_message on handler's vtable.

### Prototype
```c
int aws_channel_handler_process_write_message( struct aws_channel_handler *handler, struct aws_channel_slot *slot, struct aws_io_message *message);
```
"""
function aws_channel_handler_process_write_message(handler, slot, message)
    ccall((:aws_channel_handler_process_write_message, libawscrt), Cint, (Ptr{aws_channel_handler}, Ptr{aws_channel_slot}, Ptr{aws_io_message}), handler, slot, message)
end

"""
    aws_channel_handler_increment_read_window(handler, slot, size)

Calls on\\_window\\_update on handler's vtable.

### Prototype
```c
int aws_channel_handler_increment_read_window( struct aws_channel_handler *handler, struct aws_channel_slot *slot, size_t size);
```
"""
function aws_channel_handler_increment_read_window(handler, slot, size)
    ccall((:aws_channel_handler_increment_read_window, libawscrt), Cint, (Ptr{aws_channel_handler}, Ptr{aws_channel_slot}, Csize_t), handler, slot, size)
end

"""
    aws_channel_handler_shutdown(handler, slot, dir, error_code, free_scarce_resources_immediately)

calls shutdown\\_direction on handler's vtable.

### Prototype
```c
int aws_channel_handler_shutdown( struct aws_channel_handler *handler, struct aws_channel_slot *slot, enum aws_channel_direction dir, int error_code, bool free_scarce_resources_immediately);
```
"""
function aws_channel_handler_shutdown(handler, slot, dir, error_code, free_scarce_resources_immediately)
    ccall((:aws_channel_handler_shutdown, libawscrt), Cint, (Ptr{aws_channel_handler}, Ptr{aws_channel_slot}, aws_channel_direction, Cint, Bool), handler, slot, dir, error_code, free_scarce_resources_immediately)
end

"""
    aws_channel_handler_initial_window_size(handler)

Calls initial\\_window\\_size on handler's vtable.

### Prototype
```c
size_t aws_channel_handler_initial_window_size(struct aws_channel_handler *handler);
```
"""
function aws_channel_handler_initial_window_size(handler)
    ccall((:aws_channel_handler_initial_window_size, libawscrt), Csize_t, (Ptr{aws_channel_handler},), handler)
end

"""
    aws_channel_get_first_slot(channel)

### Prototype
```c
struct aws_channel_slot *aws_channel_get_first_slot(struct aws_channel *channel);
```
"""
function aws_channel_get_first_slot(channel)
    ccall((:aws_channel_get_first_slot, libawscrt), Ptr{aws_channel_slot}, (Ptr{aws_channel},), channel)
end

"""
    aws_channel_trigger_read(channel)

A way for external processes to force a read by the data-source channel handler. Necessary in certain cases, like when a server channel finishes setting up its initial handlers, a read may have already been triggered on the socket (the client's CLIENT\\_HELLO tls payload, for example) and absent further data/notifications, this data would never get processed.

### Prototype
```c
int aws_channel_trigger_read(struct aws_channel *channel);
```
"""
function aws_channel_trigger_read(channel)
    ccall((:aws_channel_trigger_read, libawscrt), Cint, (Ptr{aws_channel},), channel)
end

# typedef void ( aws_client_bootstrap_on_channel_event_fn ) ( struct aws_client_bootstrap * bootstrap , int error_code , struct aws_channel * channel , void * user_data )
"""
Generic event function for channel lifecycle events.

Callbacks are provided for: (1) Channel creation (2) Channel setup - If TLS is being used, this function is called once the socket has connected, the channel has been initialized, and TLS has been successfully negotiated. A TLS handler has already been added to the channel. If TLS negotiation fails, this function will be called with the corresponding error code. If TLS is not being used, this function is called once the socket has connected and the channel has been initialized. (3) Channel shutdown

These callbacks are always invoked within the thread of the event-loop that the channel is assigned to.

This function does NOT always imply "success" -- if error\\_code is [`AWS_OP_SUCCESS`](@ref) then everything was successful, otherwise an error condition occurred.
"""
const aws_client_bootstrap_on_channel_event_fn = Cvoid

# typedef struct aws_channel_handler * ( aws_channel_on_protocol_negotiated_fn ) ( struct aws_channel_slot * new_slot , struct aws_byte_buf * protocol , void * user_data )
"""
If ALPN is being used this function will be invoked by the channel once an ALPN message is received. The returned channel\\_handler will be added to, and managed by, the channel.
"""
const aws_channel_on_protocol_negotiated_fn = Cvoid

# typedef void aws_client_bootstrap_shutdown_complete_fn ( void * user_data )
"""
Called after client bootstrap has been completely cleaned up, after its last refcount is released.
"""
const aws_client_bootstrap_shutdown_complete_fn = Cvoid

"""
    aws_client_bootstrap_options

[`aws_client_bootstrap`](@ref) creation options.
"""
struct aws_client_bootstrap_options
    event_loop_group::Ptr{aws_event_loop_group}
    host_resolver::Ptr{aws_host_resolver}
    host_resolution_config::Ptr{aws_host_resolution_config}
    on_shutdown_complete::Ptr{Cvoid}
    user_data::Ptr{Cvoid}
end

# typedef void ( aws_server_bootstrap_on_accept_channel_setup_fn ) ( struct aws_server_bootstrap * bootstrap , int error_code , struct aws_channel * channel , void * user_data )
"""
If TLS is being used, this function is called once the socket has received an incoming connection, the channel has been initialized, and TLS has been successfully negotiated. A TLS handler has already been added to the channel. If TLS negotiation fails, this function will be called with the corresponding error code.

If TLS is not being used, this function is called once the socket has received an incoming connection and the channel has been initialized.

This function is always called within the thread of the event-loop that the new channel is assigned to upon success.

On failure, the channel might not be assigned to an event loop yet, and will thus be invoked on the listener's event-loop thread.

This function does NOT mean "success", if error\\_code is [`AWS_OP_SUCCESS`](@ref) then everything was successful, otherwise an error condition occurred.

If an error occurred, you do not need to shutdown the channel. The `aws_channel_client_shutdown_callback` will be invoked once the channel has finished shutting down.
"""
const aws_server_bootstrap_on_accept_channel_setup_fn = Cvoid

# typedef void ( aws_server_bootstrap_on_accept_channel_shutdown_fn ) ( struct aws_server_bootstrap * bootstrap , int error_code , struct aws_channel * channel , void * user_data )
"""
Once the channel shuts down, this function will be invoked within the thread of the event-loop that the channel is assigned to.

Note: this function is only invoked if the channel was successfully setup, e.g. [`aws_server_bootstrap_on_accept_channel_setup_fn`](@ref)() was invoked without an error code.
"""
const aws_server_bootstrap_on_accept_channel_shutdown_fn = Cvoid

# typedef void ( aws_server_bootstrap_on_server_listener_destroy_fn ) ( struct aws_server_bootstrap * bootstrap , void * user_data )
"""
Once the server listener socket is finished destroying, and all the existing connections are closed, this fuction will be invoked.
"""
const aws_server_bootstrap_on_server_listener_destroy_fn = Cvoid

"""
    aws_server_socket_channel_bootstrap_options

Arguments to setup a server socket listener which will also negotiate and configure TLS. This creates a socket listener bound to `host` and 'port' using socket options `options`, and TLS options `tls_options`. `incoming_callback` will be invoked once an incoming channel is ready for use and TLS is finished negotiating, or if an error is encountered. `shutdown_callback` will be invoked once the channel has shutdown. `destroy_callback` will be invoked after the server socket listener is destroyed, and all associated connections and channels have finished shutting down. Immediately after the `shutdown_callback` returns, the channel is cleaned up automatically. All callbacks are invoked in the thread of the event-loop that listener is assigned to.

Upon shutdown of your application, you'll want to call [`aws_server_bootstrap_destroy_socket_listener`](@ref) with the return value from this function.

The socket type in `options` must be AWS\\_SOCKET\\_STREAM if tls\\_options is set. DTLS is not currently supported for tls.
"""
struct aws_server_socket_channel_bootstrap_options
    bootstrap::Ptr{aws_server_bootstrap}
    host_name::Ptr{Cchar}
    port::UInt16
    socket_options::Ptr{aws_socket_options}
    tls_options::Ptr{aws_tls_connection_options}
    incoming_callback::Ptr{Cvoid}
    shutdown_callback::Ptr{Cvoid}
    destroy_callback::Ptr{Cvoid}
    enable_read_back_pressure::Bool
    user_data::Ptr{Cvoid}
end

"""
    aws_client_bootstrap_new(allocator, options)

Create the client bootstrap.

### Prototype
```c
struct aws_client_bootstrap *aws_client_bootstrap_new( struct aws_allocator *allocator, const struct aws_client_bootstrap_options *options);
```
"""
function aws_client_bootstrap_new(allocator, options)
    ccall((:aws_client_bootstrap_new, libawscrt), Ptr{aws_client_bootstrap}, (Ptr{aws_allocator}, Ptr{aws_client_bootstrap_options}), allocator, options)
end

"""
    aws_client_bootstrap_acquire(bootstrap)

Increments a client bootstrap's ref count, allowing the caller to take a reference to it.

Returns the same client bootstrap passed in.

### Prototype
```c
struct aws_client_bootstrap *aws_client_bootstrap_acquire(struct aws_client_bootstrap *bootstrap);
```
"""
function aws_client_bootstrap_acquire(bootstrap)
    ccall((:aws_client_bootstrap_acquire, libawscrt), Ptr{aws_client_bootstrap}, (Ptr{aws_client_bootstrap},), bootstrap)
end

"""
    aws_client_bootstrap_release(bootstrap)

Decrements a client bootstrap's ref count. When the ref count drops to zero, the bootstrap will be destroyed.

### Prototype
```c
void aws_client_bootstrap_release(struct aws_client_bootstrap *bootstrap);
```
"""
function aws_client_bootstrap_release(bootstrap)
    ccall((:aws_client_bootstrap_release, libawscrt), Cvoid, (Ptr{aws_client_bootstrap},), bootstrap)
end

"""
    aws_client_bootstrap_set_alpn_callback(bootstrap, on_protocol_negotiated)

When using TLS, if ALPN is used, this callback will be invoked from the channel. The returned handler will be added to the channel.

### Prototype
```c
int aws_client_bootstrap_set_alpn_callback( struct aws_client_bootstrap *bootstrap, aws_channel_on_protocol_negotiated_fn *on_protocol_negotiated);
```
"""
function aws_client_bootstrap_set_alpn_callback(bootstrap, on_protocol_negotiated)
    ccall((:aws_client_bootstrap_set_alpn_callback, libawscrt), Cint, (Ptr{aws_client_bootstrap}, Ptr{Cvoid}), bootstrap, on_protocol_negotiated)
end

"""
    aws_client_bootstrap_new_socket_channel(options)

Sets up a client socket channel.

### Prototype
```c
int aws_client_bootstrap_new_socket_channel(struct aws_socket_channel_bootstrap_options *options);
```
"""
function aws_client_bootstrap_new_socket_channel(options)
    ccall((:aws_client_bootstrap_new_socket_channel, libawscrt), Cint, (Ptr{aws_socket_channel_bootstrap_options},), options)
end

"""
    aws_server_bootstrap_new(allocator, el_group)

Initializes the server bootstrap with `allocator` and `el_group`. This object manages listeners, server connections, and channels.

### Prototype
```c
struct aws_server_bootstrap *aws_server_bootstrap_new( struct aws_allocator *allocator, struct aws_event_loop_group *el_group);
```
"""
function aws_server_bootstrap_new(allocator, el_group)
    ccall((:aws_server_bootstrap_new, libawscrt), Ptr{aws_server_bootstrap}, (Ptr{aws_allocator}, Ptr{aws_event_loop_group}), allocator, el_group)
end

"""
    aws_server_bootstrap_acquire(bootstrap)

Increments a server bootstrap's ref count, allowing the caller to take a reference to it.

Returns the same server bootstrap passed in.

### Prototype
```c
struct aws_server_bootstrap *aws_server_bootstrap_acquire(struct aws_server_bootstrap *bootstrap);
```
"""
function aws_server_bootstrap_acquire(bootstrap)
    ccall((:aws_server_bootstrap_acquire, libawscrt), Ptr{aws_server_bootstrap}, (Ptr{aws_server_bootstrap},), bootstrap)
end

"""
    aws_server_bootstrap_release(bootstrap)

Decrements a server bootstrap's ref count. When the ref count drops to zero, the bootstrap will be destroyed.

### Prototype
```c
void aws_server_bootstrap_release(struct aws_server_bootstrap *bootstrap);
```
"""
function aws_server_bootstrap_release(bootstrap)
    ccall((:aws_server_bootstrap_release, libawscrt), Cvoid, (Ptr{aws_server_bootstrap},), bootstrap)
end

"""
    aws_server_bootstrap_set_alpn_callback(bootstrap, on_protocol_negotiated)

When using TLS, if ALPN is used, this callback will be invoked from the channel. The returned handler will be added to the channel.

### Prototype
```c
int aws_server_bootstrap_set_alpn_callback( struct aws_server_bootstrap *bootstrap, aws_channel_on_protocol_negotiated_fn *on_protocol_negotiated);
```
"""
function aws_server_bootstrap_set_alpn_callback(bootstrap, on_protocol_negotiated)
    ccall((:aws_server_bootstrap_set_alpn_callback, libawscrt), Cint, (Ptr{aws_server_bootstrap}, Ptr{Cvoid}), bootstrap, on_protocol_negotiated)
end

struct var"##Ctag#5939"
    data::NTuple{8, UInt8}
end

function Base.getproperty(x::Ptr{var"##Ctag#5939"}, f::Symbol)
    f === :fd && return Ptr{Cint}(x + 0)
    f === :handle && return Ptr{Ptr{Cvoid}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#5939", f::Symbol)
    r = Ref{var"##Ctag#5939"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#5939"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#5939"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct aws_io_handle
    data::NTuple{16, UInt8}
end

function Base.getproperty(x::Ptr{aws_io_handle}, f::Symbol)
    f === :data && return Ptr{var"##Ctag#5939"}(x + 0)
    f === :additional_data && return Ptr{Ptr{Cvoid}}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::aws_io_handle, f::Symbol)
    r = Ref{aws_io_handle}(x)
    ptr = Base.unsafe_convert(Ptr{aws_io_handle}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{aws_io_handle}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct aws_socket
    data::NTuple{336, UInt8}
end

function Base.getproperty(x::Ptr{aws_socket}, f::Symbol)
    f === :allocator && return Ptr{Ptr{aws_allocator}}(x + 0)
    f === :local_endpoint && return Ptr{aws_socket_endpoint}(x + 8)
    f === :remote_endpoint && return Ptr{aws_socket_endpoint}(x + 118)
    f === :options && return Ptr{aws_socket_options}(x + 228)
    f === :io_handle && return Ptr{aws_io_handle}(x + 248)
    f === :event_loop && return Ptr{Ptr{aws_event_loop}}(x + 264)
    f === :handler && return Ptr{Ptr{aws_channel_handler}}(x + 272)
    f === :state && return Ptr{Cint}(x + 280)
    f === :readable_fn && return Ptr{Ptr{Cvoid}}(x + 288)
    f === :readable_user_data && return Ptr{Ptr{Cvoid}}(x + 296)
    f === :connection_result_fn && return Ptr{Ptr{Cvoid}}(x + 304)
    f === :accept_result_fn && return Ptr{Ptr{Cvoid}}(x + 312)
    f === :connect_accept_user_data && return Ptr{Ptr{Cvoid}}(x + 320)
    f === :impl && return Ptr{Ptr{Cvoid}}(x + 328)
    return getfield(x, f)
end

function Base.getproperty(x::aws_socket, f::Symbol)
    r = Ref{aws_socket}(x)
    ptr = Base.unsafe_convert(Ptr{aws_socket}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{aws_socket}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    aws_server_bootstrap_new_socket_listener(bootstrap_options)

Sets up a server socket listener. If you are planning on using TLS, use `aws_server_bootstrap_new_tls_socket_listener` instead. This creates a socket listener bound to `local_endpoint` using socket options `options`. `incoming_callback` will be invoked once an incoming channel is ready for use or if an error is encountered. `shutdown_callback` will be invoked once the channel has shutdown. `destroy_callback` will be invoked after the server socket listener is destroyed, and all associated connections and channels have finished shutting down. Immediately after the `shutdown_callback` returns, the channel is cleaned up automatically. All callbacks are invoked the thread of the event-loop that the listening socket is assigned to

Upon shutdown of your application, you'll want to call [`aws_server_bootstrap_destroy_socket_listener`](@ref) with the return value from this function.

bootstrap\\_options is copied.

### Prototype
```c
struct aws_socket *aws_server_bootstrap_new_socket_listener( const struct aws_server_socket_channel_bootstrap_options *bootstrap_options);
```
"""
function aws_server_bootstrap_new_socket_listener(bootstrap_options)
    ccall((:aws_server_bootstrap_new_socket_listener, libawscrt), Ptr{aws_socket}, (Ptr{aws_server_socket_channel_bootstrap_options},), bootstrap_options)
end

"""
    aws_server_bootstrap_destroy_socket_listener(bootstrap, listener)

Shuts down 'listener' and cleans up any resources associated with it. Any incoming channels on `listener` will still be active. `destroy_callback` will be invoked after the server socket listener is destroyed, and all associated connections and channels have finished shutting down.

### Prototype
```c
void aws_server_bootstrap_destroy_socket_listener( struct aws_server_bootstrap *bootstrap, struct aws_socket *listener);
```
"""
function aws_server_bootstrap_destroy_socket_listener(bootstrap, listener)
    ccall((:aws_server_bootstrap_destroy_socket_listener, libawscrt), Cvoid, (Ptr{aws_server_bootstrap}, Ptr{aws_socket}), bootstrap, listener)
end

@cenum aws_io_event_type::UInt32 begin
    AWS_IO_EVENT_TYPE_READABLE = 1
    AWS_IO_EVENT_TYPE_WRITABLE = 2
    AWS_IO_EVENT_TYPE_REMOTE_HANG_UP = 4
    AWS_IO_EVENT_TYPE_CLOSED = 8
    AWS_IO_EVENT_TYPE_ERROR = 16
end

# typedef void ( aws_event_loop_on_event_fn ) ( struct aws_event_loop * event_loop , struct aws_io_handle * handle , int events , void * user_data )
const aws_event_loop_on_event_fn = Cvoid

# typedef void ( aws_event_loop_on_local_object_removed_fn ) ( struct aws_event_loop_local_object * )
const aws_event_loop_on_local_object_removed_fn = Cvoid

struct aws_event_loop_options
    clock::Ptr{Cvoid}
    thread_options::Ptr{aws_thread_options}
end

# typedef struct aws_event_loop * ( aws_new_event_loop_fn ) ( struct aws_allocator * alloc , const struct aws_event_loop_options * options , void * new_loop_user_data )
const aws_new_event_loop_fn = Cvoid

"""
    aws_event_loop_new_default(alloc, clock)

Creates an instance of the default event loop implementation for the current architecture and operating system.

### Prototype
```c
struct aws_event_loop *aws_event_loop_new_default(struct aws_allocator *alloc, aws_io_clock_fn *clock);
```
"""
function aws_event_loop_new_default(alloc, clock)
    ccall((:aws_event_loop_new_default, libawscrt), Ptr{aws_event_loop}, (Ptr{aws_allocator}, Ptr{Cvoid}), alloc, clock)
end

"""
    aws_event_loop_new_default_with_options(alloc, options)

Creates an instance of the default event loop implementation for the current architecture and operating system using extendable options.

### Prototype
```c
struct aws_event_loop *aws_event_loop_new_default_with_options( struct aws_allocator *alloc, const struct aws_event_loop_options *options);
```
"""
function aws_event_loop_new_default_with_options(alloc, options)
    ccall((:aws_event_loop_new_default_with_options, libawscrt), Ptr{aws_event_loop}, (Ptr{aws_allocator}, Ptr{aws_event_loop_options}), alloc, options)
end

"""
    aws_event_loop_destroy(event_loop)

Invokes the destroy() fn for the event loop implementation. If the event loop is still in a running state, this function will block waiting on the event loop to shutdown. If you do not want this function to block, call [`aws_event_loop_stop`](@ref)() manually first. If the event loop is shared by multiple threads then destroy must be called by exactly one thread. All other threads must ensure their API calls to the event loop happen-before the call to destroy.

### Prototype
```c
void aws_event_loop_destroy(struct aws_event_loop *event_loop);
```
"""
function aws_event_loop_destroy(event_loop)
    ccall((:aws_event_loop_destroy, libawscrt), Cvoid, (Ptr{aws_event_loop},), event_loop)
end

"""
    aws_event_loop_init_base(event_loop, alloc, clock)

Initializes common event-loop data structures. This is only called from the *new() function of event loop implementations.

### Prototype
```c
int aws_event_loop_init_base(struct aws_event_loop *event_loop, struct aws_allocator *alloc, aws_io_clock_fn *clock);
```
"""
function aws_event_loop_init_base(event_loop, alloc, clock)
    ccall((:aws_event_loop_init_base, libawscrt), Cint, (Ptr{aws_event_loop}, Ptr{aws_allocator}, Ptr{Cvoid}), event_loop, alloc, clock)
end

"""
    aws_event_loop_clean_up_base(event_loop)

Common cleanup code for all implementations. This is only called from the *destroy() function of event loop implementations.

### Prototype
```c
void aws_event_loop_clean_up_base(struct aws_event_loop *event_loop);
```
"""
function aws_event_loop_clean_up_base(event_loop)
    ccall((:aws_event_loop_clean_up_base, libawscrt), Cvoid, (Ptr{aws_event_loop},), event_loop)
end

"""
    aws_event_loop_fetch_local_object(event_loop, key, obj)

Fetches an object from the event-loop's data store. Key will be taken as the memory address of the memory pointed to by key. This function is not thread safe and should be called inside the event-loop's thread.

### Prototype
```c
int aws_event_loop_fetch_local_object( struct aws_event_loop *event_loop, void *key, struct aws_event_loop_local_object *obj);
```
"""
function aws_event_loop_fetch_local_object(event_loop, key, obj)
    ccall((:aws_event_loop_fetch_local_object, libawscrt), Cint, (Ptr{aws_event_loop}, Ptr{Cvoid}, Ptr{aws_event_loop_local_object}), event_loop, key, obj)
end

"""
    aws_event_loop_put_local_object(event_loop, obj)

Puts an item object the event-loop's data store. Key will be taken as the memory address of the memory pointed to by key. The lifetime of item must live until remove or a put item overrides it. This function is not thread safe and should be called inside the event-loop's thread.

### Prototype
```c
int aws_event_loop_put_local_object(struct aws_event_loop *event_loop, struct aws_event_loop_local_object *obj);
```
"""
function aws_event_loop_put_local_object(event_loop, obj)
    ccall((:aws_event_loop_put_local_object, libawscrt), Cint, (Ptr{aws_event_loop}, Ptr{aws_event_loop_local_object}), event_loop, obj)
end

"""
    aws_event_loop_remove_local_object(event_loop, key, removed_obj)

Removes an object from the event-loop's data store. Key will be taken as the memory address of the memory pointed to by key. If removed\\_item is not null, the removed item will be moved to it if it exists. Otherwise, the default deallocation strategy will be used. This function is not thread safe and should be called inside the event-loop's thread.

### Prototype
```c
int aws_event_loop_remove_local_object( struct aws_event_loop *event_loop, void *key, struct aws_event_loop_local_object *removed_obj);
```
"""
function aws_event_loop_remove_local_object(event_loop, key, removed_obj)
    ccall((:aws_event_loop_remove_local_object, libawscrt), Cint, (Ptr{aws_event_loop}, Ptr{Cvoid}, Ptr{aws_event_loop_local_object}), event_loop, key, removed_obj)
end

"""
    aws_event_loop_run(event_loop)

Triggers the running of the event loop. This function must not block. The event loop is not active until this function is invoked. This function can be called again on an event loop after calling [`aws_event_loop_stop`](@ref)() and [`aws_event_loop_wait_for_stop_completion`](@ref)().

### Prototype
```c
int aws_event_loop_run(struct aws_event_loop *event_loop);
```
"""
function aws_event_loop_run(event_loop)
    ccall((:aws_event_loop_run, libawscrt), Cint, (Ptr{aws_event_loop},), event_loop)
end

"""
    aws_event_loop_stop(event_loop)

Triggers the event loop to stop, but does not wait for the loop to stop completely. This function may be called from outside or inside the event loop thread. It is safe to call multiple times. This function is called from destroy().

If you do not call destroy(), an event loop can be run again by calling stop(), wait\\_for\\_stop\\_completion(), run().

### Prototype
```c
int aws_event_loop_stop(struct aws_event_loop *event_loop);
```
"""
function aws_event_loop_stop(event_loop)
    ccall((:aws_event_loop_stop, libawscrt), Cint, (Ptr{aws_event_loop},), event_loop)
end

"""
    aws_event_loop_register_tick_start(event_loop)

For event-loop implementations to use for providing metrics info to the base event-loop. This enables the event-loop load balancer to take into account load when vending another event-loop to a caller.

Call this function at the beginning of your event-loop tick: after wake-up, but before processing any IO or tasks.

### Prototype
```c
void aws_event_loop_register_tick_start(struct aws_event_loop *event_loop);
```
"""
function aws_event_loop_register_tick_start(event_loop)
    ccall((:aws_event_loop_register_tick_start, libawscrt), Cvoid, (Ptr{aws_event_loop},), event_loop)
end

"""
    aws_event_loop_register_tick_end(event_loop)

For event-loop implementations to use for providing metrics info to the base event-loop. This enables the event-loop load balancer to take into account load when vending another event-loop to a caller.

Call this function at the end of your event-loop tick: after processing IO and tasks.

### Prototype
```c
void aws_event_loop_register_tick_end(struct aws_event_loop *event_loop);
```
"""
function aws_event_loop_register_tick_end(event_loop)
    ccall((:aws_event_loop_register_tick_end, libawscrt), Cvoid, (Ptr{aws_event_loop},), event_loop)
end

"""
    aws_event_loop_get_load_factor(event_loop)

Returns the current load factor (however that may be calculated). If the event-loop is not invoking [`aws_event_loop_register_tick_start`](@ref)() and [`aws_event_loop_register_tick_end`](@ref)(), this value will always be 0.

### Prototype
```c
size_t aws_event_loop_get_load_factor(struct aws_event_loop *event_loop);
```
"""
function aws_event_loop_get_load_factor(event_loop)
    ccall((:aws_event_loop_get_load_factor, libawscrt), Csize_t, (Ptr{aws_event_loop},), event_loop)
end

"""
    aws_event_loop_wait_for_stop_completion(event_loop)

Blocks until the event loop stops completely. If you want to call [`aws_event_loop_run`](@ref)() again, you must call this after [`aws_event_loop_stop`](@ref)(). It is not safe to call this function from inside the event loop thread.

### Prototype
```c
int aws_event_loop_wait_for_stop_completion(struct aws_event_loop *event_loop);
```
"""
function aws_event_loop_wait_for_stop_completion(event_loop)
    ccall((:aws_event_loop_wait_for_stop_completion, libawscrt), Cint, (Ptr{aws_event_loop},), event_loop)
end

"""
    aws_event_loop_schedule_task_now(event_loop, task)

The event loop will schedule the task and run it on the event loop thread as soon as possible. Note that cancelled tasks may execute outside the event loop thread. This function may be called from outside or inside the event loop thread.

The task should not be cleaned up or modified until its function is executed.

### Prototype
```c
void aws_event_loop_schedule_task_now(struct aws_event_loop *event_loop, struct aws_task *task);
```
"""
function aws_event_loop_schedule_task_now(event_loop, task)
    ccall((:aws_event_loop_schedule_task_now, libawscrt), Cvoid, (Ptr{aws_event_loop}, Ptr{aws_task}), event_loop, task)
end

"""
    aws_event_loop_schedule_task_future(event_loop, task, run_at_nanos)

The event loop will schedule the task and run it at the specified time. Use [`aws_event_loop_current_clock_time`](@ref)() to query the current time in nanoseconds. Note that cancelled tasks may execute outside the event loop thread. This function may be called from outside or inside the event loop thread.

The task should not be cleaned up or modified until its function is executed.

### Prototype
```c
void aws_event_loop_schedule_task_future( struct aws_event_loop *event_loop, struct aws_task *task, uint64_t run_at_nanos);
```
"""
function aws_event_loop_schedule_task_future(event_loop, task, run_at_nanos)
    ccall((:aws_event_loop_schedule_task_future, libawscrt), Cvoid, (Ptr{aws_event_loop}, Ptr{aws_task}, UInt64), event_loop, task, run_at_nanos)
end

"""
    aws_event_loop_cancel_task(event_loop, task)

Cancels task. This function must be called from the event loop's thread, and is only guaranteed to work properly on tasks scheduled from within the event loop's thread. The task will be executed with the AWS\\_TASK\\_STATUS\\_CANCELED status inside this call.

### Prototype
```c
void aws_event_loop_cancel_task(struct aws_event_loop *event_loop, struct aws_task *task);
```
"""
function aws_event_loop_cancel_task(event_loop, task)
    ccall((:aws_event_loop_cancel_task, libawscrt), Cvoid, (Ptr{aws_event_loop}, Ptr{aws_task}), event_loop, task)
end

"""
    aws_event_loop_subscribe_to_io_events(event_loop, handle, events, on_event, user_data)

Subscribes on\\_event to events on the event-loop for handle. events is a bitwise concatenation of the events that were received. The definition for these values can be found in [`aws_io_event_type`](@ref). Currently, only AWS\\_IO\\_EVENT\\_TYPE\\_READABLE and AWS\\_IO\\_EVENT\\_TYPE\\_WRITABLE are honored. You always are registered for error conditions and closure. This function may be called from outside or inside the event loop thread. However, the unsubscribe function must be called inside the event-loop's thread.

### Prototype
```c
int aws_event_loop_subscribe_to_io_events( struct aws_event_loop *event_loop, struct aws_io_handle *handle, int events, aws_event_loop_on_event_fn *on_event, void *user_data);
```
"""
function aws_event_loop_subscribe_to_io_events(event_loop, handle, events, on_event, user_data)
    ccall((:aws_event_loop_subscribe_to_io_events, libawscrt), Cint, (Ptr{aws_event_loop}, Ptr{aws_io_handle}, Cint, Ptr{Cvoid}, Ptr{Cvoid}), event_loop, handle, events, on_event, user_data)
end

"""
    aws_event_loop_unsubscribe_from_io_events(event_loop, handle)

Unsubscribes handle from event-loop notifications. This function is not thread safe and should be called inside the event-loop's thread.

NOTE: if you are using io completion ports, this is a risky call. We use it in places, but only when we're certain there's no pending events. If you want to use it, it's your job to make sure you don't have pending events before calling it.

### Prototype
```c
int aws_event_loop_unsubscribe_from_io_events(struct aws_event_loop *event_loop, struct aws_io_handle *handle);
```
"""
function aws_event_loop_unsubscribe_from_io_events(event_loop, handle)
    ccall((:aws_event_loop_unsubscribe_from_io_events, libawscrt), Cint, (Ptr{aws_event_loop}, Ptr{aws_io_handle}), event_loop, handle)
end

"""
    aws_event_loop_free_io_event_resources(event_loop, handle)

Cleans up resources (user\\_data) associated with the I/O eventing subsystem for a given handle. This should only ever be necessary in the case where you are cleaning up an event loop during shutdown and its thread has already been joined.

### Prototype
```c
void aws_event_loop_free_io_event_resources(struct aws_event_loop *event_loop, struct aws_io_handle *handle);
```
"""
function aws_event_loop_free_io_event_resources(event_loop, handle)
    ccall((:aws_event_loop_free_io_event_resources, libawscrt), Cvoid, (Ptr{aws_event_loop}, Ptr{aws_io_handle}), event_loop, handle)
end

"""
    aws_event_loop_thread_is_callers_thread(event_loop)

Returns true if the event loop's thread is the same thread that called this function, otherwise false.

### Prototype
```c
bool aws_event_loop_thread_is_callers_thread(struct aws_event_loop *event_loop);
```
"""
function aws_event_loop_thread_is_callers_thread(event_loop)
    ccall((:aws_event_loop_thread_is_callers_thread, libawscrt), Bool, (Ptr{aws_event_loop},), event_loop)
end

"""
    aws_event_loop_current_clock_time(event_loop, time_nanos)

Gets the current timestamp for the event loop's clock, in nanoseconds. This function is thread-safe.

### Prototype
```c
int aws_event_loop_current_clock_time(struct aws_event_loop *event_loop, uint64_t *time_nanos);
```
"""
function aws_event_loop_current_clock_time(event_loop, time_nanos)
    ccall((:aws_event_loop_current_clock_time, libawscrt), Cint, (Ptr{aws_event_loop}, Ptr{UInt64}), event_loop, time_nanos)
end

"""
    aws_event_loop_group_new(alloc, clock, el_count, new_loop_fn, new_loop_user_data, shutdown_options)

Creates an event loop group, with clock, number of loops to manage, and the function to call for creating a new event loop.

### Prototype
```c
struct aws_event_loop_group *aws_event_loop_group_new( struct aws_allocator *alloc, aws_io_clock_fn *clock, uint16_t el_count, aws_new_event_loop_fn *new_loop_fn, void *new_loop_user_data, const struct aws_shutdown_callback_options *shutdown_options);
```
"""
function aws_event_loop_group_new(alloc, clock, el_count, new_loop_fn, new_loop_user_data, shutdown_options)
    ccall((:aws_event_loop_group_new, libawscrt), Ptr{aws_event_loop_group}, (Ptr{aws_allocator}, Ptr{Cvoid}, UInt16, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{aws_shutdown_callback_options}), alloc, clock, el_count, new_loop_fn, new_loop_user_data, shutdown_options)
end

"""
    aws_event_loop_group_new_pinned_to_cpu_group(alloc, clock, el_count, cpu_group, new_loop_fn, new_loop_user_data, shutdown_options)

Creates an event loop group, with clock, number of loops to manage, the function to call for creating a new event loop, and also pins all loops to hw threads on the same cpu\\_group (e.g. NUMA nodes). Note: If el\\_count exceeds the number of hw threads in the cpu\\_group it will be ignored on the assumption that if you care about NUMA, you don't want hyper-threads doing your IO and you especially don't want IO on a different node.

### Prototype
```c
struct aws_event_loop_group *aws_event_loop_group_new_pinned_to_cpu_group( struct aws_allocator *alloc, aws_io_clock_fn *clock, uint16_t el_count, uint16_t cpu_group, aws_new_event_loop_fn *new_loop_fn, void *new_loop_user_data, const struct aws_shutdown_callback_options *shutdown_options);
```
"""
function aws_event_loop_group_new_pinned_to_cpu_group(alloc, clock, el_count, cpu_group, new_loop_fn, new_loop_user_data, shutdown_options)
    ccall((:aws_event_loop_group_new_pinned_to_cpu_group, libawscrt), Ptr{aws_event_loop_group}, (Ptr{aws_allocator}, Ptr{Cvoid}, UInt16, UInt16, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{aws_shutdown_callback_options}), alloc, clock, el_count, cpu_group, new_loop_fn, new_loop_user_data, shutdown_options)
end

"""
    aws_event_loop_group_new_default(alloc, max_threads, shutdown_options)

Initializes an event loop group with platform defaults. If max\\_threads == 0, then the loop count will be the number of available processors on the machine / 2 (to exclude hyper-threads). Otherwise, max\\_threads will be the number of event loops in the group.

### Prototype
```c
struct aws_event_loop_group *aws_event_loop_group_new_default( struct aws_allocator *alloc, uint16_t max_threads, const struct aws_shutdown_callback_options *shutdown_options);
```
"""
function aws_event_loop_group_new_default(alloc, max_threads, shutdown_options)
    ccall((:aws_event_loop_group_new_default, libawscrt), Ptr{aws_event_loop_group}, (Ptr{aws_allocator}, UInt16, Ptr{aws_shutdown_callback_options}), alloc, max_threads, shutdown_options)
end

"""
    aws_event_loop_group_new_default_pinned_to_cpu_group(alloc, max_threads, cpu_group, shutdown_options)

Creates an event loop group, with clock, number of loops to manage, the function to call for creating a new event loop, and also pins all loops to hw threads on the same cpu\\_group (e.g. NUMA nodes). Note: If el\\_count exceeds the number of hw threads in the cpu\\_group it will be clamped to the number of hw threads on the assumption that if you care about NUMA, you don't want hyper-threads doing your IO and you especially don't want IO on a different node.

If max\\_threads == 0, then the loop count will be the number of available processors in the cpu\\_group / 2 (to exclude hyper-threads)

### Prototype
```c
struct aws_event_loop_group *aws_event_loop_group_new_default_pinned_to_cpu_group( struct aws_allocator *alloc, uint16_t max_threads, uint16_t cpu_group, const struct aws_shutdown_callback_options *shutdown_options);
```
"""
function aws_event_loop_group_new_default_pinned_to_cpu_group(alloc, max_threads, cpu_group, shutdown_options)
    ccall((:aws_event_loop_group_new_default_pinned_to_cpu_group, libawscrt), Ptr{aws_event_loop_group}, (Ptr{aws_allocator}, UInt16, UInt16, Ptr{aws_shutdown_callback_options}), alloc, max_threads, cpu_group, shutdown_options)
end

"""
    aws_event_loop_group_acquire(el_group)

Increments the reference count on the event loop group, allowing the caller to take a reference to it.

Returns the same event loop group passed in.

### Prototype
```c
struct aws_event_loop_group *aws_event_loop_group_acquire(struct aws_event_loop_group *el_group);
```
"""
function aws_event_loop_group_acquire(el_group)
    ccall((:aws_event_loop_group_acquire, libawscrt), Ptr{aws_event_loop_group}, (Ptr{aws_event_loop_group},), el_group)
end

"""
    aws_event_loop_group_release(el_group)

Decrements an event loop group's ref count. When the ref count drops to zero, the event loop group will be destroyed.

### Prototype
```c
void aws_event_loop_group_release(struct aws_event_loop_group *el_group);
```
"""
function aws_event_loop_group_release(el_group)
    ccall((:aws_event_loop_group_release, libawscrt), Cvoid, (Ptr{aws_event_loop_group},), el_group)
end

"""
    aws_event_loop_group_get_loop_at(el_group, index)

### Prototype
```c
struct aws_event_loop *aws_event_loop_group_get_loop_at(struct aws_event_loop_group *el_group, size_t index);
```
"""
function aws_event_loop_group_get_loop_at(el_group, index)
    ccall((:aws_event_loop_group_get_loop_at, libawscrt), Ptr{aws_event_loop}, (Ptr{aws_event_loop_group}, Csize_t), el_group, index)
end

"""
    aws_event_loop_group_get_loop_count(el_group)

### Prototype
```c
size_t aws_event_loop_group_get_loop_count(struct aws_event_loop_group *el_group);
```
"""
function aws_event_loop_group_get_loop_count(el_group)
    ccall((:aws_event_loop_group_get_loop_count, libawscrt), Csize_t, (Ptr{aws_event_loop_group},), el_group)
end

"""
    aws_event_loop_group_get_next_loop(el_group)

Fetches the next loop for use. The purpose is to enable load balancing across loops. You should not depend on how this load balancing is done as it is subject to change in the future. Currently it uses the "best-of-two" algorithm based on the load factor of each loop.

### Prototype
```c
struct aws_event_loop *aws_event_loop_group_get_next_loop(struct aws_event_loop_group *el_group);
```
"""
function aws_event_loop_group_get_next_loop(el_group)
    ccall((:aws_event_loop_group_get_next_loop, libawscrt), Ptr{aws_event_loop}, (Ptr{aws_event_loop_group},), el_group)
end

@cenum aws_address_record_type::UInt32 begin
    AWS_ADDRESS_RECORD_TYPE_A = 0
    AWS_ADDRESS_RECORD_TYPE_AAAA = 1
end

@cenum aws_get_host_address_flags::UInt32 begin
    AWS_GET_HOST_ADDRESS_COUNT_RECORD_TYPE_A = 1
    AWS_GET_HOST_ADDRESS_COUNT_RECORD_TYPE_AAAA = 2
end

struct aws_host_address
    allocator::Ptr{aws_allocator}
    host::Ptr{aws_string}
    address::Ptr{aws_string}
    record_type::aws_address_record_type
    expiry::UInt64
    use_count::Csize_t
    connection_failure_count::Csize_t
    weight::UInt8
end

# typedef void ( aws_on_host_resolved_result_fn ) ( struct aws_host_resolver * resolver , const struct aws_string * host_name , int err_code , const struct aws_array_list * host_addresses , void * user_data )
"""
Invoked once an address has been resolved for host. The type in host\\_addresses is struct [`aws_host_address`](@ref) (by-value). The caller does not own this memory and you must copy the host address before returning from this function if you plan to use it later. For convenience, we've provided the [`aws_host_address_copy`](@ref)() and [`aws_host_address_clean_up`](@ref)() functions.
"""
const aws_on_host_resolved_result_fn = Cvoid

# typedef int ( aws_resolve_host_implementation_fn ) ( struct aws_allocator * allocator , const struct aws_string * host_name , struct aws_array_list * output_addresses , void * user_data )
"""
Function signature for configuring your own resolver (the default just uses getaddrinfo()). The type in output\\_addresses is struct [`aws_host_address`](@ref) (by-value). We assume this function blocks, hence this absurdly complicated design.
"""
const aws_resolve_host_implementation_fn = Cvoid

mutable struct aws_host_listener end

struct aws_host_resolver_default_options
    max_entries::Csize_t
    el_group::Ptr{aws_event_loop_group}
    shutdown_options::Ptr{aws_shutdown_callback_options}
    system_clock_override_fn::Ptr{Cvoid}
end

"""
    aws_host_address_copy(from, to)

Copies `from` to `to`.

### Prototype
```c
int aws_host_address_copy(const struct aws_host_address *from, struct aws_host_address *to);
```
"""
function aws_host_address_copy(from, to)
    ccall((:aws_host_address_copy, libawscrt), Cint, (Ptr{aws_host_address}, Ptr{aws_host_address}), from, to)
end

"""
    aws_host_address_move(from, to)

Moves `from` to `to`. After this call, from is no longer usable. Though, it could be resused for another move or copy operation.

### Prototype
```c
void aws_host_address_move(struct aws_host_address *from, struct aws_host_address *to);
```
"""
function aws_host_address_move(from, to)
    ccall((:aws_host_address_move, libawscrt), Cvoid, (Ptr{aws_host_address}, Ptr{aws_host_address}), from, to)
end

"""
    aws_host_address_clean_up(address)

Cleans up the memory for `address`

### Prototype
```c
void aws_host_address_clean_up(struct aws_host_address *address);
```
"""
function aws_host_address_clean_up(address)
    ccall((:aws_host_address_clean_up, libawscrt), Cvoid, (Ptr{aws_host_address},), address)
end

"""
    aws_default_dns_resolve(allocator, host_name, output_addresses, user_data)

WARNING! do not call this function directly (getaddrinfo()): it blocks. Provide a pointer to this function for other resolution functions.

### Prototype
```c
int aws_default_dns_resolve( struct aws_allocator *allocator, const struct aws_string *host_name, struct aws_array_list *output_addresses, void *user_data);
```
"""
function aws_default_dns_resolve(allocator, host_name, output_addresses, user_data)
    ccall((:aws_default_dns_resolve, libawscrt), Cint, (Ptr{aws_allocator}, Ptr{aws_string}, Ptr{aws_array_list}, Ptr{Cvoid}), allocator, host_name, output_addresses, user_data)
end

"""
    aws_host_resolver_new_default(allocator, options)

Creates a host resolver with the default behavior. Here's the behavior:

Since there's not a reliable way to do non-blocking DNS without a ton of risky work that would need years of testing on every Unix system in existence, we work around it by doing a threaded implementation.

When you request an address, it checks the cache. If the entry isn't in the cache it creates a new one. Each entry has a potentially short lived back-ground thread based on ttl for the records. Once we've populated the cache and you keep the resolver active, the resolution callback will be invoked immediately. When it's idle, it will take a little while in the background thread to fetch more, evaluate TTLs etc... In that case your callback will be invoked from the background thread.

--------------------------------------------------------------------------------------------------------------------

A few things to note about TTLs and connection failures.

We attempt to honor your max ttl but will not honor it if dns queries are failing or all of your connections are marked as failed. Once we are able to query dns again, we will re-evaluate the TTLs.

Upon notification connection failures, we move them to a separate list. Eventually we retry them when it's likely that the endpoint is healthy again or we don't really have another choice, but we try to keep them out of your hot path.

---------------------------------------------------------------------------------------------------------------------

Finally, this entire design attempts to prevent problems where developers have to choose between large TTLs and thus sticky hosts or short TTLs and good fleet utilization but now higher latencies. In this design, we resolve every second in the background (only while you're actually using the record), but we do not expire the earlier resolved addresses until max ttl has passed.

This for example, should enable you to hit thousands of hosts in the Amazon S3 fleet instead of just one or two.

### Prototype
```c
struct aws_host_resolver *aws_host_resolver_new_default( struct aws_allocator *allocator, struct aws_host_resolver_default_options *options);
```
"""
function aws_host_resolver_new_default(allocator, options)
    ccall((:aws_host_resolver_new_default, libawscrt), Ptr{aws_host_resolver}, (Ptr{aws_allocator}, Ptr{aws_host_resolver_default_options}), allocator, options)
end

"""
    aws_host_resolver_acquire(resolver)

Increments the reference count on the host resolver, allowing the caller to take a reference to it.

Returns the same host resolver passed in.

### Prototype
```c
struct aws_host_resolver *aws_host_resolver_acquire(struct aws_host_resolver *resolver);
```
"""
function aws_host_resolver_acquire(resolver)
    ccall((:aws_host_resolver_acquire, libawscrt), Ptr{aws_host_resolver}, (Ptr{aws_host_resolver},), resolver)
end

"""
    aws_host_resolver_release(resolver)

Decrements a host resolver's ref count. When the ref count drops to zero, the resolver will be destroyed.

### Prototype
```c
void aws_host_resolver_release(struct aws_host_resolver *resolver);
```
"""
function aws_host_resolver_release(resolver)
    ccall((:aws_host_resolver_release, libawscrt), Cvoid, (Ptr{aws_host_resolver},), resolver)
end

"""
    aws_host_resolver_resolve_host(resolver, host_name, res, config, user_data)

calls resolve\\_host on the vtable. config will be copied.

### Prototype
```c
int aws_host_resolver_resolve_host( struct aws_host_resolver *resolver, const struct aws_string *host_name, aws_on_host_resolved_result_fn *res, struct aws_host_resolution_config *config, void *user_data);
```
"""
function aws_host_resolver_resolve_host(resolver, host_name, res, config, user_data)
    ccall((:aws_host_resolver_resolve_host, libawscrt), Cint, (Ptr{aws_host_resolver}, Ptr{aws_string}, Ptr{Cvoid}, Ptr{aws_host_resolution_config}, Ptr{Cvoid}), resolver, host_name, res, config, user_data)
end

"""
    aws_host_resolver_record_connection_failure(resolver, address)

calls record\\_connection\\_failure on the vtable.

### Prototype
```c
int aws_host_resolver_record_connection_failure( struct aws_host_resolver *resolver, struct aws_host_address *address);
```
"""
function aws_host_resolver_record_connection_failure(resolver, address)
    ccall((:aws_host_resolver_record_connection_failure, libawscrt), Cint, (Ptr{aws_host_resolver}, Ptr{aws_host_address}), resolver, address)
end

"""
    aws_host_resolver_purge_cache(resolver)

calls purge\\_cache on the vtable.

### Prototype
```c
int aws_host_resolver_purge_cache(struct aws_host_resolver *resolver);
```
"""
function aws_host_resolver_purge_cache(resolver)
    ccall((:aws_host_resolver_purge_cache, libawscrt), Cint, (Ptr{aws_host_resolver},), resolver)
end

"""
    aws_host_resolver_get_host_address_count(resolver, host_name, flags)

get number of addresses for a given host.

### Prototype
```c
size_t aws_host_resolver_get_host_address_count( struct aws_host_resolver *resolver, const struct aws_string *host_name, uint32_t flags);
```
"""
function aws_host_resolver_get_host_address_count(resolver, host_name, flags)
    ccall((:aws_host_resolver_get_host_address_count, libawscrt), Csize_t, (Ptr{aws_host_resolver}, Ptr{aws_string}, UInt32), resolver, host_name, flags)
end

# typedef void ( aws_host_listener_resolved_address_fn ) ( /* Listener that owns this callback. */ struct aws_host_listener * listener , /* Array list of aws_host_address structures.  To get an item:
#     *
#     * struct aws_host_address *host_address = NULL;
#     * aws_array_list_get_at_ptr(new_address_list, (void **)&host_address, address_index);
#     * */ const struct aws_array_list * new_address_list , /* User data that was specified when adding the listener. */ void * user_data )
const aws_host_listener_resolved_address_fn = Cvoid

# typedef void ( aws_host_listener_expired_address_fn ) ( /* Listener that owns this callback. */ struct aws_host_listener * listener , /* Array list of aws_host_address structures.  To get an item:
#     *
#     * struct aws_host_address *host_address = NULL;
#     * aws_array_list_get_at_ptr(new_address_list, (void **)&host_address, address_index);
#     * */ const struct aws_array_list * expired_address_list , /* User data that was specified when adding the listener. */ void * user_data )
const aws_host_listener_expired_address_fn = Cvoid

# typedef void ( aws_host_listener_shutdown_fn ) ( void * user_data )
const aws_host_listener_shutdown_fn = Cvoid

struct aws_host_listener_options
    host_name::aws_byte_cursor
    resolved_address_callback::Ptr{Cvoid}
    expired_address_callback::Ptr{Cvoid}
    shutdown_callback::Ptr{Cvoid}
    user_data::Ptr{Cvoid}
    pin_host_entry::Bool
end

"""
    aws_host_resolver_add_host_listener(resolver, options)

### Prototype
```c
struct aws_host_listener *aws_host_resolver_add_host_listener( struct aws_host_resolver *resolver, const struct aws_host_listener_options *options);
```
"""
function aws_host_resolver_add_host_listener(resolver, options)
    ccall((:aws_host_resolver_add_host_listener, libawscrt), Ptr{aws_host_listener}, (Ptr{aws_host_resolver}, Ptr{aws_host_listener_options}), resolver, options)
end

"""
    aws_host_resolver_remove_host_listener(resolver, listener)

### Prototype
```c
int aws_host_resolver_remove_host_listener( struct aws_host_resolver *resolver, struct aws_host_listener *listener);
```
"""
function aws_host_resolver_remove_host_listener(resolver, listener)
    ccall((:aws_host_resolver_remove_host_listener, libawscrt), Cint, (Ptr{aws_host_resolver}, Ptr{aws_host_listener}), resolver, listener)
end

# typedef void ( aws_channel_on_message_write_completed_fn ) ( struct aws_channel * channel , struct aws_io_message * message , int err_code , void * user_data )
const aws_channel_on_message_write_completed_fn = Cvoid

# typedef int ( aws_io_clock_fn ) ( uint64_t * timestamp )
const aws_io_clock_fn = Cvoid

@cenum aws_io_errors::UInt32 begin
    AWS_IO_CHANNEL_ERROR_ERROR_CANT_ACCEPT_INPUT = 1024
    AWS_IO_CHANNEL_UNKNOWN_MESSAGE_TYPE = 1025
    AWS_IO_CHANNEL_READ_WOULD_EXCEED_WINDOW = 1026
    AWS_IO_EVENT_LOOP_ALREADY_ASSIGNED = 1027
    AWS_IO_EVENT_LOOP_SHUTDOWN = 1028
    AWS_IO_TLS_ERROR_NEGOTIATION_FAILURE = 1029
    AWS_IO_TLS_ERROR_NOT_NEGOTIATED = 1030
    AWS_IO_TLS_ERROR_WRITE_FAILURE = 1031
    AWS_IO_TLS_ERROR_ALERT_RECEIVED = 1032
    AWS_IO_TLS_CTX_ERROR = 1033
    AWS_IO_TLS_VERSION_UNSUPPORTED = 1034
    AWS_IO_TLS_CIPHER_PREF_UNSUPPORTED = 1035
    AWS_IO_MISSING_ALPN_MESSAGE = 1036
    AWS_IO_UNHANDLED_ALPN_PROTOCOL_MESSAGE = 1037
    AWS_IO_FILE_VALIDATION_FAILURE = 1038
    AWS_ERROR_IO_EVENT_LOOP_THREAD_ONLY = 1039
    AWS_ERROR_IO_ALREADY_SUBSCRIBED = 1040
    AWS_ERROR_IO_NOT_SUBSCRIBED = 1041
    AWS_ERROR_IO_OPERATION_CANCELLED = 1042
    AWS_IO_READ_WOULD_BLOCK = 1043
    AWS_IO_BROKEN_PIPE = 1044
    AWS_IO_SOCKET_UNSUPPORTED_ADDRESS_FAMILY = 1045
    AWS_IO_SOCKET_INVALID_OPERATION_FOR_TYPE = 1046
    AWS_IO_SOCKET_CONNECTION_REFUSED = 1047
    AWS_IO_SOCKET_TIMEOUT = 1048
    AWS_IO_SOCKET_NO_ROUTE_TO_HOST = 1049
    AWS_IO_SOCKET_NETWORK_DOWN = 1050
    AWS_IO_SOCKET_CLOSED = 1051
    AWS_IO_SOCKET_NOT_CONNECTED = 1052
    AWS_IO_SOCKET_INVALID_OPTIONS = 1053
    AWS_IO_SOCKET_ADDRESS_IN_USE = 1054
    AWS_IO_SOCKET_INVALID_ADDRESS = 1055
    AWS_IO_SOCKET_ILLEGAL_OPERATION_FOR_STATE = 1056
    AWS_IO_SOCKET_CONNECT_ABORTED = 1057
    AWS_IO_DNS_QUERY_FAILED = 1058
    AWS_IO_DNS_INVALID_NAME = 1059
    AWS_IO_DNS_NO_ADDRESS_FOR_HOST = 1060
    AWS_IO_DNS_HOST_REMOVED_FROM_CACHE = 1061
    AWS_IO_STREAM_INVALID_SEEK_POSITION = 1062
    AWS_IO_STREAM_READ_FAILED = 1063
    DEPRECATED_AWS_IO_INVALID_FILE_HANDLE = 1064
    AWS_IO_SHARED_LIBRARY_LOAD_FAILURE = 1065
    AWS_IO_SHARED_LIBRARY_FIND_SYMBOL_FAILURE = 1066
    AWS_IO_TLS_NEGOTIATION_TIMEOUT = 1067
    AWS_IO_TLS_ALERT_NOT_GRACEFUL = 1068
    AWS_IO_MAX_RETRIES_EXCEEDED = 1069
    AWS_IO_RETRY_PERMISSION_DENIED = 1070
    AWS_IO_TLS_DIGEST_ALGORITHM_UNSUPPORTED = 1071
    AWS_IO_TLS_SIGNATURE_ALGORITHM_UNSUPPORTED = 1072
    AWS_ERROR_PKCS11_VERSION_UNSUPPORTED = 1073
    AWS_ERROR_PKCS11_TOKEN_NOT_FOUND = 1074
    AWS_ERROR_PKCS11_KEY_NOT_FOUND = 1075
    AWS_ERROR_PKCS11_KEY_TYPE_UNSUPPORTED = 1076
    AWS_ERROR_PKCS11_UNKNOWN_CRYPTOKI_RETURN_VALUE = 1077
    AWS_ERROR_PKCS11_CKR_CANCEL = 1078
    AWS_ERROR_PKCS11_CKR_HOST_MEMORY = 1079
    AWS_ERROR_PKCS11_CKR_SLOT_ID_INVALID = 1080
    AWS_ERROR_PKCS11_CKR_GENERAL_ERROR = 1081
    AWS_ERROR_PKCS11_CKR_FUNCTION_FAILED = 1082
    AWS_ERROR_PKCS11_CKR_ARGUMENTS_BAD = 1083
    AWS_ERROR_PKCS11_CKR_NO_EVENT = 1084
    AWS_ERROR_PKCS11_CKR_NEED_TO_CREATE_THREADS = 1085
    AWS_ERROR_PKCS11_CKR_CANT_LOCK = 1086
    AWS_ERROR_PKCS11_CKR_ATTRIBUTE_READ_ONLY = 1087
    AWS_ERROR_PKCS11_CKR_ATTRIBUTE_SENSITIVE = 1088
    AWS_ERROR_PKCS11_CKR_ATTRIBUTE_TYPE_INVALID = 1089
    AWS_ERROR_PKCS11_CKR_ATTRIBUTE_VALUE_INVALID = 1090
    AWS_ERROR_PKCS11_CKR_ACTION_PROHIBITED = 1091
    AWS_ERROR_PKCS11_CKR_DATA_INVALID = 1092
    AWS_ERROR_PKCS11_CKR_DATA_LEN_RANGE = 1093
    AWS_ERROR_PKCS11_CKR_DEVICE_ERROR = 1094
    AWS_ERROR_PKCS11_CKR_DEVICE_MEMORY = 1095
    AWS_ERROR_PKCS11_CKR_DEVICE_REMOVED = 1096
    AWS_ERROR_PKCS11_CKR_ENCRYPTED_DATA_INVALID = 1097
    AWS_ERROR_PKCS11_CKR_ENCRYPTED_DATA_LEN_RANGE = 1098
    AWS_ERROR_PKCS11_CKR_FUNCTION_CANCELED = 1099
    AWS_ERROR_PKCS11_CKR_FUNCTION_NOT_PARALLEL = 1100
    AWS_ERROR_PKCS11_CKR_FUNCTION_NOT_SUPPORTED = 1101
    AWS_ERROR_PKCS11_CKR_KEY_HANDLE_INVALID = 1102
    AWS_ERROR_PKCS11_CKR_KEY_SIZE_RANGE = 1103
    AWS_ERROR_PKCS11_CKR_KEY_TYPE_INCONSISTENT = 1104
    AWS_ERROR_PKCS11_CKR_KEY_NOT_NEEDED = 1105
    AWS_ERROR_PKCS11_CKR_KEY_CHANGED = 1106
    AWS_ERROR_PKCS11_CKR_KEY_NEEDED = 1107
    AWS_ERROR_PKCS11_CKR_KEY_INDIGESTIBLE = 1108
    AWS_ERROR_PKCS11_CKR_KEY_FUNCTION_NOT_PERMITTED = 1109
    AWS_ERROR_PKCS11_CKR_KEY_NOT_WRAPPABLE = 1110
    AWS_ERROR_PKCS11_CKR_KEY_UNEXTRACTABLE = 1111
    AWS_ERROR_PKCS11_CKR_MECHANISM_INVALID = 1112
    AWS_ERROR_PKCS11_CKR_MECHANISM_PARAM_INVALID = 1113
    AWS_ERROR_PKCS11_CKR_OBJECT_HANDLE_INVALID = 1114
    AWS_ERROR_PKCS11_CKR_OPERATION_ACTIVE = 1115
    AWS_ERROR_PKCS11_CKR_OPERATION_NOT_INITIALIZED = 1116
    AWS_ERROR_PKCS11_CKR_PIN_INCORRECT = 1117
    AWS_ERROR_PKCS11_CKR_PIN_INVALID = 1118
    AWS_ERROR_PKCS11_CKR_PIN_LEN_RANGE = 1119
    AWS_ERROR_PKCS11_CKR_PIN_EXPIRED = 1120
    AWS_ERROR_PKCS11_CKR_PIN_LOCKED = 1121
    AWS_ERROR_PKCS11_CKR_SESSION_CLOSED = 1122
    AWS_ERROR_PKCS11_CKR_SESSION_COUNT = 1123
    AWS_ERROR_PKCS11_CKR_SESSION_HANDLE_INVALID = 1124
    AWS_ERROR_PKCS11_CKR_SESSION_PARALLEL_NOT_SUPPORTED = 1125
    AWS_ERROR_PKCS11_CKR_SESSION_READ_ONLY = 1126
    AWS_ERROR_PKCS11_CKR_SESSION_EXISTS = 1127
    AWS_ERROR_PKCS11_CKR_SESSION_READ_ONLY_EXISTS = 1128
    AWS_ERROR_PKCS11_CKR_SESSION_READ_WRITE_SO_EXISTS = 1129
    AWS_ERROR_PKCS11_CKR_SIGNATURE_INVALID = 1130
    AWS_ERROR_PKCS11_CKR_SIGNATURE_LEN_RANGE = 1131
    AWS_ERROR_PKCS11_CKR_TEMPLATE_INCOMPLETE = 1132
    AWS_ERROR_PKCS11_CKR_TEMPLATE_INCONSISTENT = 1133
    AWS_ERROR_PKCS11_CKR_TOKEN_NOT_PRESENT = 1134
    AWS_ERROR_PKCS11_CKR_TOKEN_NOT_RECOGNIZED = 1135
    AWS_ERROR_PKCS11_CKR_TOKEN_WRITE_PROTECTED = 1136
    AWS_ERROR_PKCS11_CKR_UNWRAPPING_KEY_HANDLE_INVALID = 1137
    AWS_ERROR_PKCS11_CKR_UNWRAPPING_KEY_SIZE_RANGE = 1138
    AWS_ERROR_PKCS11_CKR_UNWRAPPING_KEY_TYPE_INCONSISTENT = 1139
    AWS_ERROR_PKCS11_CKR_USER_ALREADY_LOGGED_IN = 1140
    AWS_ERROR_PKCS11_CKR_USER_NOT_LOGGED_IN = 1141
    AWS_ERROR_PKCS11_CKR_USER_PIN_NOT_INITIALIZED = 1142
    AWS_ERROR_PKCS11_CKR_USER_TYPE_INVALID = 1143
    AWS_ERROR_PKCS11_CKR_USER_ANOTHER_ALREADY_LOGGED_IN = 1144
    AWS_ERROR_PKCS11_CKR_USER_TOO_MANY_TYPES = 1145
    AWS_ERROR_PKCS11_CKR_WRAPPED_KEY_INVALID = 1146
    AWS_ERROR_PKCS11_CKR_WRAPPED_KEY_LEN_RANGE = 1147
    AWS_ERROR_PKCS11_CKR_WRAPPING_KEY_HANDLE_INVALID = 1148
    AWS_ERROR_PKCS11_CKR_WRAPPING_KEY_SIZE_RANGE = 1149
    AWS_ERROR_PKCS11_CKR_WRAPPING_KEY_TYPE_INCONSISTENT = 1150
    AWS_ERROR_PKCS11_CKR_RANDOM_SEED_NOT_SUPPORTED = 1151
    AWS_ERROR_PKCS11_CKR_RANDOM_NO_RNG = 1152
    AWS_ERROR_PKCS11_CKR_DOMAIN_PARAMS_INVALID = 1153
    AWS_ERROR_PKCS11_CKR_CURVE_NOT_SUPPORTED = 1154
    AWS_ERROR_PKCS11_CKR_BUFFER_TOO_SMALL = 1155
    AWS_ERROR_PKCS11_CKR_SAVED_STATE_INVALID = 1156
    AWS_ERROR_PKCS11_CKR_INFORMATION_SENSITIVE = 1157
    AWS_ERROR_PKCS11_CKR_STATE_UNSAVEABLE = 1158
    AWS_ERROR_PKCS11_CKR_CRYPTOKI_NOT_INITIALIZED = 1159
    AWS_ERROR_PKCS11_CKR_CRYPTOKI_ALREADY_INITIALIZED = 1160
    AWS_ERROR_PKCS11_CKR_MUTEX_BAD = 1161
    AWS_ERROR_PKCS11_CKR_MUTEX_NOT_LOCKED = 1162
    AWS_ERROR_PKCS11_CKR_NEW_PIN_MODE = 1163
    AWS_ERROR_PKCS11_CKR_NEXT_OTP = 1164
    AWS_ERROR_PKCS11_CKR_EXCEEDED_MAX_ITERATIONS = 1165
    AWS_ERROR_PKCS11_CKR_FIPS_SELF_TEST_FAILED = 1166
    AWS_ERROR_PKCS11_CKR_LIBRARY_LOAD_FAILED = 1167
    AWS_ERROR_PKCS11_CKR_PIN_TOO_WEAK = 1168
    AWS_ERROR_PKCS11_CKR_PUBLIC_KEY_INVALID = 1169
    AWS_ERROR_PKCS11_CKR_FUNCTION_REJECTED = 1170
    AWS_ERROR_IO_PINNED_EVENT_LOOP_MISMATCH = 1171
    AWS_IO_ERROR_END_RANGE = 2047
    AWS_IO_INVALID_FILE_HANDLE = 50
end

"""
    aws_io_library_init(allocator)

Initializes internal datastructures used by aws-c-io. Must be called before using any functionality in aws-c-io.

### Prototype
```c
void aws_io_library_init(struct aws_allocator *allocator);
```
"""
function aws_io_library_init(allocator)
    ccall((:aws_io_library_init, libawscrt), Cvoid, (Ptr{aws_allocator},), allocator)
end

"""
    aws_io_library_clean_up()

Shuts down the internal datastructures used by aws-c-io.

### Prototype
```c
void aws_io_library_clean_up(void);
```
"""
function aws_io_library_clean_up()
    ccall((:aws_io_library_clean_up, libawscrt), Cvoid, ())
end

"""
    aws_io_fatal_assert_library_initialized()

### Prototype
```c
void aws_io_fatal_assert_library_initialized(void);
```
"""
function aws_io_fatal_assert_library_initialized()
    ccall((:aws_io_fatal_assert_library_initialized, libawscrt), Cvoid, ())
end

@cenum aws_io_log_subject::UInt32 begin
    AWS_LS_IO_GENERAL = 1024
    AWS_LS_IO_EVENT_LOOP = 1025
    AWS_LS_IO_SOCKET = 1026
    AWS_LS_IO_SOCKET_HANDLER = 1027
    AWS_LS_IO_TLS = 1028
    AWS_LS_IO_ALPN = 1029
    AWS_LS_IO_DNS = 1030
    AWS_LS_IO_PKI = 1031
    AWS_LS_IO_CHANNEL = 1032
    AWS_LS_IO_CHANNEL_BOOTSTRAP = 1033
    AWS_LS_IO_FILE_UTILS = 1034
    AWS_LS_IO_SHARED_LIBRARY = 1035
    AWS_LS_IO_EXPONENTIAL_BACKOFF_RETRY_STRATEGY = 1036
    AWS_LS_IO_STANDARD_RETRY_STRATEGY = 1037
    AWS_LS_IO_PKCS11 = 1038
    AWS_IO_LS_LAST = 2047
end

struct aws_memory_pool
    alloc::Ptr{aws_allocator}
    stack::aws_array_list
    ideal_segment_count::UInt16
    segment_size::Csize_t
    data_ptr::Ptr{Cvoid}
end

struct aws_message_pool
    alloc::Ptr{aws_allocator}
    application_data_pool::aws_memory_pool
    small_block_pool::aws_memory_pool
end

struct aws_message_pool_creation_args
    application_data_msg_data_size::Csize_t
    application_data_msg_count::UInt8
    small_block_msg_data_size::Csize_t
    small_block_msg_count::UInt8
end

"""
    aws_memory_pool_init(mempool, alloc, ideal_segment_count, segment_size)

### Prototype
```c
int aws_memory_pool_init( struct aws_memory_pool *mempool, struct aws_allocator *alloc, uint16_t ideal_segment_count, size_t segment_size);
```
"""
function aws_memory_pool_init(mempool, alloc, ideal_segment_count, segment_size)
    ccall((:aws_memory_pool_init, libawscrt), Cint, (Ptr{aws_memory_pool}, Ptr{aws_allocator}, UInt16, Csize_t), mempool, alloc, ideal_segment_count, segment_size)
end

"""
    aws_memory_pool_clean_up(mempool)

### Prototype
```c
void aws_memory_pool_clean_up(struct aws_memory_pool *mempool);
```
"""
function aws_memory_pool_clean_up(mempool)
    ccall((:aws_memory_pool_clean_up, libawscrt), Cvoid, (Ptr{aws_memory_pool},), mempool)
end

"""
    aws_memory_pool_acquire(mempool)

Acquires memory from the pool if available, otherwise, it attempts to allocate and returns the result.

### Prototype
```c
void *aws_memory_pool_acquire(struct aws_memory_pool *mempool);
```
"""
function aws_memory_pool_acquire(mempool)
    ccall((:aws_memory_pool_acquire, libawscrt), Ptr{Cvoid}, (Ptr{aws_memory_pool},), mempool)
end

"""
    aws_memory_pool_release(mempool, to_release)

Releases memory to the pool if space is available, otherwise frees `to_release`

### Prototype
```c
void aws_memory_pool_release(struct aws_memory_pool *mempool, void *to_release);
```
"""
function aws_memory_pool_release(mempool, to_release)
    ccall((:aws_memory_pool_release, libawscrt), Cvoid, (Ptr{aws_memory_pool}, Ptr{Cvoid}), mempool, to_release)
end

"""
    aws_message_pool_init(msg_pool, alloc, args)

Initializes message pool using 'msg\\_pool' as the backing pool, 'args' is copied.

### Prototype
```c
int aws_message_pool_init( struct aws_message_pool *msg_pool, struct aws_allocator *alloc, struct aws_message_pool_creation_args *args);
```
"""
function aws_message_pool_init(msg_pool, alloc, args)
    ccall((:aws_message_pool_init, libawscrt), Cint, (Ptr{aws_message_pool}, Ptr{aws_allocator}, Ptr{aws_message_pool_creation_args}), msg_pool, alloc, args)
end

"""
    aws_message_pool_clean_up(msg_pool)

### Prototype
```c
void aws_message_pool_clean_up(struct aws_message_pool *msg_pool);
```
"""
function aws_message_pool_clean_up(msg_pool)
    ccall((:aws_message_pool_clean_up, libawscrt), Cvoid, (Ptr{aws_message_pool},), msg_pool)
end

"""
    aws_message_pool_acquire(msg_pool, message_type, size_hint)

Acquires a message from the pool if available, otherwise, it attempts to allocate. If a message is acquired, note that size\\_hint is just a hint. the return value's capacity will be set to the actual buffer size.

### Prototype
```c
struct aws_io_message *aws_message_pool_acquire( struct aws_message_pool *msg_pool, enum aws_io_message_type message_type, size_t size_hint);
```
"""
function aws_message_pool_acquire(msg_pool, message_type, size_hint)
    ccall((:aws_message_pool_acquire, libawscrt), Ptr{aws_io_message}, (Ptr{aws_message_pool}, aws_io_message_type, Csize_t), msg_pool, message_type, size_hint)
end

"""
    aws_message_pool_release(msg_pool, message)

Releases message to the pool if space is available, otherwise frees `message`

### Parameters
* `message`:
### Prototype
```c
void aws_message_pool_release(struct aws_message_pool *msg_pool, struct aws_io_message *message);
```
"""
function aws_message_pool_release(msg_pool, message)
    ccall((:aws_message_pool_release, libawscrt), Cvoid, (Ptr{aws_message_pool}, Ptr{aws_io_message}), msg_pool, message)
end

struct aws_pipe_read_end
    impl_data::Ptr{Cvoid}
end

struct aws_pipe_write_end
    impl_data::Ptr{Cvoid}
end

# typedef void ( aws_pipe_on_readable_fn ) ( struct aws_pipe_read_end * read_end , int error_code , void * user_data )
"""
Callback for when the pipe is readable (edge-triggered), or an error has occurred. Afer subscribing, the callback is invoked when the pipe has data to read, or the pipe has an error. The readable callback is invoked again any time the user reads all data, and then more data arrives. Note that it will not be invoked again if the pipe still has unread data when more data arrives. `error_code` of AWS\\_ERROR\\_SUCCESS indicates a readable event, and otherwise contains the value of the error. `user_data` corresponds to the `user_data` passed into aws\\_pipe\\_subscribe\\_to\\_read\\_events(). This callback is always invoked on the read-end's event-loop thread.
"""
const aws_pipe_on_readable_fn = Cvoid

# typedef void ( aws_pipe_on_write_completed_fn ) ( struct aws_pipe_write_end * write_end , int error_code , struct aws_byte_cursor src_buffer , void * user_data )
"""
Callback for when the asynchronous [`aws_pipe_write`](@ref)() operation has either completed or failed. `write_end` will be NULL if this callback is invoked after the the write-end has been cleaned up, this does not necessarily mean that the write operation failed. `error_code` will be AWS\\_ERROR\\_SUCCESS if all data was written, or a code corresponding to the error. `src_buffer` corresponds to the buffer passed into [`aws_pipe_write`](@ref)() `user_data` corresponds to the `user_data` passed into [`aws_pipe_write`](@ref)(). This callback is always invoked on the write-end's event-loop thread.
"""
const aws_pipe_on_write_completed_fn = Cvoid

"""
    aws_pipe_init(read_end, read_end_event_loop, write_end, write_end_event_loop, allocator)

Opens an OS specific bidirectional pipe. The read direction is stored in read\\_end. Write direction is stored in write\\_end. Each end must be connected to an event-loop, and further calls to each end must happen on that event-loop's thread.

### Prototype
```c
int aws_pipe_init( struct aws_pipe_read_end *read_end, struct aws_event_loop *read_end_event_loop, struct aws_pipe_write_end *write_end, struct aws_event_loop *write_end_event_loop, struct aws_allocator *allocator);
```
"""
function aws_pipe_init(read_end, read_end_event_loop, write_end, write_end_event_loop, allocator)
    ccall((:aws_pipe_init, libawscrt), Cint, (Ptr{aws_pipe_read_end}, Ptr{aws_event_loop}, Ptr{aws_pipe_write_end}, Ptr{aws_event_loop}, Ptr{aws_allocator}), read_end, read_end_event_loop, write_end, write_end_event_loop, allocator)
end

"""
    aws_pipe_clean_up_read_end(read_end)

Clean up the read-end of the pipe. This must be called on the thread of the connected event-loop.

### Prototype
```c
int aws_pipe_clean_up_read_end(struct aws_pipe_read_end *read_end);
```
"""
function aws_pipe_clean_up_read_end(read_end)
    ccall((:aws_pipe_clean_up_read_end, libawscrt), Cint, (Ptr{aws_pipe_read_end},), read_end)
end

"""
    aws_pipe_clean_up_write_end(write_end)

Clean up the write-end of the pipe. This must be called on the thread of the connected event-loop.

### Prototype
```c
int aws_pipe_clean_up_write_end(struct aws_pipe_write_end *write_end);
```
"""
function aws_pipe_clean_up_write_end(write_end)
    ccall((:aws_pipe_clean_up_write_end, libawscrt), Cint, (Ptr{aws_pipe_write_end},), write_end)
end

"""
    aws_pipe_get_read_end_event_loop(read_end)

Get the event-loop connected to the read-end of the pipe. This may be called on any thread.

### Prototype
```c
struct aws_event_loop *aws_pipe_get_read_end_event_loop(const struct aws_pipe_read_end *read_end);
```
"""
function aws_pipe_get_read_end_event_loop(read_end)
    ccall((:aws_pipe_get_read_end_event_loop, libawscrt), Ptr{aws_event_loop}, (Ptr{aws_pipe_read_end},), read_end)
end

"""
    aws_pipe_get_write_end_event_loop(write_end)

Get the event-loop connected to the write-end of the pipe. This may be called on any thread.

### Prototype
```c
struct aws_event_loop *aws_pipe_get_write_end_event_loop(const struct aws_pipe_write_end *write_end);
```
"""
function aws_pipe_get_write_end_event_loop(write_end)
    ccall((:aws_pipe_get_write_end_event_loop, libawscrt), Ptr{aws_event_loop}, (Ptr{aws_pipe_write_end},), write_end)
end

"""
    aws_pipe_write(write_end, src_buffer, on_completed, user_data)

Initiates an asynchrous write from the source buffer to the pipe. The data referenced by `src_buffer` must remain in memory until the operation completes. `on_complete` is called on the event-loop thread when the operation has either completed or failed. The callback's pipe argument will be NULL if the callback is invoked after the pipe has been cleaned up. This must be called on the thread of the connected event-loop.

### Prototype
```c
int aws_pipe_write( struct aws_pipe_write_end *write_end, struct aws_byte_cursor src_buffer, aws_pipe_on_write_completed_fn *on_completed, void *user_data);
```
"""
function aws_pipe_write(write_end, src_buffer, on_completed, user_data)
    ccall((:aws_pipe_write, libawscrt), Cint, (Ptr{aws_pipe_write_end}, aws_byte_cursor, Ptr{Cvoid}, Ptr{Cvoid}), write_end, src_buffer, on_completed, user_data)
end

"""
    aws_pipe_read(read_end, dst_buffer, num_bytes_read)

Read data from the pipe into the destination buffer. Attempts to read enough to fill all remaining space in the buffer, from `dst\\_buffer->len` to `dst\\_buffer->capacity`. `dst\\_buffer->len` is updated to reflect the buffer's new length. `num_bytes_read` (optional) is set to the total number of bytes read. This function never blocks. If no bytes could be read without blocking, then [`AWS_OP_ERR`](@ref) is returned and [`aws_last_error`](@ref)() code will be AWS\\_IO\\_READ\\_WOULD\\_BLOCK. This must be called on the thread of the connected event-loop.

### Prototype
```c
int aws_pipe_read(struct aws_pipe_read_end *read_end, struct aws_byte_buf *dst_buffer, size_t *num_bytes_read);
```
"""
function aws_pipe_read(read_end, dst_buffer, num_bytes_read)
    ccall((:aws_pipe_read, libawscrt), Cint, (Ptr{aws_pipe_read_end}, Ptr{aws_byte_buf}, Ptr{Csize_t}), read_end, dst_buffer, num_bytes_read)
end

"""
    aws_pipe_subscribe_to_readable_events(read_end, on_readable, user_data)

Subscribe to be notified when the pipe becomes readable (edge-triggered), or an error occurs. `on_readable` is invoked on the event-loop's thread when the pipe has data to read, or the pipe has an error. `on_readable` is invoked again any time the user reads all data, and then more data arrives. Note that it will not be invoked again if the pipe still has unread data when more data arrives. This must be called on the thread of the connected event-loop.

### Prototype
```c
int aws_pipe_subscribe_to_readable_events( struct aws_pipe_read_end *read_end, aws_pipe_on_readable_fn *on_readable, void *user_data);
```
"""
function aws_pipe_subscribe_to_readable_events(read_end, on_readable, user_data)
    ccall((:aws_pipe_subscribe_to_readable_events, libawscrt), Cint, (Ptr{aws_pipe_read_end}, Ptr{Cvoid}, Ptr{Cvoid}), read_end, on_readable, user_data)
end

"""
    aws_pipe_unsubscribe_from_readable_events(read_end)

Stop receiving notifications about events on the read-end of the pipe. This must be called on the thread of the connected event-loop.

### Prototype
```c
int aws_pipe_unsubscribe_from_readable_events(struct aws_pipe_read_end *read_end);
```
"""
function aws_pipe_unsubscribe_from_readable_events(read_end)
    ccall((:aws_pipe_unsubscribe_from_readable_events, libawscrt), Cint, (Ptr{aws_pipe_read_end},), read_end)
end

"""
    aws_pkcs11_lib_behavior

Controls how [`aws_pkcs11_lib`](@ref) calls C\\_Initialize() and C\\_Finalize() on the PKCS#11 library.
"""
@cenum aws_pkcs11_lib_behavior::UInt32 begin
    AWS_PKCS11_LIB_DEFAULT_BEHAVIOR = 0
    AWS_PKCS11_LIB_OMIT_INITIALIZE = 1
    AWS_PKCS11_LIB_STRICT_INITIALIZE_FINALIZE = 2
end

"""
    aws_pkcs11_lib_options

Options for [`aws_pkcs11_lib_new`](@ref)()
"""
struct aws_pkcs11_lib_options
    filename::aws_byte_cursor
    initialize_finalize_behavior::aws_pkcs11_lib_behavior
end

mutable struct aws_pkcs11_lib end

"""
    aws_pkcs11_lib_new(allocator, options)

Load and initialize a PKCS#11 library. See [`aws_pkcs11_lib_options`](@ref) for options.

If successful a valid pointer is returned. You must call [`aws_pkcs11_lib_release`](@ref)() when you are done with it. If unsuccessful, NULL is returned and an error is set.

### Prototype
```c
struct aws_pkcs11_lib *aws_pkcs11_lib_new( struct aws_allocator *allocator, const struct aws_pkcs11_lib_options *options);
```
"""
function aws_pkcs11_lib_new(allocator, options)
    ccall((:aws_pkcs11_lib_new, libawscrt), Ptr{aws_pkcs11_lib}, (Ptr{aws_allocator}, Ptr{aws_pkcs11_lib_options}), allocator, options)
end

"""
    aws_pkcs11_lib_acquire(pkcs11_lib)

Acquire a reference to a PKCS#11 library, preventing it from being cleaned up. You must call [`aws_pkcs11_lib_release`](@ref)() when you are done with it. This function returns whatever was passed in. It cannot fail.

### Prototype
```c
struct aws_pkcs11_lib *aws_pkcs11_lib_acquire(struct aws_pkcs11_lib *pkcs11_lib);
```
"""
function aws_pkcs11_lib_acquire(pkcs11_lib)
    ccall((:aws_pkcs11_lib_acquire, libawscrt), Ptr{aws_pkcs11_lib}, (Ptr{aws_pkcs11_lib},), pkcs11_lib)
end

"""
    aws_pkcs11_lib_release(pkcs11_lib)

Release a reference to the PKCS#11 library. When the last reference is released, the library is cleaned up.

### Prototype
```c
void aws_pkcs11_lib_release(struct aws_pkcs11_lib *pkcs11_lib);
```
"""
function aws_pkcs11_lib_release(pkcs11_lib)
    ccall((:aws_pkcs11_lib_release, libawscrt), Cvoid, (Ptr{aws_pkcs11_lib},), pkcs11_lib)
end

# typedef void ( aws_retry_strategy_on_retry_token_acquired_fn ) ( struct aws_retry_strategy * retry_strategy , int error_code , struct aws_retry_token * token , void * user_data )
"""
Invoked upon the acquisition, or failure to acquire a retry token. This function will always be invoked if and only if [`aws_retry_strategy_acquire_retry_token`](@ref)() returns [`AWS_OP_SUCCESS`](@ref). It will never be invoked synchronously from [`aws_retry_strategy_acquire_retry_token`](@ref)(). Token will always be NULL if error\\_code is non-zero, and vice-versa. If token is non-null, it will have a reference count of 1, and you must call [`aws_retry_token_release`](@ref)() on it later. See the comments for [`aws_retry_strategy_on_retry_ready_fn`](@ref) for more info.
"""
const aws_retry_strategy_on_retry_token_acquired_fn = Cvoid

# typedef void ( aws_retry_strategy_on_retry_ready_fn ) ( struct aws_retry_token * token , int error_code , void * user_data )
"""
Invoked after a successful call to [`aws_retry_strategy_schedule_retry`](@ref)(). This function will always be invoked if and only if [`aws_retry_strategy_schedule_retry`](@ref)() returns [`AWS_OP_SUCCESS`](@ref). It will never be invoked synchronously from [`aws_retry_strategy_schedule_retry`](@ref)(). After attempting the operation, either call [`aws_retry_strategy_schedule_retry`](@ref)() with an [`aws_retry_error_type`](@ref) or call [`aws_retry_token_record_success`](@ref)() and then release the token via. [`aws_retry_token_release`](@ref)().
"""
const aws_retry_strategy_on_retry_ready_fn = Cvoid

@cenum aws_retry_error_type::UInt32 begin
    AWS_RETRY_ERROR_TYPE_TRANSIENT = 0
    AWS_RETRY_ERROR_TYPE_THROTTLING = 1
    AWS_RETRY_ERROR_TYPE_SERVER_ERROR = 2
    AWS_RETRY_ERROR_TYPE_CLIENT_ERROR = 3
end

struct aws_retry_token
    allocator::Ptr{aws_allocator}
    retry_strategy::Ptr{aws_retry_strategy}
    ref_count::aws_atomic_var
    impl::Ptr{Cvoid}
end

"""
    aws_exponential_backoff_jitter_mode

Jitter mode for exponential backoff.

For a great writeup on these options see: https://aws.amazon.com/blogs/architecture/exponential-backoff-and-jitter/
"""
@cenum aws_exponential_backoff_jitter_mode::UInt32 begin
    AWS_EXPONENTIAL_BACKOFF_JITTER_DEFAULT = 0
    AWS_EXPONENTIAL_BACKOFF_JITTER_NONE = 1
    AWS_EXPONENTIAL_BACKOFF_JITTER_FULL = 2
    AWS_EXPONENTIAL_BACKOFF_JITTER_DECORRELATED = 3
end

"""
    aws_exponential_backoff_retry_options

Options for exponential backoff retry strategy. el\\_group must be set, any other option, if set to 0 will signify "use defaults"
"""
struct aws_exponential_backoff_retry_options
    el_group::Ptr{aws_event_loop_group}
    max_retries::Csize_t
    backoff_scale_factor_ms::UInt32
    jitter_mode::aws_exponential_backoff_jitter_mode
    generate_random::Ptr{Cvoid}
end

struct aws_standard_retry_options
    backoff_retry_options::aws_exponential_backoff_retry_options
    initial_bucket_capacity::Csize_t
end

"""
    aws_retry_strategy_acquire(retry_strategy)

Acquire a reference count on retry\\_strategy.

### Prototype
```c
void aws_retry_strategy_acquire(struct aws_retry_strategy *retry_strategy);
```
"""
function aws_retry_strategy_acquire(retry_strategy)
    ccall((:aws_retry_strategy_acquire, libawscrt), Cvoid, (Ptr{aws_retry_strategy},), retry_strategy)
end

"""
    aws_retry_strategy_release(retry_strategy)

Releases a reference count on retry\\_strategy.

### Prototype
```c
void aws_retry_strategy_release(struct aws_retry_strategy *retry_strategy);
```
"""
function aws_retry_strategy_release(retry_strategy)
    ccall((:aws_retry_strategy_release, libawscrt), Cvoid, (Ptr{aws_retry_strategy},), retry_strategy)
end

"""
    aws_retry_strategy_acquire_retry_token(retry_strategy, partition_id, on_acquired, user_data, timeout_ms)

Attempts to acquire a retry token for use with retries. On success, on\\_acquired will be invoked when a token is available, or an error will be returned if the timeout expires. partition\\_id identifies operations that should be grouped together. This allows for more sophisticated strategies such as AIMD and circuit breaker patterns. Pass NULL to use the global partition.

### Prototype
```c
int aws_retry_strategy_acquire_retry_token( struct aws_retry_strategy *retry_strategy, const struct aws_byte_cursor *partition_id, aws_retry_strategy_on_retry_token_acquired_fn *on_acquired, void *user_data, uint64_t timeout_ms);
```
"""
function aws_retry_strategy_acquire_retry_token(retry_strategy, partition_id, on_acquired, user_data, timeout_ms)
    ccall((:aws_retry_strategy_acquire_retry_token, libawscrt), Cint, (Ptr{aws_retry_strategy}, Ptr{aws_byte_cursor}, Ptr{Cvoid}, Ptr{Cvoid}, UInt64), retry_strategy, partition_id, on_acquired, user_data, timeout_ms)
end

"""
    aws_retry_strategy_schedule_retry(token, error_type, retry_ready, user_data)

Schedules a retry based on the backoff and token based strategies. retry\\_ready is invoked when the retry is either ready for execution or if it has been canceled due to application shutdown.

This function can return an error to reject the retry attempt if, for example, a circuit breaker has opened. If this occurs users should fail their calls back to their callers.

error\\_type is used for book keeping. See the comments above for [`aws_retry_error_type`](@ref).

### Prototype
```c
int aws_retry_strategy_schedule_retry( struct aws_retry_token *token, enum aws_retry_error_type error_type, aws_retry_strategy_on_retry_ready_fn *retry_ready, void *user_data);
```
"""
function aws_retry_strategy_schedule_retry(token, error_type, retry_ready, user_data)
    ccall((:aws_retry_strategy_schedule_retry, libawscrt), Cint, (Ptr{aws_retry_token}, aws_retry_error_type, Ptr{Cvoid}, Ptr{Cvoid}), token, error_type, retry_ready, user_data)
end

"""
    aws_retry_token_record_success(token)

Records a successful retry. This is used for making future decisions to open up token buckets, AIMD breakers etc... some strategies such as exponential backoff will ignore this, but you should always call it after a successful operation or your system will never recover during an outage.

### Prototype
```c
int aws_retry_token_record_success(struct aws_retry_token *token);
```
"""
function aws_retry_token_record_success(token)
    ccall((:aws_retry_token_record_success, libawscrt), Cint, (Ptr{aws_retry_token},), token)
end

"""
    aws_retry_token_acquire(token)

Increments reference count for token. This should be called any time you seat the token to a pointer you own.

### Prototype
```c
void aws_retry_token_acquire(struct aws_retry_token *token);
```
"""
function aws_retry_token_acquire(token)
    ccall((:aws_retry_token_acquire, libawscrt), Cvoid, (Ptr{aws_retry_token},), token)
end

"""
    aws_retry_token_release(token)

Releases the reference count for token. This should always be invoked after either calling [`aws_retry_strategy_schedule_retry`](@ref)() and failing, or after calling [`aws_retry_token_record_success`](@ref)().

### Prototype
```c
void aws_retry_token_release(struct aws_retry_token *token);
```
"""
function aws_retry_token_release(token)
    ccall((:aws_retry_token_release, libawscrt), Cvoid, (Ptr{aws_retry_token},), token)
end

"""
    aws_retry_strategy_new_exponential_backoff(allocator, config)

Creates a retry strategy using exponential backoff. This strategy does not perform any bookkeeping on error types and success. There is no circuit breaker functionality in here. See the comments above for [`aws_exponential_backoff_retry_options`](@ref).

### Prototype
```c
struct aws_retry_strategy *aws_retry_strategy_new_exponential_backoff( struct aws_allocator *allocator, const struct aws_exponential_backoff_retry_options *config);
```
"""
function aws_retry_strategy_new_exponential_backoff(allocator, config)
    ccall((:aws_retry_strategy_new_exponential_backoff, libawscrt), Ptr{aws_retry_strategy}, (Ptr{aws_allocator}, Ptr{aws_exponential_backoff_retry_options}), allocator, config)
end

"""
    aws_retry_strategy_new_standard(allocator, config)

This is a retry implementation that cuts off traffic if it's detected that an endpoint partition is having availability problems. This is necessary to keep from making outages worse by scheduling work that's unlikely to succeed yet increases load on an already ailing system.

We do this by creating a bucket for each partition. A partition is an arbitrary specifier. It can be anything: a region, a service, a combination of region and service, a literal dns name.... doesn't matter.

Each bucket has a budget for maximum allowed retries. Different types of events carry different weights. Things that indicate an unhealthy partition such as transient errors (timeouts, unhealthy connection etc...) cost more. A retry for any other reason (service sending a 5xx response code) cost a bit less. When a retry is attempted this capacity is leased out to the retry. On success it is released back to the capacity pool. On failure, it remains leased. Operations that succeed without a retry slowly restore the capacity pool.

If a partition runs out of capacity it is assumed unhealthy and retries will be blocked until capacity returns to the pool. To prevent a partition from staying unhealthy after an outage has recovered, new requests that succeed without a retry will increase the capacity slowly ( a new request gets a payback lease of 1, but the lease is never actually deducted from the capacity pool).

### Prototype
```c
struct aws_retry_strategy *aws_retry_strategy_new_standard( struct aws_allocator *allocator, const struct aws_standard_retry_options *config);
```
"""
function aws_retry_strategy_new_standard(allocator, config)
    ccall((:aws_retry_strategy_new_standard, libawscrt), Ptr{aws_retry_strategy}, (Ptr{aws_allocator}, Ptr{aws_standard_retry_options}), allocator, config)
end

struct aws_shared_library
    library_handle::Ptr{Cvoid}
end

# typedef void ( * aws_generic_function ) ( void )
const aws_generic_function = Ptr{Cvoid}

"""
    aws_shared_library_init(library, library_path)

### Prototype
```c
int aws_shared_library_init(struct aws_shared_library *library, const char *library_path);
```
"""
function aws_shared_library_init(library, library_path)
    ccall((:aws_shared_library_init, libawscrt), Cint, (Ptr{aws_shared_library}, Ptr{Cchar}), library, library_path)
end

"""
    aws_shared_library_clean_up(library)

### Prototype
```c
void aws_shared_library_clean_up(struct aws_shared_library *library);
```
"""
function aws_shared_library_clean_up(library)
    ccall((:aws_shared_library_clean_up, libawscrt), Cvoid, (Ptr{aws_shared_library},), library)
end

"""
    aws_shared_library_find_function(library, symbol_name, function_address)

### Prototype
```c
int aws_shared_library_find_function( struct aws_shared_library *library, const char *symbol_name, aws_generic_function *function_address);
```
"""
function aws_shared_library_find_function(library, symbol_name, function_address)
    ccall((:aws_shared_library_find_function, libawscrt), Cint, (Ptr{aws_shared_library}, Ptr{Cchar}, Ptr{aws_generic_function}), library, symbol_name, function_address)
end

# typedef void ( aws_socket_on_connection_result_fn ) ( struct aws_socket * socket , int error_code , void * user_data )
"""
Called in client mode when an outgoing connection has succeeded or an error has occurred. If the connection was successful error\\_code will be AWS\\_ERROR\\_SUCCESS and the socket has already been assigned to the event loop specified in [`aws_socket_connect`](@ref)().

If an error occurred error\\_code will be non-zero.
"""
const aws_socket_on_connection_result_fn = Cvoid

# typedef void ( aws_socket_on_accept_result_fn ) ( struct aws_socket * socket , int error_code , struct aws_socket * new_socket , void * user_data )
"""
Called by a listening socket when either an incoming connection has been received or an error occurred.

In the normal use-case, this function will be called multiple times over the lifetime of a single listening socket. new\\_socket is already connected and initialized, and is using the same options and allocator as the listening socket. A user may want to call [`aws_socket_set_options`](@ref)() on the new socket if different options are desired.

new\\_socket is not yet assigned to an event-loop. The user should call [`aws_socket_assign_to_event_loop`](@ref)() before performing IO operations.

When error\\_code is AWS\\_ERROR\\_SUCCESS, new\\_socket is the recently accepted connection. If error\\_code is non-zero, an error occurred and you should [`aws_socket_close`](@ref)() the socket.

Do not call [`aws_socket_clean_up`](@ref)() from this callback.
"""
const aws_socket_on_accept_result_fn = Cvoid

# typedef void ( aws_socket_on_write_completed_fn ) ( struct aws_socket * socket , int error_code , size_t bytes_written , void * user_data )
"""
Callback for when the data passed to a call to [`aws_socket_write`](@ref)() has either completed or failed. On success, error\\_code will be AWS\\_ERROR\\_SUCCESS.
"""
const aws_socket_on_write_completed_fn = Cvoid

# typedef void ( aws_socket_on_readable_fn ) ( struct aws_socket * socket , int error_code , void * user_data )
"""
Callback for when socket is either readable (edge-triggered) or when an error has occurred. If the socket is readable, error\\_code will be AWS\\_ERROR\\_SUCCESS.
"""
const aws_socket_on_readable_fn = Cvoid

"""
    aws_socket_init(socket, alloc, options)

Initializes a socket object with socket options. options will be copied.

### Prototype
```c
int aws_socket_init( struct aws_socket *socket, struct aws_allocator *alloc, const struct aws_socket_options *options);
```
"""
function aws_socket_init(socket, alloc, options)
    ccall((:aws_socket_init, libawscrt), Cint, (Ptr{aws_socket}, Ptr{aws_allocator}, Ptr{aws_socket_options}), socket, alloc, options)
end

"""
    aws_socket_clean_up(socket)

Shuts down any pending operations on the socket, and cleans up state. The socket object can be re-initialized after this operation. This function calls [`aws_socket_close`](@ref). If you have not already called [`aws_socket_close`](@ref)() on the socket, all of the rules for [`aws_socket_close`](@ref)() apply here. In this case it will not fail if you use the function improperly, but on some platforms you will certainly leak memory.

If the socket has already been closed, you can safely, call this from any thread.

### Prototype
```c
void aws_socket_clean_up(struct aws_socket *socket);
```
"""
function aws_socket_clean_up(socket)
    ccall((:aws_socket_clean_up, libawscrt), Cvoid, (Ptr{aws_socket},), socket)
end

"""
    aws_socket_connect(socket, remote_endpoint, event_loop, on_connection_result, user_data)

Connects to a remote endpoint. In UDP, this simply binds the socket to a remote address for use with `[`aws_socket_write`](@ref)()`, and if the operation is successful, the socket can immediately be used for write operations.

In TCP, LOCAL and VSOCK this function will not block. If the return value is successful, then you must wait on the `on\\_connection\\_result()` callback to be invoked before using the socket.

If an event\\_loop is provided for UDP sockets, a notification will be sent on on\\_connection\\_result in the event-loop's thread. Upon completion, the socket will already be assigned an event loop. If NULL is passed for UDP, it will immediately return upon success, but you must call [`aws_socket_assign_to_event_loop`](@ref) before use.

### Prototype
```c
int aws_socket_connect( struct aws_socket *socket, const struct aws_socket_endpoint *remote_endpoint, struct aws_event_loop *event_loop, aws_socket_on_connection_result_fn *on_connection_result, void *user_data);
```
"""
function aws_socket_connect(socket, remote_endpoint, event_loop, on_connection_result, user_data)
    ccall((:aws_socket_connect, libawscrt), Cint, (Ptr{aws_socket}, Ptr{aws_socket_endpoint}, Ptr{aws_event_loop}, Ptr{Cvoid}, Ptr{Cvoid}), socket, remote_endpoint, event_loop, on_connection_result, user_data)
end

"""
    aws_socket_bind(socket, local_endpoint)

Binds the socket to a local address. In UDP mode, the socket is ready for `[`aws_socket_read`](@ref)()` operations. In connection oriented modes, you still must call `[`aws_socket_listen`](@ref)()` and `[`aws_socket_start_accept`](@ref)()` before using the socket. local\\_endpoint is copied.

### Prototype
```c
int aws_socket_bind(struct aws_socket *socket, const struct aws_socket_endpoint *local_endpoint);
```
"""
function aws_socket_bind(socket, local_endpoint)
    ccall((:aws_socket_bind, libawscrt), Cint, (Ptr{aws_socket}, Ptr{aws_socket_endpoint}), socket, local_endpoint)
end

"""
    aws_socket_listen(socket, backlog_size)

TCP, LOCAL and VSOCK only. Sets up the socket to listen on the address bound to in `[`aws_socket_bind`](@ref)()`.

### Prototype
```c
int aws_socket_listen(struct aws_socket *socket, int backlog_size);
```
"""
function aws_socket_listen(socket, backlog_size)
    ccall((:aws_socket_listen, libawscrt), Cint, (Ptr{aws_socket}, Cint), socket, backlog_size)
end

"""
    aws_socket_start_accept(socket, accept_loop, on_accept_result, user_data)

TCP, LOCAL and VSOCK only. The socket will begin accepting new connections. This is an asynchronous operation. New connections or errors will arrive via the `on_accept_result` callback.

[`aws_socket_bind`](@ref)() and [`aws_socket_listen`](@ref)() must be called before calling this function.

### Prototype
```c
int aws_socket_start_accept( struct aws_socket *socket, struct aws_event_loop *accept_loop, aws_socket_on_accept_result_fn *on_accept_result, void *user_data);
```
"""
function aws_socket_start_accept(socket, accept_loop, on_accept_result, user_data)
    ccall((:aws_socket_start_accept, libawscrt), Cint, (Ptr{aws_socket}, Ptr{aws_event_loop}, Ptr{Cvoid}, Ptr{Cvoid}), socket, accept_loop, on_accept_result, user_data)
end

"""
    aws_socket_stop_accept(socket)

TCP, LOCAL and VSOCK only. The listening socket will stop accepting new connections. It is safe to call `[`aws_socket_start_accept`](@ref)()` again after this operation. This can be called from any thread but be aware, on some platforms, if you call this from outside of the current event loop's thread, it will block until the event loop finishes processing the request for unsubscribe in it's own thread.

### Prototype
```c
int aws_socket_stop_accept(struct aws_socket *socket);
```
"""
function aws_socket_stop_accept(socket)
    ccall((:aws_socket_stop_accept, libawscrt), Cint, (Ptr{aws_socket},), socket)
end

"""
    aws_socket_close(socket)

Calls `close()` on the socket and unregisters all io operations from the event loop. This function must be called from the event-loop's thread unless this is a listening socket. If it's a listening socket it can be called from any non-event-loop thread or the event-loop the socket is currently assigned to. If called from outside the event-loop, this function will block waiting on the socket to close. If this is called from an event-loop thread other than the one it's assigned to, it presents the possibility of a deadlock, so don't do it.

### Prototype
```c
int aws_socket_close(struct aws_socket *socket);
```
"""
function aws_socket_close(socket)
    ccall((:aws_socket_close, libawscrt), Cint, (Ptr{aws_socket},), socket)
end

"""
    aws_socket_shutdown_dir(socket, dir)

Calls `shutdown()` on the socket based on direction.

### Prototype
```c
int aws_socket_shutdown_dir(struct aws_socket *socket, enum aws_channel_direction dir);
```
"""
function aws_socket_shutdown_dir(socket, dir)
    ccall((:aws_socket_shutdown_dir, libawscrt), Cint, (Ptr{aws_socket}, aws_channel_direction), socket, dir)
end

"""
    aws_socket_set_options(socket, options)

Sets new socket options on the underlying socket. This is mainly useful in context of accepting a new connection via: `on\\_incoming\\_connection()`. options is copied.

### Prototype
```c
int aws_socket_set_options(struct aws_socket *socket, const struct aws_socket_options *options);
```
"""
function aws_socket_set_options(socket, options)
    ccall((:aws_socket_set_options, libawscrt), Cint, (Ptr{aws_socket}, Ptr{aws_socket_options}), socket, options)
end

"""
    aws_socket_assign_to_event_loop(socket, event_loop)

Assigns the socket to the event-loop. The socket will begin receiving read/write/error notifications after this call.

Note: If you called connect for TCP or Unix Domain Sockets and received a connection\\_success callback, this has already happened. You only need to call this function when:

a.) This socket is a server socket (e.g. a result of a call to start\\_accept()) b.) This socket is a UDP socket.

### Prototype
```c
int aws_socket_assign_to_event_loop(struct aws_socket *socket, struct aws_event_loop *event_loop);
```
"""
function aws_socket_assign_to_event_loop(socket, event_loop)
    ccall((:aws_socket_assign_to_event_loop, libawscrt), Cint, (Ptr{aws_socket}, Ptr{aws_event_loop}), socket, event_loop)
end

"""
    aws_socket_get_event_loop(socket)

Gets the event-loop the socket is assigned to.

### Prototype
```c
struct aws_event_loop *aws_socket_get_event_loop(struct aws_socket *socket);
```
"""
function aws_socket_get_event_loop(socket)
    ccall((:aws_socket_get_event_loop, libawscrt), Ptr{aws_event_loop}, (Ptr{aws_socket},), socket)
end

"""
    aws_socket_subscribe_to_readable_events(socket, on_readable, user_data)

Subscribes on\\_readable to notifications when the socket goes readable (edge-triggered). Errors will also be recieved in the callback.

Note! This function is technically not thread safe, but we do not enforce which thread you call from. It's your responsibility to either call this in safely (e.g. just don't call it in parallel from multiple threads) or schedule a task to call it. If you call it before your first call to read, it will be fine.

### Prototype
```c
int aws_socket_subscribe_to_readable_events( struct aws_socket *socket, aws_socket_on_readable_fn *on_readable, void *user_data);
```
"""
function aws_socket_subscribe_to_readable_events(socket, on_readable, user_data)
    ccall((:aws_socket_subscribe_to_readable_events, libawscrt), Cint, (Ptr{aws_socket}, Ptr{Cvoid}, Ptr{Cvoid}), socket, on_readable, user_data)
end

"""
    aws_socket_read(socket, buffer, amount_read)

Reads from the socket. This call is non-blocking and will return `AWS_IO_SOCKET_READ_WOULD_BLOCK` if no data is available. `read` is the amount of data read into `buffer`.

Attempts to read enough to fill all remaining space in the buffer, from `buffer->len` to `buffer->capacity`. `buffer->len` is updated to reflect the buffer's new length.

Use [`aws_socket_subscribe_to_readable_events`](@ref)() to receive notifications of when the socket goes readable.

NOTE! This function must be called from the event-loop used in [`aws_socket_assign_to_event_loop`](@ref)

### Prototype
```c
int aws_socket_read(struct aws_socket *socket, struct aws_byte_buf *buffer, size_t *amount_read);
```
"""
function aws_socket_read(socket, buffer, amount_read)
    ccall((:aws_socket_read, libawscrt), Cint, (Ptr{aws_socket}, Ptr{aws_byte_buf}, Ptr{Csize_t}), socket, buffer, amount_read)
end

"""
    aws_socket_write(socket, cursor, written_fn, user_data)

Writes to the socket. This call is non-blocking and will attempt to write as much as it can, but will queue any remaining portion of the data for write when available. written\\_fn will be invoked once the entire cursor has been written, or the write failed or was cancelled.

NOTE! This function must be called from the event-loop used in [`aws_socket_assign_to_event_loop`](@ref)

For client sockets, connect() and [`aws_socket_assign_to_event_loop`](@ref)() must be called before calling this.

For incoming sockets from a listener, [`aws_socket_assign_to_event_loop`](@ref)() must be called first.

### Prototype
```c
int aws_socket_write( struct aws_socket *socket, const struct aws_byte_cursor *cursor, aws_socket_on_write_completed_fn *written_fn, void *user_data);
```
"""
function aws_socket_write(socket, cursor, written_fn, user_data)
    ccall((:aws_socket_write, libawscrt), Cint, (Ptr{aws_socket}, Ptr{aws_byte_cursor}, Ptr{Cvoid}, Ptr{Cvoid}), socket, cursor, written_fn, user_data)
end

"""
    aws_socket_get_error(socket)

Gets the latest error from the socket. If no error has occurred [`AWS_OP_SUCCESS`](@ref) will be returned. This function does not raise any errors to the installed error handlers.

### Prototype
```c
int aws_socket_get_error(struct aws_socket *socket);
```
"""
function aws_socket_get_error(socket)
    ccall((:aws_socket_get_error, libawscrt), Cint, (Ptr{aws_socket},), socket)
end

"""
    aws_socket_is_open(socket)

Returns true if the socket is still open (doesn't mean connected or listening, only that it hasn't had close() called.

### Prototype
```c
bool aws_socket_is_open(struct aws_socket *socket);
```
"""
function aws_socket_is_open(socket)
    ccall((:aws_socket_is_open, libawscrt), Bool, (Ptr{aws_socket},), socket)
end

"""
    aws_socket_handler_new(allocator, socket, slot, max_read_size)

Socket handlers should be the first slot/handler in a channel. It interacts directly with the channel's event loop for read and write notifications. max\\_read\\_size is the maximum amount of data it will read from the socket before a context switch (a continuation task will be scheduled).

### Prototype
```c
struct aws_channel_handler *aws_socket_handler_new( struct aws_allocator *allocator, struct aws_socket *socket, struct aws_channel_slot *slot, size_t max_read_size);
```
"""
function aws_socket_handler_new(allocator, socket, slot, max_read_size)
    ccall((:aws_socket_handler_new, libawscrt), Ptr{aws_channel_handler}, (Ptr{aws_allocator}, Ptr{aws_socket}, Ptr{aws_channel_slot}, Csize_t), allocator, socket, slot, max_read_size)
end

@cenum aws_crt_io_statistics_category::UInt32 begin
    AWSCRT_STAT_CAT_SOCKET = 256
    AWSCRT_STAT_CAT_TLS = 257
end

"""
    aws_crt_statistics_socket

Socket channel handler statistics record
"""
struct aws_crt_statistics_socket
    category::aws_crt_statistics_category_t
    bytes_read::UInt64
    bytes_written::UInt64
end

"""
    aws_tls_negotiation_status

An enum for the current state of tls negotiation within a tls channel handler
"""
@cenum aws_tls_negotiation_status::UInt32 begin
    AWS_TLS_NEGOTIATION_STATUS_NONE = 0
    AWS_TLS_NEGOTIATION_STATUS_ONGOING = 1
    AWS_TLS_NEGOTIATION_STATUS_SUCCESS = 2
    AWS_TLS_NEGOTIATION_STATUS_FAILURE = 3
end

"""
    aws_crt_statistics_tls

Tls channel handler statistics record
"""
struct aws_crt_statistics_tls
    category::aws_crt_statistics_category_t
    handshake_start_ns::UInt64
    handshake_end_ns::UInt64
    handshake_status::aws_tls_negotiation_status
end

"""
    aws_crt_statistics_socket_init(stats)

Initializes socket channel handler statistics

### Prototype
```c
int aws_crt_statistics_socket_init(struct aws_crt_statistics_socket *stats);
```
"""
function aws_crt_statistics_socket_init(stats)
    ccall((:aws_crt_statistics_socket_init, libawscrt), Cint, (Ptr{aws_crt_statistics_socket},), stats)
end

"""
    aws_crt_statistics_socket_cleanup(stats)

Cleans up socket channel handler statistics

### Prototype
```c
void aws_crt_statistics_socket_cleanup(struct aws_crt_statistics_socket *stats);
```
"""
function aws_crt_statistics_socket_cleanup(stats)
    ccall((:aws_crt_statistics_socket_cleanup, libawscrt), Cvoid, (Ptr{aws_crt_statistics_socket},), stats)
end

"""
    aws_crt_statistics_socket_reset(stats)

Resets socket channel handler statistics for the next gather interval. Calculate-once results are left alone.

### Prototype
```c
void aws_crt_statistics_socket_reset(struct aws_crt_statistics_socket *stats);
```
"""
function aws_crt_statistics_socket_reset(stats)
    ccall((:aws_crt_statistics_socket_reset, libawscrt), Cvoid, (Ptr{aws_crt_statistics_socket},), stats)
end

"""
    aws_crt_statistics_tls_init(stats)

Initializes tls channel handler statistics

### Prototype
```c
int aws_crt_statistics_tls_init(struct aws_crt_statistics_tls *stats);
```
"""
function aws_crt_statistics_tls_init(stats)
    ccall((:aws_crt_statistics_tls_init, libawscrt), Cint, (Ptr{aws_crt_statistics_tls},), stats)
end

"""
    aws_crt_statistics_tls_cleanup(stats)

Cleans up tls channel handler statistics

### Prototype
```c
void aws_crt_statistics_tls_cleanup(struct aws_crt_statistics_tls *stats);
```
"""
function aws_crt_statistics_tls_cleanup(stats)
    ccall((:aws_crt_statistics_tls_cleanup, libawscrt), Cvoid, (Ptr{aws_crt_statistics_tls},), stats)
end

"""
    aws_crt_statistics_tls_reset(stats)

Resets tls channel handler statistics for the next gather interval. Calculate-once results are left alone.

### Prototype
```c
void aws_crt_statistics_tls_reset(struct aws_crt_statistics_tls *stats);
```
"""
function aws_crt_statistics_tls_reset(stats)
    ccall((:aws_crt_statistics_tls_reset, libawscrt), Cvoid, (Ptr{aws_crt_statistics_tls},), stats)
end

@cenum aws_stream_seek_basis::UInt32 begin
    AWS_SSB_BEGIN = 0
    AWS_SSB_END = 2
end

struct aws_stream_status
    is_end_of_stream::Bool
    is_valid::Bool
end

"""
    aws_input_stream_seek(stream, offset, basis)

### Prototype
```c
int aws_input_stream_seek(struct aws_input_stream *stream, int64_t offset, enum aws_stream_seek_basis basis);
```
"""
function aws_input_stream_seek(stream, offset, basis)
    ccall((:aws_input_stream_seek, libawscrt), Cint, (Ptr{aws_input_stream}, Int64, aws_stream_seek_basis), stream, offset, basis)
end

"""
    aws_input_stream_read(stream, dest)

### Prototype
```c
int aws_input_stream_read(struct aws_input_stream *stream, struct aws_byte_buf *dest);
```
"""
function aws_input_stream_read(stream, dest)
    ccall((:aws_input_stream_read, libawscrt), Cint, (Ptr{aws_input_stream}, Ptr{aws_byte_buf}), stream, dest)
end

"""
    aws_input_stream_get_status(stream, status)

### Prototype
```c
int aws_input_stream_get_status(struct aws_input_stream *stream, struct aws_stream_status *status);
```
"""
function aws_input_stream_get_status(stream, status)
    ccall((:aws_input_stream_get_status, libawscrt), Cint, (Ptr{aws_input_stream}, Ptr{aws_stream_status}), stream, status)
end

"""
    aws_input_stream_get_length(stream, out_length)

### Prototype
```c
int aws_input_stream_get_length(struct aws_input_stream *stream, int64_t *out_length);
```
"""
function aws_input_stream_get_length(stream, out_length)
    ccall((:aws_input_stream_get_length, libawscrt), Cint, (Ptr{aws_input_stream}, Ptr{Int64}), stream, out_length)
end

"""
    aws_input_stream_destroy(stream)

### Prototype
```c
void aws_input_stream_destroy(struct aws_input_stream *stream);
```
"""
function aws_input_stream_destroy(stream)
    ccall((:aws_input_stream_destroy, libawscrt), Cvoid, (Ptr{aws_input_stream},), stream)
end

"""
    aws_input_stream_new_from_cursor(allocator, cursor)

### Prototype
```c
struct aws_input_stream *aws_input_stream_new_from_cursor( struct aws_allocator *allocator, const struct aws_byte_cursor *cursor);
```
"""
function aws_input_stream_new_from_cursor(allocator, cursor)
    ccall((:aws_input_stream_new_from_cursor, libawscrt), Ptr{aws_input_stream}, (Ptr{aws_allocator}, Ptr{aws_byte_cursor}), allocator, cursor)
end

"""
    aws_input_stream_new_from_file(allocator, file_name)

### Prototype
```c
struct aws_input_stream *aws_input_stream_new_from_file( struct aws_allocator *allocator, const char *file_name);
```
"""
function aws_input_stream_new_from_file(allocator, file_name)
    ccall((:aws_input_stream_new_from_file, libawscrt), Ptr{aws_input_stream}, (Ptr{aws_allocator}, Ptr{Cchar}), allocator, file_name)
end

"""
    aws_input_stream_new_from_open_file(allocator, file)

### Prototype
```c
struct aws_input_stream *aws_input_stream_new_from_open_file(struct aws_allocator *allocator, FILE *file);
```
"""
function aws_input_stream_new_from_open_file(allocator, file)
    ccall((:aws_input_stream_new_from_open_file, libawscrt), Ptr{aws_input_stream}, (Ptr{aws_allocator}, Ptr{Libc.FILE}), allocator, file)
end

mutable struct aws_pkcs11_session end

@cenum aws_tls_versions::UInt32 begin
    AWS_IO_SSLv3 = 0
    AWS_IO_TLSv1 = 1
    AWS_IO_TLSv1_1 = 2
    AWS_IO_TLSv1_2 = 3
    AWS_IO_TLSv1_3 = 4
    AWS_IO_TLS_VER_SYS_DEFAULTS = 128
end

@cenum aws_tls_cipher_pref::UInt32 begin
    AWS_IO_TLS_CIPHER_PREF_SYSTEM_DEFAULT = 0
    AWS_IO_TLS_CIPHER_PREF_KMS_PQ_TLSv1_0_2019_06 = 1
    AWS_IO_TLS_CIPHER_PREF_KMS_PQ_SIKE_TLSv1_0_2019_11 = 2
    AWS_IO_TLS_CIPHER_PREF_KMS_PQ_TLSv1_0_2020_02 = 3
    AWS_IO_TLS_CIPHER_PREF_KMS_PQ_SIKE_TLSv1_0_2020_02 = 4
    AWS_IO_TLS_CIPHER_PREF_KMS_PQ_TLSv1_0_2020_07 = 5
    AWS_IO_TLS_CIPHER_PREF_PQ_TLSv1_0_2021_05 = 6
    AWS_IO_TLS_CIPHER_PREF_END_RANGE = 65535
end

# typedef void ( aws_tls_on_negotiation_result_fn ) ( struct aws_channel_handler * handler , struct aws_channel_slot * slot , int error_code , void * user_data )
"""
Invoked upon completion of the TLS handshake. If successful error\\_code will be [`AWS_OP_SUCCESS`](@ref), otherwise the negotiation failed and immediately after this function is invoked, the channel will be shutting down.
"""
const aws_tls_on_negotiation_result_fn = Cvoid

# typedef void ( aws_tls_on_data_read_fn ) ( struct aws_channel_handler * handler , struct aws_channel_slot * slot , struct aws_byte_buf * buffer , void * user_data )
"""
Only used if the TLS handler is the last handler in the channel. This allows you to read any data that was read and decrypted by the handler. If you have application protocol channel handlers, this function is not necessary and certainly not recommended.
"""
const aws_tls_on_data_read_fn = Cvoid

# typedef void ( aws_tls_on_error_fn ) ( struct aws_channel_handler * handler , struct aws_channel_slot * slot , int err , const char * message , void * user_data )
"""
Invoked when an error occurs in the TLS state machine AFTER the handshake has completed. This function should only be used in conjunction with the rules of [`aws_tls_on_data_read_fn`](@ref).
"""
const aws_tls_on_error_fn = Cvoid

"""
    var"##Ctag#5981"

Set if using PKCS#11 for private key operations. See [`aws_tls_ctx_pkcs11_options`](@ref) for more details.
"""
struct var"##Ctag#5981"
    lib::Ptr{aws_pkcs11_lib}
    user_pin::Ptr{aws_string}
    token_label::Ptr{aws_string}
    private_key_object_label::Ptr{aws_string}
    slot_id::UInt64
    has_slot_id::Bool
end
function Base.getproperty(x::Ptr{var"##Ctag#5981"}, f::Symbol)
    f === :lib && return Ptr{Ptr{aws_pkcs11_lib}}(x + 0)
    f === :user_pin && return Ptr{Ptr{aws_string}}(x + 8)
    f === :token_label && return Ptr{Ptr{aws_string}}(x + 16)
    f === :private_key_object_label && return Ptr{Ptr{aws_string}}(x + 24)
    f === :slot_id && return Ptr{UInt64}(x + 32)
    f === :has_slot_id && return Ptr{Bool}(x + 40)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#5981", f::Symbol)
    r = Ref{var"##Ctag#5981"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#5981"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#5981"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct aws_tls_ctx_options
    data::NTuple{200, UInt8}
end

function Base.getproperty(x::Ptr{aws_tls_ctx_options}, f::Symbol)
    f === :allocator && return Ptr{Ptr{aws_allocator}}(x + 0)
    f === :minimum_tls_version && return Ptr{aws_tls_versions}(x + 8)
    f === :cipher_pref && return Ptr{aws_tls_cipher_pref}(x + 12)
    f === :ca_file && return Ptr{aws_byte_buf}(x + 16)
    f === :ca_path && return Ptr{Ptr{aws_string}}(x + 48)
    f === :alpn_list && return Ptr{Ptr{aws_string}}(x + 56)
    f === :certificate && return Ptr{aws_byte_buf}(x + 64)
    f === :private_key && return Ptr{aws_byte_buf}(x + 96)
    f === :max_fragment_size && return Ptr{Csize_t}(x + 128)
    f === :verify_peer && return Ptr{Bool}(x + 136)
    f === :ctx_options_extension && return Ptr{Ptr{Cvoid}}(x + 144)
    f === :pkcs11 && return Ptr{var"##Ctag#5981"}(x + 152)
    return getfield(x, f)
end

function Base.getproperty(x::aws_tls_ctx_options, f::Symbol)
    r = Ref{aws_tls_ctx_options}(x)
    ptr = Base.unsafe_convert(Ptr{aws_tls_ctx_options}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{aws_tls_ctx_options}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct aws_tls_negotiated_protocol_message
    protocol::aws_byte_buf
end

# typedef struct aws_channel_handler * ( * aws_tls_on_protocol_negotiated ) ( struct aws_channel_slot * new_slot , struct aws_byte_buf * protocol , void * user_data )
const aws_tls_on_protocol_negotiated = Ptr{Cvoid}

"""
    aws_tls_ctx_options_init_default_client(options, allocator)

****************************** tls options init stuff **********************

Initializes options with default client options

### Prototype
```c
void aws_tls_ctx_options_init_default_client( struct aws_tls_ctx_options *options, struct aws_allocator *allocator);
```
"""
function aws_tls_ctx_options_init_default_client(options, allocator)
    ccall((:aws_tls_ctx_options_init_default_client, libawscrt), Cvoid, (Ptr{aws_tls_ctx_options}, Ptr{aws_allocator}), options, allocator)
end

"""
    aws_tls_ctx_options_clean_up(options)

Cleans up resources allocated by init\\_* functions

### Prototype
```c
void aws_tls_ctx_options_clean_up(struct aws_tls_ctx_options *options);
```
"""
function aws_tls_ctx_options_clean_up(options)
    ccall((:aws_tls_ctx_options_clean_up, libawscrt), Cvoid, (Ptr{aws_tls_ctx_options},), options)
end

"""
    aws_tls_ctx_options_init_client_mtls_from_path(options, allocator, cert_path, pkey_path)

Initializes options for use with mutual tls in client mode. cert\\_path and pkey\\_path are paths to files on disk. cert\\_path and pkey\\_path are treated as PKCS#7 PEM armored. They are loaded from disk and stored in buffers internally.

NOTE: This is unsupported on iOS.

### Prototype
```c
int aws_tls_ctx_options_init_client_mtls_from_path( struct aws_tls_ctx_options *options, struct aws_allocator *allocator, const char *cert_path, const char *pkey_path);
```
"""
function aws_tls_ctx_options_init_client_mtls_from_path(options, allocator, cert_path, pkey_path)
    ccall((:aws_tls_ctx_options_init_client_mtls_from_path, libawscrt), Cint, (Ptr{aws_tls_ctx_options}, Ptr{aws_allocator}, Ptr{Cchar}, Ptr{Cchar}), options, allocator, cert_path, pkey_path)
end

"""
    aws_tls_ctx_options_init_client_mtls(options, allocator, cert, pkey)

Initializes options for use with mutual tls in client mode. cert and pkey are copied. cert and pkey are treated as PKCS#7 PEM armored.

NOTE: This is unsupported on iOS.

### Prototype
```c
int aws_tls_ctx_options_init_client_mtls( struct aws_tls_ctx_options *options, struct aws_allocator *allocator, const struct aws_byte_cursor *cert, const struct aws_byte_cursor *pkey);
```
"""
function aws_tls_ctx_options_init_client_mtls(options, allocator, cert, pkey)
    ccall((:aws_tls_ctx_options_init_client_mtls, libawscrt), Cint, (Ptr{aws_tls_ctx_options}, Ptr{aws_allocator}, Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}), options, allocator, cert, pkey)
end

"""
    aws_tls_ctx_pkcs11_options

This struct exists as a graceful way to pass many arguments when calling init-with-pkcs11 functions on [`aws_tls_ctx_options`](@ref) (this also makes it easy to introduce optional arguments in the future). Instances of this struct should only exist briefly on the stack.

Instructions for binding this to high-level languages: - Python: The members of this struct should be the keyword args to the init-with-pkcs11 functions. - JavaScript: This should be an options map passed to init-with-pkcs11 functions. - Java: This should be an options class passed to init-with-pkcs11 functions. - C++: Same as Java

Notes on integer types: PKCS#11 uses `unsigned long` for IDs, handles, etc but we expose them as `uint64_t` in public APIs. We do this because sizeof(long) is inconsistent across platform/arch/language (ex: always 64bit in Java, always 32bit in C on Windows, matches CPU in C on Linux and Apple). By using uint64\\_t in our public API, we can keep the careful bounds-checking all in one place, instead of expecting each high-level language binding to get it just right.
"""
struct aws_tls_ctx_pkcs11_options
    pkcs11_lib::Ptr{aws_pkcs11_lib}
    user_pin::aws_byte_cursor
    slot_id::Ptr{UInt64}
    token_label::aws_byte_cursor
    private_key_object_label::aws_byte_cursor
    cert_file_path::aws_byte_cursor
    cert_file_contents::aws_byte_cursor
end

"""
    aws_tls_ctx_options_init_client_mtls_with_pkcs11(options, allocator, pkcs11_options)

Initializes options for use with mutual TLS in client mode, where a PKCS#11 library provides access to the private key.

NOTE: This only works on Unix devices.

### Parameters
* `options`: [`aws_tls_ctx_options`](@ref) to be initialized.
* `allocator`: Allocator to use.
* `pkcs11_options`: Options for using PKCS#11 (contents are copied)
### Prototype
```c
int aws_tls_ctx_options_init_client_mtls_with_pkcs11( struct aws_tls_ctx_options *options, struct aws_allocator *allocator, const struct aws_tls_ctx_pkcs11_options *pkcs11_options);
```
"""
function aws_tls_ctx_options_init_client_mtls_with_pkcs11(options, allocator, pkcs11_options)
    ccall((:aws_tls_ctx_options_init_client_mtls_with_pkcs11, libawscrt), Cint, (Ptr{aws_tls_ctx_options}, Ptr{aws_allocator}, Ptr{aws_tls_ctx_pkcs11_options}), options, allocator, pkcs11_options)
end

"""
    aws_tls_ctx_options_set_keychain_path(options, keychain_path_cursor)

\\deprecated 

Sets a custom keychain path for storing the cert and pkey with mutual tls in client mode.

NOTE: This only works on MacOS.

### Prototype
```c
int aws_tls_ctx_options_set_keychain_path( struct aws_tls_ctx_options *options, struct aws_byte_cursor *keychain_path_cursor);
```
"""
function aws_tls_ctx_options_set_keychain_path(options, keychain_path_cursor)
    ccall((:aws_tls_ctx_options_set_keychain_path, libawscrt), Cint, (Ptr{aws_tls_ctx_options}, Ptr{aws_byte_cursor}), options, keychain_path_cursor)
end

"""
    aws_tls_ctx_options_init_default_server_from_path(options, allocator, cert_path, pkey_path)

Initializes options for use with in server mode. cert\\_path and pkey\\_path are paths to files on disk. cert\\_path and pkey\\_path are treated as PKCS#7 PEM armored. They are loaded from disk and stored in buffers internally.

### Prototype
```c
int aws_tls_ctx_options_init_default_server_from_path( struct aws_tls_ctx_options *options, struct aws_allocator *allocator, const char *cert_path, const char *pkey_path);
```
"""
function aws_tls_ctx_options_init_default_server_from_path(options, allocator, cert_path, pkey_path)
    ccall((:aws_tls_ctx_options_init_default_server_from_path, libawscrt), Cint, (Ptr{aws_tls_ctx_options}, Ptr{aws_allocator}, Ptr{Cchar}, Ptr{Cchar}), options, allocator, cert_path, pkey_path)
end

"""
    aws_tls_ctx_options_init_default_server(options, allocator, cert, pkey)

Initializes options for use with in server mode. cert and pkey are copied. cert and pkey are treated as PKCS#7 PEM armored.

### Prototype
```c
int aws_tls_ctx_options_init_default_server( struct aws_tls_ctx_options *options, struct aws_allocator *allocator, struct aws_byte_cursor *cert, struct aws_byte_cursor *pkey);
```
"""
function aws_tls_ctx_options_init_default_server(options, allocator, cert, pkey)
    ccall((:aws_tls_ctx_options_init_default_server, libawscrt), Cint, (Ptr{aws_tls_ctx_options}, Ptr{aws_allocator}, Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}), options, allocator, cert, pkey)
end

"""
    aws_tls_ctx_options_init_client_mtls_from_system_path(options, allocator, cert_reg_path)

Initializes options for use with mutual tls in client mode. cert\\_reg\\_path is the path to a system installed certficate/private key pair. Example: CurrentUser\\MY\\<thumprint>

NOTE: This only works on Windows.

### Prototype
```c
int aws_tls_ctx_options_init_client_mtls_from_system_path( struct aws_tls_ctx_options *options, struct aws_allocator *allocator, const char *cert_reg_path);
```
"""
function aws_tls_ctx_options_init_client_mtls_from_system_path(options, allocator, cert_reg_path)
    ccall((:aws_tls_ctx_options_init_client_mtls_from_system_path, libawscrt), Cint, (Ptr{aws_tls_ctx_options}, Ptr{aws_allocator}, Ptr{Cchar}), options, allocator, cert_reg_path)
end

"""
    aws_tls_ctx_options_init_default_server_from_system_path(options, allocator, cert_reg_path)

Initializes options for use with server mode. cert\\_reg\\_path is the path to a system installed certficate/private key pair. Example: CurrentUser\\MY\\<thumprint>

NOTE: This only works on Windows.

### Prototype
```c
int aws_tls_ctx_options_init_default_server_from_system_path( struct aws_tls_ctx_options *options, struct aws_allocator *allocator, const char *cert_reg_path);
```
"""
function aws_tls_ctx_options_init_default_server_from_system_path(options, allocator, cert_reg_path)
    ccall((:aws_tls_ctx_options_init_default_server_from_system_path, libawscrt), Cint, (Ptr{aws_tls_ctx_options}, Ptr{aws_allocator}, Ptr{Cchar}), options, allocator, cert_reg_path)
end

"""
    aws_tls_ctx_options_init_client_mtls_pkcs12_from_path(options, allocator, pkcs12_path, pkcs_pwd)

Initializes options for use with mutual tls in client mode. pkcs12\\_path is a path to a file on disk containing a pkcs#12 file. The file is loaded into an internal buffer. pkcs\\_pwd is the corresponding password for the pkcs#12 file; it is copied.

NOTE: This only works on Apple devices.

### Prototype
```c
int aws_tls_ctx_options_init_client_mtls_pkcs12_from_path( struct aws_tls_ctx_options *options, struct aws_allocator *allocator, const char *pkcs12_path, struct aws_byte_cursor *pkcs_pwd);
```
"""
function aws_tls_ctx_options_init_client_mtls_pkcs12_from_path(options, allocator, pkcs12_path, pkcs_pwd)
    ccall((:aws_tls_ctx_options_init_client_mtls_pkcs12_from_path, libawscrt), Cint, (Ptr{aws_tls_ctx_options}, Ptr{aws_allocator}, Ptr{Cchar}, Ptr{aws_byte_cursor}), options, allocator, pkcs12_path, pkcs_pwd)
end

"""
    aws_tls_ctx_options_init_client_mtls_pkcs12(options, allocator, pkcs12, pkcs_pwd)

Initializes options for use with mutual tls in client mode. pkcs12 is a buffer containing a pkcs#12 certificate and private key; it is copied. pkcs\\_pwd is the corresponding password for the pkcs#12 buffer; it is copied.

NOTE: This only works on Apple devices.

### Prototype
```c
int aws_tls_ctx_options_init_client_mtls_pkcs12( struct aws_tls_ctx_options *options, struct aws_allocator *allocator, struct aws_byte_cursor *pkcs12, struct aws_byte_cursor *pkcs_pwd);
```
"""
function aws_tls_ctx_options_init_client_mtls_pkcs12(options, allocator, pkcs12, pkcs_pwd)
    ccall((:aws_tls_ctx_options_init_client_mtls_pkcs12, libawscrt), Cint, (Ptr{aws_tls_ctx_options}, Ptr{aws_allocator}, Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}), options, allocator, pkcs12, pkcs_pwd)
end

"""
    aws_tls_ctx_options_init_server_pkcs12_from_path(options, allocator, pkcs12_path, pkcs_password)

Initializes options for use in server mode. pkcs12\\_path is a path to a file on disk containing a pkcs#12 file. The file is loaded into an internal buffer. pkcs\\_pwd is the corresponding password for the pkcs#12 file; it is copied.

NOTE: This only works on Apple devices.

### Prototype
```c
int aws_tls_ctx_options_init_server_pkcs12_from_path( struct aws_tls_ctx_options *options, struct aws_allocator *allocator, const char *pkcs12_path, struct aws_byte_cursor *pkcs_password);
```
"""
function aws_tls_ctx_options_init_server_pkcs12_from_path(options, allocator, pkcs12_path, pkcs_password)
    ccall((:aws_tls_ctx_options_init_server_pkcs12_from_path, libawscrt), Cint, (Ptr{aws_tls_ctx_options}, Ptr{aws_allocator}, Ptr{Cchar}, Ptr{aws_byte_cursor}), options, allocator, pkcs12_path, pkcs_password)
end

"""
    aws_tls_ctx_options_init_server_pkcs12(options, allocator, pkcs12, pkcs_password)

Initializes options for use in server mode. pkcs12 is a buffer containing a pkcs#12 certificate and private key; it is copied. pkcs\\_pwd is the corresponding password for the pkcs#12 buffer; it is copied.

NOTE: This only works on Apple devices.

### Prototype
```c
int aws_tls_ctx_options_init_server_pkcs12( struct aws_tls_ctx_options *options, struct aws_allocator *allocator, struct aws_byte_cursor *pkcs12, struct aws_byte_cursor *pkcs_password);
```
"""
function aws_tls_ctx_options_init_server_pkcs12(options, allocator, pkcs12, pkcs_password)
    ccall((:aws_tls_ctx_options_init_server_pkcs12, libawscrt), Cint, (Ptr{aws_tls_ctx_options}, Ptr{aws_allocator}, Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}), options, allocator, pkcs12, pkcs_password)
end

"""
    aws_tls_ctx_options_set_alpn_list(options, alpn_list)

Sets alpn list in the form <protocol1;protocol2;...>. A maximum of 4 protocols are supported. alpn\\_list is copied.

### Prototype
```c
int aws_tls_ctx_options_set_alpn_list(struct aws_tls_ctx_options *options, const char *alpn_list);
```
"""
function aws_tls_ctx_options_set_alpn_list(options, alpn_list)
    ccall((:aws_tls_ctx_options_set_alpn_list, libawscrt), Cint, (Ptr{aws_tls_ctx_options}, Ptr{Cchar}), options, alpn_list)
end

"""
    aws_tls_ctx_options_set_verify_peer(options, verify_peer)

Enables or disables x.509 validation. Disable this only for testing. To enable mutual TLS in server mode, set verify\\_peer to true.

### Prototype
```c
void aws_tls_ctx_options_set_verify_peer(struct aws_tls_ctx_options *options, bool verify_peer);
```
"""
function aws_tls_ctx_options_set_verify_peer(options, verify_peer)
    ccall((:aws_tls_ctx_options_set_verify_peer, libawscrt), Cvoid, (Ptr{aws_tls_ctx_options}, Bool), options, verify_peer)
end

"""
    aws_tls_ctx_options_set_minimum_tls_version(options, minimum_tls_version)

Sets the minimum TLS version to allow.

### Prototype
```c
void aws_tls_ctx_options_set_minimum_tls_version( struct aws_tls_ctx_options *options, enum aws_tls_versions minimum_tls_version);
```
"""
function aws_tls_ctx_options_set_minimum_tls_version(options, minimum_tls_version)
    ccall((:aws_tls_ctx_options_set_minimum_tls_version, libawscrt), Cvoid, (Ptr{aws_tls_ctx_options}, aws_tls_versions), options, minimum_tls_version)
end

"""
    aws_tls_ctx_options_override_default_trust_store(options, ca_file)

Override the default trust store. ca\\_file is a buffer containing a PEM armored chain of trusted CA certificates. ca\\_file is copied.

### Prototype
```c
int aws_tls_ctx_options_override_default_trust_store( struct aws_tls_ctx_options *options, const struct aws_byte_cursor *ca_file);
```
"""
function aws_tls_ctx_options_override_default_trust_store(options, ca_file)
    ccall((:aws_tls_ctx_options_override_default_trust_store, libawscrt), Cint, (Ptr{aws_tls_ctx_options}, Ptr{aws_byte_cursor}), options, ca_file)
end

"""
    aws_tls_ctx_options_override_default_trust_store_from_path(options, ca_path, ca_file)

Override the default trust store. ca\\_path is a path to a directory on disk containing trusted certificates. This is only supported on Unix systems (otherwise this parameter is ignored). ca\\_file is a path to a file on disk containing trusted certificates. ca\\_file is loaded from disk and stored in an internal buffer.

### Prototype
```c
int aws_tls_ctx_options_override_default_trust_store_from_path( struct aws_tls_ctx_options *options, const char *ca_path, const char *ca_file);
```
"""
function aws_tls_ctx_options_override_default_trust_store_from_path(options, ca_path, ca_file)
    ccall((:aws_tls_ctx_options_override_default_trust_store_from_path, libawscrt), Cint, (Ptr{aws_tls_ctx_options}, Ptr{Cchar}, Ptr{Cchar}), options, ca_path, ca_file)
end

"""
    aws_tls_ctx_options_set_extension_data(options, extension_data)

When implementing BYO\\_CRYPTO, if you need extra data to pass to your tls implementation, set it here. The lifetime of extension\\_data must outlive the options object and be cleaned up after options is cleaned up.

### Prototype
```c
void aws_tls_ctx_options_set_extension_data(struct aws_tls_ctx_options *options, void *extension_data);
```
"""
function aws_tls_ctx_options_set_extension_data(options, extension_data)
    ccall((:aws_tls_ctx_options_set_extension_data, libawscrt), Cvoid, (Ptr{aws_tls_ctx_options}, Ptr{Cvoid}), options, extension_data)
end

"""
    aws_tls_connection_options_init_from_ctx(conn_options, ctx)

Initializes default connection options from an instance ot [`aws_tls_ctx`](@ref).

### Prototype
```c
void aws_tls_connection_options_init_from_ctx( struct aws_tls_connection_options *conn_options, struct aws_tls_ctx *ctx);
```
"""
function aws_tls_connection_options_init_from_ctx(conn_options, ctx)
    ccall((:aws_tls_connection_options_init_from_ctx, libawscrt), Cvoid, (Ptr{aws_tls_connection_options}, Ptr{aws_tls_ctx}), conn_options, ctx)
end

"""
    aws_tls_connection_options_clean_up(connection_options)

Cleans up resources in [`aws_tls_connection_options`](@ref). This can be called immediately after initializing a tls handler, or if using the bootstrap api, immediately after asking for a channel.

### Prototype
```c
void aws_tls_connection_options_clean_up(struct aws_tls_connection_options *connection_options);
```
"""
function aws_tls_connection_options_clean_up(connection_options)
    ccall((:aws_tls_connection_options_clean_up, libawscrt), Cvoid, (Ptr{aws_tls_connection_options},), connection_options)
end

"""
    aws_tls_connection_options_copy(to, from)

Copies 'from' to 'to'

### Prototype
```c
int aws_tls_connection_options_copy( struct aws_tls_connection_options *to, const struct aws_tls_connection_options *from);
```
"""
function aws_tls_connection_options_copy(to, from)
    ccall((:aws_tls_connection_options_copy, libawscrt), Cint, (Ptr{aws_tls_connection_options}, Ptr{aws_tls_connection_options}), to, from)
end

"""
    aws_tls_connection_options_set_callbacks(conn_options, on_negotiation_result, on_data_read, on_error, user_data)

Sets callbacks for use with a tls connection.

### Prototype
```c
void aws_tls_connection_options_set_callbacks( struct aws_tls_connection_options *conn_options, aws_tls_on_negotiation_result_fn *on_negotiation_result, aws_tls_on_data_read_fn *on_data_read, aws_tls_on_error_fn *on_error, void *user_data);
```
"""
function aws_tls_connection_options_set_callbacks(conn_options, on_negotiation_result, on_data_read, on_error, user_data)
    ccall((:aws_tls_connection_options_set_callbacks, libawscrt), Cvoid, (Ptr{aws_tls_connection_options}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), conn_options, on_negotiation_result, on_data_read, on_error, user_data)
end

"""
    aws_tls_connection_options_set_server_name(conn_options, allocator, server_name)

Sets server name to use for the SNI extension (supported everywhere), as well as x.509 validation. If you don't set this, your x.509 validation will likely fail.

### Prototype
```c
int aws_tls_connection_options_set_server_name( struct aws_tls_connection_options *conn_options, struct aws_allocator *allocator, struct aws_byte_cursor *server_name);
```
"""
function aws_tls_connection_options_set_server_name(conn_options, allocator, server_name)
    ccall((:aws_tls_connection_options_set_server_name, libawscrt), Cint, (Ptr{aws_tls_connection_options}, Ptr{aws_allocator}, Ptr{aws_byte_cursor}), conn_options, allocator, server_name)
end

"""
    aws_tls_connection_options_set_alpn_list(conn_options, allocator, alpn_list)

Sets alpn list in the form <protocol1;protocol2;...>. A maximum of 4 protocols are supported. alpn\\_list is copied. This value is already inherited from [`aws_tls_ctx`](@ref), but the [`aws_tls_ctx`](@ref) is expensive, and should be used across as many connections as possible. If you want to set this per connection, set it here.

### Prototype
```c
int aws_tls_connection_options_set_alpn_list( struct aws_tls_connection_options *conn_options, struct aws_allocator *allocator, const char *alpn_list);
```
"""
function aws_tls_connection_options_set_alpn_list(conn_options, allocator, alpn_list)
    ccall((:aws_tls_connection_options_set_alpn_list, libawscrt), Cint, (Ptr{aws_tls_connection_options}, Ptr{aws_allocator}, Ptr{Cchar}), conn_options, allocator, alpn_list)
end

"""
    aws_tls_is_alpn_available()

Returns true if alpn is available in the underlying tls implementation. This function should always be called before setting an alpn list.

### Prototype
```c
bool aws_tls_is_alpn_available(void);
```
"""
function aws_tls_is_alpn_available()
    ccall((:aws_tls_is_alpn_available, libawscrt), Bool, ())
end

"""
    aws_tls_is_cipher_pref_supported(cipher_pref)

Returns true if this Cipher Preference is available in the underlying TLS implementation. This function should always be called before setting a Cipher Preference

### Prototype
```c
bool aws_tls_is_cipher_pref_supported(enum aws_tls_cipher_pref cipher_pref);
```
"""
function aws_tls_is_cipher_pref_supported(cipher_pref)
    ccall((:aws_tls_is_cipher_pref_supported, libawscrt), Bool, (aws_tls_cipher_pref,), cipher_pref)
end

"""
    aws_tls_client_handler_new(allocator, options, slot)

Creates a new tls channel handler in client mode. Options will be copied. You must call [`aws_tls_client_handler_start_negotiation`](@ref) and wait on the [`aws_tls_on_negotiation_result_fn`](@ref) callback before the handler can begin processing application data.

### Prototype
```c
struct aws_channel_handler *aws_tls_client_handler_new( struct aws_allocator *allocator, struct aws_tls_connection_options *options, struct aws_channel_slot *slot);
```
"""
function aws_tls_client_handler_new(allocator, options, slot)
    ccall((:aws_tls_client_handler_new, libawscrt), Ptr{aws_channel_handler}, (Ptr{aws_allocator}, Ptr{aws_tls_connection_options}, Ptr{aws_channel_slot}), allocator, options, slot)
end

"""
    aws_tls_server_handler_new(allocator, options, slot)

Creates a new tls channel handler in server mode. Options will be copied. You must wait on the [`aws_tls_on_negotiation_result_fn`](@ref) callback before the handler can begin processing application data.

### Prototype
```c
struct aws_channel_handler *aws_tls_server_handler_new( struct aws_allocator *allocator, struct aws_tls_connection_options *options, struct aws_channel_slot *slot);
```
"""
function aws_tls_server_handler_new(allocator, options, slot)
    ccall((:aws_tls_server_handler_new, libawscrt), Ptr{aws_channel_handler}, (Ptr{aws_allocator}, Ptr{aws_tls_connection_options}, Ptr{aws_channel_slot}), allocator, options, slot)
end

"""
    aws_tls_alpn_handler_new(allocator, on_protocol_negotiated, user_data)

Creates a channel handler, for client or server mode, that handles alpn. This isn't necessarily required since you can always call [`aws_tls_handler_protocol`](@ref) in the [`aws_tls_on_negotiation_result_fn`](@ref) callback, but this makes channel bootstrap easier to handle.

### Prototype
```c
struct aws_channel_handler *aws_tls_alpn_handler_new( struct aws_allocator *allocator, aws_tls_on_protocol_negotiated on_protocol_negotiated, void *user_data);
```
"""
function aws_tls_alpn_handler_new(allocator, on_protocol_negotiated, user_data)
    ccall((:aws_tls_alpn_handler_new, libawscrt), Ptr{aws_channel_handler}, (Ptr{aws_allocator}, aws_tls_on_protocol_negotiated, Ptr{Cvoid}), allocator, on_protocol_negotiated, user_data)
end

"""
    aws_tls_client_handler_start_negotiation(handler)

Kicks off the negotiation process. This function must be called when in client mode to initiate the TLS handshake. Once the handshake has completed the [`aws_tls_on_negotiation_result_fn`](@ref) will be invoked.

### Prototype
```c
int aws_tls_client_handler_start_negotiation(struct aws_channel_handler *handler);
```
"""
function aws_tls_client_handler_start_negotiation(handler)
    ccall((:aws_tls_client_handler_start_negotiation, libawscrt), Cint, (Ptr{aws_channel_handler},), handler)
end

"""
    aws_tls_server_ctx_new(alloc, options)

Creates a new server ctx. This ctx can be used for the lifetime of the application assuming you want the same options for every incoming connection. Options will be copied.

### Prototype
```c
struct aws_tls_ctx *aws_tls_server_ctx_new( struct aws_allocator *alloc, const struct aws_tls_ctx_options *options);
```
"""
function aws_tls_server_ctx_new(alloc, options)
    ccall((:aws_tls_server_ctx_new, libawscrt), Ptr{aws_tls_ctx}, (Ptr{aws_allocator}, Ptr{aws_tls_ctx_options}), alloc, options)
end

"""
    aws_tls_client_ctx_new(alloc, options)

Creates a new client ctx. This ctx can be used for the lifetime of the application assuming you want the same options for every outgoing connection. Options will be copied.

### Prototype
```c
struct aws_tls_ctx *aws_tls_client_ctx_new( struct aws_allocator *alloc, const struct aws_tls_ctx_options *options);
```
"""
function aws_tls_client_ctx_new(alloc, options)
    ccall((:aws_tls_client_ctx_new, libawscrt), Ptr{aws_tls_ctx}, (Ptr{aws_allocator}, Ptr{aws_tls_ctx_options}), alloc, options)
end

"""
    aws_tls_ctx_acquire(ctx)

Increments the reference count on the tls context, allowing the caller to take a reference to it.

Returns the same tls context passed in.

### Prototype
```c
struct aws_tls_ctx *aws_tls_ctx_acquire(struct aws_tls_ctx *ctx);
```
"""
function aws_tls_ctx_acquire(ctx)
    ccall((:aws_tls_ctx_acquire, libawscrt), Ptr{aws_tls_ctx}, (Ptr{aws_tls_ctx},), ctx)
end

"""
    aws_tls_ctx_release(ctx)

Decrements a tls context's ref count. When the ref count drops to zero, the object will be destroyed.

### Prototype
```c
void aws_tls_ctx_release(struct aws_tls_ctx *ctx);
```
"""
function aws_tls_ctx_release(ctx)
    ccall((:aws_tls_ctx_release, libawscrt), Cvoid, (Ptr{aws_tls_ctx},), ctx)
end

"""
    aws_tls_handler_write(handler, slot, buf, on_write_completed, completion_user_data)

Not necessary if you are installing more handlers into the channel, but if you just want to have TLS for arbitrary data and use the channel handler directly, this function allows you to write data to the channel and have it encrypted.

### Prototype
```c
int aws_tls_handler_write( struct aws_channel_handler *handler, struct aws_channel_slot *slot, struct aws_byte_buf *buf, aws_channel_on_message_write_completed_fn *on_write_completed, void *completion_user_data);
```
"""
function aws_tls_handler_write(handler, slot, buf, on_write_completed, completion_user_data)
    ccall((:aws_tls_handler_write, libawscrt), Cint, (Ptr{aws_channel_handler}, Ptr{aws_channel_slot}, Ptr{aws_byte_buf}, Ptr{Cvoid}, Ptr{Cvoid}), handler, slot, buf, on_write_completed, completion_user_data)
end

"""
    aws_tls_handler_protocol(handler)

Returns a byte buffer by copy of the negotiated protocols. If there is no agreed upon protocol, len will be 0 and buffer will be NULL.

### Prototype
```c
struct aws_byte_buf aws_tls_handler_protocol(struct aws_channel_handler *handler);
```
"""
function aws_tls_handler_protocol(handler)
    ccall((:aws_tls_handler_protocol, libawscrt), aws_byte_buf, (Ptr{aws_channel_handler},), handler)
end

"""
    aws_tls_handler_server_name(handler)

Client mode only. This is the server name that was used for SNI and host name validation.

### Prototype
```c
struct aws_byte_buf aws_tls_handler_server_name(struct aws_channel_handler *handler);
```
"""
function aws_tls_handler_server_name(handler)
    ccall((:aws_tls_handler_server_name, libawscrt), aws_byte_buf, (Ptr{aws_channel_handler},), handler)
end

"""
    aws_channel_setup_client_tls(right_of_slot, tls_options)

******************************* Misc TLS related ********************************

### Prototype
```c
int aws_channel_setup_client_tls( struct aws_channel_slot *right_of_slot, struct aws_tls_connection_options *tls_options);
```
"""
function aws_channel_setup_client_tls(right_of_slot, tls_options)
    ccall((:aws_channel_setup_client_tls, libawscrt), Cint, (Ptr{aws_channel_slot}, Ptr{aws_tls_connection_options}), right_of_slot, tls_options)
end

"""
    aws_uri

Data representing a URI. uri\\_str is always allocated and filled in. The other portions are merely storing offsets into uri\\_str.
"""
struct aws_uri
    self_size::Csize_t
    allocator::Ptr{aws_allocator}
    uri_str::aws_byte_buf
    scheme::aws_byte_cursor
    authority::aws_byte_cursor
    userinfo::aws_byte_cursor
    user::aws_byte_cursor
    password::aws_byte_cursor
    host_name::aws_byte_cursor
    port::UInt16
    path::aws_byte_cursor
    query_string::aws_byte_cursor
    path_and_query::aws_byte_cursor
end

"""
    aws_uri_param

key/value pairs for a query string. If the query fragment was not in format key=value, the fragment value will be stored in key
"""
struct aws_uri_param
    key::aws_byte_cursor
    value::aws_byte_cursor
end

"""
    aws_uri_builder_options

Arguments for building a URI instance. All members must be initialized before passing them to aws\\_uri\\_init().

query\\_string and query\\_params are exclusive to each other. If you set query\\_string, do not prepend it with '?'
"""
struct aws_uri_builder_options
    scheme::aws_byte_cursor
    path::aws_byte_cursor
    host_name::aws_byte_cursor
    port::UInt16
    query_params::Ptr{aws_array_list}
    query_string::aws_byte_cursor
end

"""
    aws_uri_init_parse(uri, allocator, uri_str)

Parses 'uri\\_str' and initializes uri. Returns [`AWS_OP_SUCCESS`](@ref), on success, [`AWS_OP_ERR`](@ref) on failure. After calling this function, the parts can be accessed.

### Prototype
```c
int aws_uri_init_parse( struct aws_uri *uri, struct aws_allocator *allocator, const struct aws_byte_cursor *uri_str);
```
"""
function aws_uri_init_parse(uri, allocator, uri_str)
    ccall((:aws_uri_init_parse, libawscrt), Cint, (Ptr{aws_uri}, Ptr{aws_allocator}, Ptr{aws_byte_cursor}), uri, allocator, uri_str)
end

"""
    aws_uri_init_from_builder_options(uri, allocator, options)

Initializes uri to values specified in options. Returns [`AWS_OP_SUCCESS`](@ref), on success, [`AWS_OP_ERR`](@ref) on failure. After calling this function, the parts can be accessed.

### Prototype
```c
int aws_uri_init_from_builder_options( struct aws_uri *uri, struct aws_allocator *allocator, struct aws_uri_builder_options *options);
```
"""
function aws_uri_init_from_builder_options(uri, allocator, options)
    ccall((:aws_uri_init_from_builder_options, libawscrt), Cint, (Ptr{aws_uri}, Ptr{aws_allocator}, Ptr{aws_uri_builder_options}), uri, allocator, options)
end

"""
    aws_uri_clean_up(uri)

### Prototype
```c
void aws_uri_clean_up(struct aws_uri *uri);
```
"""
function aws_uri_clean_up(uri)
    ccall((:aws_uri_clean_up, libawscrt), Cvoid, (Ptr{aws_uri},), uri)
end

"""
    aws_uri_scheme(uri)

Returns the scheme portion of the uri (e.g. http, https, ftp, ftps, etc...). If the scheme was not present in the uri, the returned value will be empty. It is the users job to determine the appropriate defaults if this field is empty, based on protocol, port, etc...

### Prototype
```c
const struct aws_byte_cursor *aws_uri_scheme(const struct aws_uri *uri);
```
"""
function aws_uri_scheme(uri)
    ccall((:aws_uri_scheme, libawscrt), Ptr{aws_byte_cursor}, (Ptr{aws_uri},), uri)
end

"""
    aws_uri_authority(uri)

Returns the authority portion of the uri (host[:port]). If it was not present, this was a request uri. In that case, the value will be empty.

### Prototype
```c
const struct aws_byte_cursor *aws_uri_authority(const struct aws_uri *uri);
```
"""
function aws_uri_authority(uri)
    ccall((:aws_uri_authority, libawscrt), Ptr{aws_byte_cursor}, (Ptr{aws_uri},), uri)
end

"""
    aws_uri_path(uri)

Returns the path portion of the uri. If the original value was empty, this value will be "/".

### Prototype
```c
const struct aws_byte_cursor *aws_uri_path(const struct aws_uri *uri);
```
"""
function aws_uri_path(uri)
    ccall((:aws_uri_path, libawscrt), Ptr{aws_byte_cursor}, (Ptr{aws_uri},), uri)
end

"""
    aws_uri_query_string(uri)

Returns the query string portion of the uri, minus the '?'. If not present, this value will be empty.

### Prototype
```c
const struct aws_byte_cursor *aws_uri_query_string(const struct aws_uri *uri);
```
"""
function aws_uri_query_string(uri)
    ccall((:aws_uri_query_string, libawscrt), Ptr{aws_byte_cursor}, (Ptr{aws_uri},), uri)
end

"""
    aws_uri_host_name(uri)

Returns the 'host\\_name' portion of the authority. If no authority was present, this value will be empty.

### Prototype
```c
const struct aws_byte_cursor *aws_uri_host_name(const struct aws_uri *uri);
```
"""
function aws_uri_host_name(uri)
    ccall((:aws_uri_host_name, libawscrt), Ptr{aws_byte_cursor}, (Ptr{aws_uri},), uri)
end

"""
    aws_uri_port(uri)

Returns the port portion of the authority if it was present, otherwise, returns 0. If this is 0, it is the users job to determine the correct port based on scheme and protocol.

### Prototype
```c
uint16_t aws_uri_port(const struct aws_uri *uri);
```
"""
function aws_uri_port(uri)
    ccall((:aws_uri_port, libawscrt), UInt16, (Ptr{aws_uri},), uri)
end

"""
    aws_uri_path_and_query(uri)

Returns the path and query portion of the uri (i.e., the thing you send accross the wire).

### Prototype
```c
const struct aws_byte_cursor *aws_uri_path_and_query(const struct aws_uri *uri);
```
"""
function aws_uri_path_and_query(uri)
    ccall((:aws_uri_path_and_query, libawscrt), Ptr{aws_byte_cursor}, (Ptr{aws_uri},), uri)
end

"""
    aws_uri_query_string_next_param(uri, param)

For iterating over the params in the uri query string. `param` is an in/out argument used to track progress, it MUST be zeroed out to start. If true is returned, `param` contains the value of the next param. If false is returned, there are no further params.

Edge cases: 1) Entries without '=' sign are treated as having a key and no value. Example: First param in query string "a&b=c" has key="a" value=""

2) Blank entries are skipped. Example: The only param in query string "&&a=b" is key="a" value="b"

### Prototype
```c
bool aws_uri_query_string_next_param(const struct aws_uri *uri, struct aws_uri_param *param);
```
"""
function aws_uri_query_string_next_param(uri, param)
    ccall((:aws_uri_query_string_next_param, libawscrt), Bool, (Ptr{aws_uri}, Ptr{aws_uri_param}), uri, param)
end

"""
    aws_uri_query_string_params(uri, out_params)

Parses query string and stores the parameters in 'out\\_params'. Returns [`AWS_OP_SUCCESS`](@ref) on success and [`AWS_OP_ERR`](@ref) on failure. The user is responsible for initializing out\\_params with item size of struct aws\\_query\\_param. The user is also responsible for cleaning up out\\_params when finished.

### Prototype
```c
int aws_uri_query_string_params(const struct aws_uri *uri, struct aws_array_list *out_params);
```
"""
function aws_uri_query_string_params(uri, out_params)
    ccall((:aws_uri_query_string_params, libawscrt), Cint, (Ptr{aws_uri}, Ptr{aws_array_list}), uri, out_params)
end

"""
    aws_byte_buf_append_encoding_uri_path(buffer, cursor)

Writes the uri path encoding of a cursor to a buffer. This is the modified version of rfc3986 used by sigv4 signing.

### Prototype
```c
int aws_byte_buf_append_encoding_uri_path(struct aws_byte_buf *buffer, const struct aws_byte_cursor *cursor);
```
"""
function aws_byte_buf_append_encoding_uri_path(buffer, cursor)
    ccall((:aws_byte_buf_append_encoding_uri_path, libawscrt), Cint, (Ptr{aws_byte_buf}, Ptr{aws_byte_cursor}), buffer, cursor)
end

"""
    aws_byte_buf_append_encoding_uri_param(buffer, cursor)

Writes the uri query param encoding (passthrough alnum + '-' '\\_' '~' '.') of a UTF-8 cursor to a buffer For example, reading "a b\\_c" would write "a20b\\_c".

### Prototype
```c
int aws_byte_buf_append_encoding_uri_param( struct aws_byte_buf *buffer, const struct aws_byte_cursor *cursor);
```
"""
function aws_byte_buf_append_encoding_uri_param(buffer, cursor)
    ccall((:aws_byte_buf_append_encoding_uri_param, libawscrt), Cint, (Ptr{aws_byte_buf}, Ptr{aws_byte_cursor}), buffer, cursor)
end

"""
    aws_byte_buf_append_decoding_uri(buffer, cursor)

Writes the uri decoding of a UTF-8 cursor to a buffer, replacing xx escapes by their single byte equivalent. For example, reading "a20b\\_c" would write "a b\\_c".

### Prototype
```c
int aws_byte_buf_append_decoding_uri(struct aws_byte_buf *buffer, const struct aws_byte_cursor *cursor);
```
"""
function aws_byte_buf_append_decoding_uri(buffer, cursor)
    ccall((:aws_byte_buf_append_decoding_uri, libawscrt), Cint, (Ptr{aws_byte_buf}, Ptr{aws_byte_cursor}), buffer, cursor)
end

mutable struct aws_mqtt_client_connection end

# typedef int ( aws_iotdevice_defender_publish_fn ) ( struct aws_byte_cursor report , void * userdata )
"""
Callback to invoke when the defender task needs to "publish" a report. Useful to override default MQTT publish behavior, for testing report outputs

Notes: * This function should not perform blocking IO. * This function should copy the report if it needs to hold on to the memory for an IO operation

returns: [`AWS_OP_SUCCESS`](@ref) if the user callback wants to consider the publish failed.
"""
const aws_iotdevice_defender_publish_fn = Cvoid

# typedef void ( aws_iotdevice_defender_task_failure_fn ) ( bool is_task_stopped , int error_code , void * userdata )
"""
General callback handler for the task to report that an error occurred while running the DeviceDefender task. Error codes can only go so far in describing where/when and how the failure occur so the errors here may best communicate where/when and the how of the underlying call should be found in log output

### Parameters
* `is_task_stopped`:\\[in\\] flag indicating whether or not the task is unable to continue running
* `error_code`:\\[in\\] error code describing the nature of the failure
"""
const aws_iotdevice_defender_task_failure_fn = Cvoid

# typedef void ( aws_iotdevice_defender_task_canceled_fn ) ( void * userdata )
"""
User callback type invoked when DeviceDefender task has completed cancellation. After a request to stop the task, this signals the completion of the cancellation and no further user callbacks will be invoked.

### Parameters
* `userdata`:\\[in\\] callback userdata
"""
const aws_iotdevice_defender_task_canceled_fn = Cvoid

# typedef void ( aws_iotdevice_defender_report_rejected_fn ) ( const struct aws_byte_cursor * rejected_message_payload , void * userdata )
"""
User callback type invoked when a report fails to submit.

There are two possibilities for failed submission: 1. The MQTT client fails to publish the message and returns an error code. In this scenario, the client\\_error\\_code will be a value other than AWS\\_ERROR\\_SUCCESS. The rejected\\_message\\_payload parameter will be NULL. 2. After a successful publish, a reply is received on the respective MQTT rejected topic with a message. In this scenario, the client\\_error\\_code will be AWS\\_ERROR\\_SUCCESS, and rejected\\_message\\_payload will contain the payload of the rejected message received.

### Parameters
* `rejected_message_payload`:\\[in\\] response payload recieved from rejection topic
* `userdata`:\\[in\\] callback userdata
"""
const aws_iotdevice_defender_report_rejected_fn = Cvoid

# typedef void ( aws_iotdevice_defender_report_accepted_fn ) ( const struct aws_byte_cursor * accepted_message_payload , void * userdata )
"""
User callback type invoked when the subscribed device defender topic for accepted reports receives a message.
"""
const aws_iotdevice_defender_report_accepted_fn = Cvoid

# typedef int ( aws_iotdevice_defender_get_number_fn ) ( int64_t * const value , void * userdata )
"""
User callback type invoked to retrieve a number type custom metric.

returns: [`AWS_OP_SUCCESS`](@ref) if the custom metric was successfully added to the task config
"""
const aws_iotdevice_defender_get_number_fn = Cvoid

# typedef int ( aws_iotdevice_defender_get_number_list_fn ) ( struct aws_array_list * const number_list , void * userdata )
"""
User callback type invoked to retrieve a number list custom metric

List provided will already be initialized and caller must push items into the list of type int64\\_t.

returns: [`AWS_OP_SUCCESS`](@ref) if the custom metric was successfully added to the task config
"""
const aws_iotdevice_defender_get_number_list_fn = Cvoid

# typedef int ( aws_iotdevice_defender_get_string_list_fn ) ( struct aws_array_list * const string_list , void * userdata )
"""
User callback type invoked to retrieve a string list custom metric

List provided will already be initialized and caller must push items into the list of type (struct [`aws_string`](@ref) *). String allocated that are placed into the list are destroyed by the defender task after it is done with the list.

returns: [`AWS_OP_SUCCESS`](@ref) if the custom metric was successfully added to the task config
"""
const aws_iotdevice_defender_get_string_list_fn = Cvoid

# typedef int ( aws_iotdevice_defender_get_ip_list_fn ) ( struct aws_array_list * const ip_list , void * userdata )
"""
User callback type invoked to retrieve an ip list custom metric

List provided will already be initialized and caller must push items into the list of type (struct [`aws_string`](@ref) *). String allocated that are placed into the list are destroyed by the defender task after it is done with the list.

returns: [`AWS_OP_SUCCESS`](@ref) if the custom metric was successfully added to the task config
"""
const aws_iotdevice_defender_get_ip_list_fn = Cvoid

@cenum aws_iotdevice_defender_report_format::UInt32 begin
    AWS_IDDRF_JSON = 0
    AWS_IDDRF_SHORT_JSON = 1
    AWS_IDDRF_CBOR = 2
end

"""
    defender_custom_metric_type

Change name if this needs external exposure. Needed to keep track of how to interpret instantiated metrics, and cast the supplier\\_fn correctly.
"""
@cenum defender_custom_metric_type::UInt32 begin
    DD_METRIC_UNKNOWN = 0
    DD_METRIC_NUMBER = 1
    DD_METRIC_NUMBER_LIST = 2
    DD_METRIC_STRING_LIST = 3
    DD_METRIC_IP_LIST = 4
end

mutable struct aws_iotdevice_defender_task end

mutable struct aws_iotdevice_defender_task_config end

"""
    aws_iotdevice_defender_config_create(config_out, allocator, thing_name, report_format)

Creates a new reporting task config for Device Defender metrics collection

### Parameters
* `config_out`:\\[in\\] output to write a pointer to a task configuration. Will write non-NULL if successful in creating the the task configuration. Will write NULL if there is an error during creation
* `allocator`:\\[in\\] allocator to use for the task configuration's internal data, and the task itself when started
* `thing_name`:\\[in\\] thing name the task config is reporting for
* `report_format`:\\[in\\] report format to produce when publishing to IoT
### Returns
[`AWS_OP_SUCCESS`](@ref) and config\\_out will be non-NULL. Returns an error code otherwise
### Prototype
```c
int aws_iotdevice_defender_config_create( struct aws_iotdevice_defender_task_config **config_out, struct aws_allocator *allocator, const struct aws_byte_cursor *thing_name, enum aws_iotdevice_defender_report_format report_format);
```
"""
function aws_iotdevice_defender_config_create(config_out, allocator, thing_name, report_format)
    ccall((:aws_iotdevice_defender_config_create, libawscrt), Cint, (Ptr{Ptr{aws_iotdevice_defender_task_config}}, Ptr{aws_allocator}, Ptr{aws_byte_cursor}, aws_iotdevice_defender_report_format), config_out, allocator, thing_name, report_format)
end

"""
    aws_iotdevice_defender_config_clean_up(config)

Destroys a new reporting task for Device Defender metrics

### Parameters
* `config`:\\[in\\] defender task configuration
### Prototype
```c
void aws_iotdevice_defender_config_clean_up(struct aws_iotdevice_defender_task_config *config);
```
"""
function aws_iotdevice_defender_config_clean_up(config)
    ccall((:aws_iotdevice_defender_config_clean_up, libawscrt), Cvoid, (Ptr{aws_iotdevice_defender_task_config},), config)
end

"""
    aws_iotdevice_defender_config_set_task_failure_fn(config, failure_fn)

Sets the task failure callback function to invoke when the running of the task encounters a failure. Though this is optional to specify, it is important to register a handler to at least monitor failure that stops the task from running

The most likely scenario for task not being able to continue is failure to reschedule the task

### Parameters
* `config`:\\[in\\] defender task configuration
* `failure_fn`:\\[in\\] failure callback function
### Returns
[`AWS_OP_SUCCESS`](@ref) when the task failure callback has been set. Returns an error if the callback was not set
### Prototype
```c
int aws_iotdevice_defender_config_set_task_failure_fn( struct aws_iotdevice_defender_task_config *config, aws_iotdevice_defender_task_failure_fn *failure_fn);
```
"""
function aws_iotdevice_defender_config_set_task_failure_fn(config, failure_fn)
    ccall((:aws_iotdevice_defender_config_set_task_failure_fn, libawscrt), Cint, (Ptr{aws_iotdevice_defender_task_config}, Ptr{Cvoid}), config, failure_fn)
end

"""
    aws_iotdevice_defender_config_set_task_cancelation_fn(config, cancel_fn)

Sets the task cancelation callback function to invoke when the task is canceled and not going to be scheduled to run. This is a suggestion of when it is OK to close or free resources kept around while the task is running.

### Parameters
* `config`:\\[in\\] defender task configuration
* `cancel_fn`:\\[in\\] cancelation callback function
### Returns
[`AWS_OP_SUCCESS`](@ref) when the task cancelation callback has been set. Returns an error if the callback was not set
### Prototype
```c
int aws_iotdevice_defender_config_set_task_cancelation_fn( struct aws_iotdevice_defender_task_config *config, aws_iotdevice_defender_task_canceled_fn *cancel_fn);
```
"""
function aws_iotdevice_defender_config_set_task_cancelation_fn(config, cancel_fn)
    ccall((:aws_iotdevice_defender_config_set_task_cancelation_fn, libawscrt), Cint, (Ptr{aws_iotdevice_defender_task_config}, Ptr{Cvoid}), config, cancel_fn)
end

"""
    aws_iotdevice_defender_config_set_report_accepted_fn(config, accepted_fn)

Sets the report rejected callback function to invoke when is canceled and not going to be scheduled to run. This is a suggestion of when it is OK to close or free resources kept around while the task is running.

### Parameters
* `config`:\\[in\\] defender task configuration
* `accepted_fn`:\\[in\\] accepted report callback function
### Returns
[`AWS_OP_SUCCESS`](@ref) when the report accepted callback has been set. Returns an error if the callback was not set
### Prototype
```c
int aws_iotdevice_defender_config_set_report_accepted_fn( struct aws_iotdevice_defender_task_config *config, aws_iotdevice_defender_report_accepted_fn *accepted_fn);
```
"""
function aws_iotdevice_defender_config_set_report_accepted_fn(config, accepted_fn)
    ccall((:aws_iotdevice_defender_config_set_report_accepted_fn, libawscrt), Cint, (Ptr{aws_iotdevice_defender_task_config}, Ptr{Cvoid}), config, accepted_fn)
end

"""
    aws_iotdevice_defender_config_set_report_rejected_fn(config, rejected_fn)

Sets the report rejected callback function to invoke when is canceled and not going to be scheduled to run. This is a suggestion of when it is OK to close or free resources kept around while the task is running.

### Parameters
* `config`:\\[in\\] defender task configuration
* `rejected_fn`:\\[in\\] rejected report callback function
### Returns
[`AWS_OP_SUCCESS`](@ref) when the report rejected callback has been set. Returns an error if the callback was not set
### Prototype
```c
int aws_iotdevice_defender_config_set_report_rejected_fn( struct aws_iotdevice_defender_task_config *config, aws_iotdevice_defender_report_rejected_fn *rejected_fn);
```
"""
function aws_iotdevice_defender_config_set_report_rejected_fn(config, rejected_fn)
    ccall((:aws_iotdevice_defender_config_set_report_rejected_fn, libawscrt), Cint, (Ptr{aws_iotdevice_defender_task_config}, Ptr{Cvoid}), config, rejected_fn)
end

"""
    aws_iotdevice_defender_config_set_task_period_ns(config, task_period_ns)

Sets the period of the device defender task

### Parameters
* `config`:\\[in\\] defender task configuration
* `task_period_ns`:\\[in\\] how much time in nanoseconds between defender task runs
### Returns
[`AWS_OP_SUCCESS`](@ref) when the property has been set properly. Returns an error code if the value was not able to be set.
### Prototype
```c
int aws_iotdevice_defender_config_set_task_period_ns( struct aws_iotdevice_defender_task_config *config, uint64_t task_period_ns);
```
"""
function aws_iotdevice_defender_config_set_task_period_ns(config, task_period_ns)
    ccall((:aws_iotdevice_defender_config_set_task_period_ns, libawscrt), Cint, (Ptr{aws_iotdevice_defender_task_config}, UInt64), config, task_period_ns)
end

"""
    aws_iotdevice_defender_config_set_callback_userdata(config, userdata)

Sets the userdata for the device defender task's callback functions

### Parameters
* `config`:\\[in\\] defender task configuration
* `userdata`:\\[in\\] how much time in nanoseconds between defender task runs
### Returns
[`AWS_OP_SUCCESS`](@ref) when the property has been set properly. Returns an error code if the value was not able to be set
### Prototype
```c
int aws_iotdevice_defender_config_set_callback_userdata( struct aws_iotdevice_defender_task_config *config, void *userdata);
```
"""
function aws_iotdevice_defender_config_set_callback_userdata(config, userdata)
    ccall((:aws_iotdevice_defender_config_set_callback_userdata, libawscrt), Cint, (Ptr{aws_iotdevice_defender_task_config}, Ptr{Cvoid}), config, userdata)
end

"""
    aws_iotdevice_defender_config_register_number_metric(task_config, metric_name, supplier, userdata)

Adds number custom metric to the Device Defender task configuration. Has no impact on a defender task already started using the configuration.

### Parameters
* `task_config`:\\[in\\] the defender task configuration to register the metric to
* `metric_name`:\\[in\\] UTF8 byte string of the metric name
* `supplier`:\\[in\\] callback function to produce the metric value when requested at report generation time
* `userdata`:\\[in\\] specific callback data for the supplier callback function
### Returns
[`AWS_OP_SUCCESS`](@ref) if the custom metric has been associated with the task configuration successfully
### Prototype
```c
int aws_iotdevice_defender_config_register_number_metric( struct aws_iotdevice_defender_task_config *task_config, const struct aws_byte_cursor *metric_name, aws_iotdevice_defender_get_number_fn *supplier, void *userdata);
```
"""
function aws_iotdevice_defender_config_register_number_metric(task_config, metric_name, supplier, userdata)
    ccall((:aws_iotdevice_defender_config_register_number_metric, libawscrt), Cint, (Ptr{aws_iotdevice_defender_task_config}, Ptr{aws_byte_cursor}, Ptr{Cvoid}, Ptr{Cvoid}), task_config, metric_name, supplier, userdata)
end

"""
    aws_iotdevice_defender_config_register_number_list_metric(task_config, metric_name, supplier, userdata)

Adds number list custom metric to the Device Defender task configuration. Has no impact on a defender task already started using the configuration.

### Parameters
* `task_config`:\\[in\\] the defender task configuration to register the metric to
* `metric_name`:\\[in\\] UTF8 byte string of the metric name
* `supplier`:\\[in\\] callback function to produce the metric value when requested at report generation time
* `userdata`:\\[in\\] specific callback data for the supplier callback function
### Returns
[`AWS_OP_SUCCESS`](@ref) if the custom metric has been associated with the task configuration successfully
### Prototype
```c
int aws_iotdevice_defender_config_register_number_list_metric( struct aws_iotdevice_defender_task_config *task_config, const struct aws_byte_cursor *metric_name, aws_iotdevice_defender_get_number_list_fn *supplier, void *userdata);
```
"""
function aws_iotdevice_defender_config_register_number_list_metric(task_config, metric_name, supplier, userdata)
    ccall((:aws_iotdevice_defender_config_register_number_list_metric, libawscrt), Cint, (Ptr{aws_iotdevice_defender_task_config}, Ptr{aws_byte_cursor}, Ptr{Cvoid}, Ptr{Cvoid}), task_config, metric_name, supplier, userdata)
end

"""
    aws_iotdevice_defender_config_register_string_list_metric(task_config, metric_name, supplier, userdata)

Adds string list custom metric to the Device Defender task configuration. Has no impact on a defender task already started using the configuration.

### Parameters
* `task_config`:\\[in\\] the defender task configuration to register the metric to
* `metric_name`:\\[in\\] UTF8 byte string of the metric name
* `supplier`:\\[in\\] callback function to produce the metric value when requested at report generation time
* `userdata`:\\[in\\] specific callback data for the supplier callback function
### Returns
[`AWS_OP_SUCCESS`](@ref) if the custom metric has been associated with the task configuration successfully
### Prototype
```c
int aws_iotdevice_defender_config_register_string_list_metric( struct aws_iotdevice_defender_task_config *task_config, const struct aws_byte_cursor *metric_name, aws_iotdevice_defender_get_string_list_fn *supplier, void *userdata);
```
"""
function aws_iotdevice_defender_config_register_string_list_metric(task_config, metric_name, supplier, userdata)
    ccall((:aws_iotdevice_defender_config_register_string_list_metric, libawscrt), Cint, (Ptr{aws_iotdevice_defender_task_config}, Ptr{aws_byte_cursor}, Ptr{Cvoid}, Ptr{Cvoid}), task_config, metric_name, supplier, userdata)
end

"""
    aws_iotdevice_defender_config_register_ip_list_metric(task_config, metric_name, supplier, userdata)

Adds IP list custom metric to the Device Defender task configuration. Has no impact on a defender task already started using the configuration.

### Parameters
* `task_config`:\\[in\\] the defender task configuration to register the metric to
* `metric_name`:\\[in\\] UTF8 byte string of the metric name
* `supplier`:\\[in\\] callback function to produce the metric value when requested at report generation time
* `userdata`:\\[in\\] specific callback data for the supplier callback function
### Returns
[`AWS_OP_SUCCESS`](@ref) if the custom metric has been associated with the task configuration successfully
### Prototype
```c
int aws_iotdevice_defender_config_register_ip_list_metric( struct aws_iotdevice_defender_task_config *task_config, const struct aws_byte_cursor *metric_name, aws_iotdevice_defender_get_ip_list_fn *supplier, void *userdata);
```
"""
function aws_iotdevice_defender_config_register_ip_list_metric(task_config, metric_name, supplier, userdata)
    ccall((:aws_iotdevice_defender_config_register_ip_list_metric, libawscrt), Cint, (Ptr{aws_iotdevice_defender_task_config}, Ptr{aws_byte_cursor}, Ptr{Cvoid}, Ptr{Cvoid}), task_config, metric_name, supplier, userdata)
end

"""
    aws_iotdevice_defender_task_create(task_out, config, connection, event_loop)

Creates and starts a new Device Defender reporting task

### Parameters
* `task_out`:\\[out\\] output parameter to set to point to the defender task
* `config`:\\[in\\] defender task configuration to use to start the task
* `connection`:\\[in\\] mqtt connection to use to publish reports to
* `event_loop`:\\[in\\] IoT device thing name used to determine the MQTT topic to publish the report to and listen for accepted or rejected responses
### Returns
[`AWS_OP_SUCCESS`](@ref) if the task has been created successfully and is scheduled to run
### Prototype
```c
int aws_iotdevice_defender_task_create( struct aws_iotdevice_defender_task **task_out, const struct aws_iotdevice_defender_task_config *config, struct aws_mqtt_client_connection *connection, struct aws_event_loop *event_loop);
```
"""
function aws_iotdevice_defender_task_create(task_out, config, connection, event_loop)
    ccall((:aws_iotdevice_defender_task_create, libawscrt), Cint, (Ptr{Ptr{aws_iotdevice_defender_task}}, Ptr{aws_iotdevice_defender_task_config}, Ptr{aws_mqtt_client_connection}, Ptr{aws_event_loop}), task_out, config, connection, event_loop)
end

"""
    aws_iotdevice_defender_task_create_ex(task_out, config, publish_fn, event_loop)

Creates and starts a new Device Defender reporting task with the ability to define a function to accept/handle each report when the task needs to publish.

### Parameters
* `task_out`:\\[out\\] output parameter to set to point to the defender task
* `config`:\\[in\\] defender task configuration to use to start the task
* `publish_fn`:\\[in\\] callback to handle reports generated by the task. The userdata comes from the task config
* `event_loop`:\\[in\\] IoT device thing name used to determine the MQTT topic to publish the report to and listen for accepted or rejected responses
### Returns
[`AWS_OP_SUCCESS`](@ref) if the task has been created successfully and is scheduled to run
### Prototype
```c
int aws_iotdevice_defender_task_create_ex( struct aws_iotdevice_defender_task **task_out, const struct aws_iotdevice_defender_task_config *config, aws_iotdevice_defender_publish_fn *publish_fn, struct aws_event_loop *event_loop);
```
"""
function aws_iotdevice_defender_task_create_ex(task_out, config, publish_fn, event_loop)
    ccall((:aws_iotdevice_defender_task_create_ex, libawscrt), Cint, (Ptr{Ptr{aws_iotdevice_defender_task}}, Ptr{aws_iotdevice_defender_task_config}, Ptr{Cvoid}, Ptr{aws_event_loop}), task_out, config, publish_fn, event_loop)
end

"""
    aws_iotdevice_defender_task_clean_up(defender_task)

Cancels the running task reporting Device Defender metrics and cleans up. If the task is currently running, it will block until the task has been canceled and cleaned up successfully

### Parameters
* `defender_task`:\\[in\\] running task to stop and clean up
### Prototype
```c
void aws_iotdevice_defender_task_clean_up(struct aws_iotdevice_defender_task *defender_task);
```
"""
function aws_iotdevice_defender_task_clean_up(defender_task)
    ccall((:aws_iotdevice_defender_task_clean_up, libawscrt), Cvoid, (Ptr{aws_iotdevice_defender_task},), defender_task)
end

@cenum aws_iotdevice_error::UInt32 begin
    AWS_ERROR_IOTDEVICE_INVALID_RESERVED_BITS = 13312
    AWS_ERROR_IOTDEVICE_DEFENDER_INVALID_REPORT_INTERVAL = 13313
    AWS_ERROR_IOTDEVICE_DEFENDER_UNSUPPORTED_REPORT_FORMAT = 13314
    AWS_ERROR_IOTDEVICE_DEFENDER_REPORT_SERIALIZATION_FAILURE = 13315
    AWS_ERROR_IOTDEVICE_DEFENDER_UNKNOWN_CUSTOM_METRIC_TYPE = 13316
    AWS_ERROR_IOTDEVICE_DEFENDER_INVALID_TASK_CONFIG = 13317
    AWS_ERROR_IOTDEVICE_DEFENDER_PUBLISH_FAILURE = 13318
    AWS_ERROR_IOTDEVICE_DEFENDER_UNKNOWN_TASK_STATUS = 13319
    AWS_ERROR_IOTDEVICE_SECUTRE_TUNNELING_INVALID_STREAM = 13320
    AWS_ERROR_IOTDEVICE_SECUTRE_TUNNELING_INCORRECT_MODE = 13321
    AWS_ERROR_END_IOTDEVICE_RANGE = 14335
end

@cenum aws_iotdevice_log_subject::UInt32 begin
    AWS_LS_IOTDEVICE_DEFENDER_TASK = 13312
    AWS_LS_IOTDEVICE_DEFENDER_TASK_CONFIG = 13313
    AWS_LS_IOTDEVICE_NETWORK_CONFIG = 13314
    AWS_LS_IOTDEVICE_SECURE_TUNNELING = 13315
end

"""
    aws_iotdevice_library_init(allocator)

Initializes internal datastructures used by aws-c-iot. Must be called before using any functionality in aws-c-iot.

### Prototype
```c
void aws_iotdevice_library_init(struct aws_allocator *allocator);
```
"""
function aws_iotdevice_library_init(allocator)
    ccall((:aws_iotdevice_library_init, libawscrt), Cvoid, (Ptr{aws_allocator},), allocator)
end

"""
    aws_iotdevice_library_clean_up()

Shuts down the internal datastructures used by aws-c-iot

### Prototype
```c
void aws_iotdevice_library_clean_up(void);
```
"""
function aws_iotdevice_library_clean_up()
    ccall((:aws_iotdevice_library_clean_up, libawscrt), Cvoid, ())
end

@cenum aws_secure_tunneling_local_proxy_mode::UInt32 begin
    AWS_SECURE_TUNNELING_SOURCE_MODE = 0
    AWS_SECURE_TUNNELING_DESTINATION_MODE = 1
end

mutable struct aws_secure_tunnel end

# typedef void ( aws_secure_tunneling_on_connection_complete_fn ) ( void * user_data )
const aws_secure_tunneling_on_connection_complete_fn = Cvoid

# typedef void ( aws_secure_tunneling_on_connection_shutdown_fn ) ( void * user_data )
const aws_secure_tunneling_on_connection_shutdown_fn = Cvoid

# typedef void ( aws_secure_tunneling_on_send_data_complete_fn ) ( int error_code , void * user_data )
const aws_secure_tunneling_on_send_data_complete_fn = Cvoid

# typedef void ( aws_secure_tunneling_on_data_receive_fn ) ( const struct aws_byte_buf * data , void * user_data )
const aws_secure_tunneling_on_data_receive_fn = Cvoid

# typedef void ( aws_secure_tunneling_on_stream_start_fn ) ( void * user_data )
const aws_secure_tunneling_on_stream_start_fn = Cvoid

# typedef void ( aws_secure_tunneling_on_stream_reset_fn ) ( void * user_data )
const aws_secure_tunneling_on_stream_reset_fn = Cvoid

# typedef void ( aws_secure_tunneling_on_session_reset_fn ) ( void * user_data )
const aws_secure_tunneling_on_session_reset_fn = Cvoid

struct aws_secure_tunnel_options
    allocator::Ptr{aws_allocator}
    bootstrap::Ptr{aws_client_bootstrap}
    socket_options::Ptr{aws_socket_options}
    http_proxy_options::Ptr{aws_http_proxy_options}
    access_token::aws_byte_cursor
    local_proxy_mode::aws_secure_tunneling_local_proxy_mode
    endpoint_host::aws_byte_cursor
    root_ca::Ptr{Cchar}
    on_connection_complete::Ptr{Cvoid}
    on_connection_shutdown::Ptr{Cvoid}
    on_send_data_complete::Ptr{Cvoid}
    on_data_receive::Ptr{Cvoid}
    on_stream_start::Ptr{Cvoid}
    on_stream_reset::Ptr{Cvoid}
    on_session_reset::Ptr{Cvoid}
    user_data::Ptr{Cvoid}
end

"""
Persistent storage for [`aws_secure_tunnel_options`](@ref).
"""
mutable struct aws_secure_tunnel_options_storage end

"""
    aws_secure_tunnel_new(options)

### Prototype
```c
struct aws_secure_tunnel *aws_secure_tunnel_new(const struct aws_secure_tunnel_options *options);
```
"""
function aws_secure_tunnel_new(options)
    ccall((:aws_secure_tunnel_new, libawscrt), Ptr{aws_secure_tunnel}, (Ptr{aws_secure_tunnel_options},), options)
end

"""
    aws_secure_tunnel_acquire(secure_tunnel)

### Prototype
```c
struct aws_secure_tunnel *aws_secure_tunnel_acquire(struct aws_secure_tunnel *secure_tunnel);
```
"""
function aws_secure_tunnel_acquire(secure_tunnel)
    ccall((:aws_secure_tunnel_acquire, libawscrt), Ptr{aws_secure_tunnel}, (Ptr{aws_secure_tunnel},), secure_tunnel)
end

"""
    aws_secure_tunnel_release(secure_tunnel)

### Prototype
```c
void aws_secure_tunnel_release(struct aws_secure_tunnel *secure_tunnel);
```
"""
function aws_secure_tunnel_release(secure_tunnel)
    ccall((:aws_secure_tunnel_release, libawscrt), Cvoid, (Ptr{aws_secure_tunnel},), secure_tunnel)
end

"""
    aws_secure_tunnel_connect(secure_tunnel)

### Prototype
```c
int aws_secure_tunnel_connect(struct aws_secure_tunnel *secure_tunnel);
```
"""
function aws_secure_tunnel_connect(secure_tunnel)
    ccall((:aws_secure_tunnel_connect, libawscrt), Cint, (Ptr{aws_secure_tunnel},), secure_tunnel)
end

"""
    aws_secure_tunnel_close(secure_tunnel)

### Prototype
```c
int aws_secure_tunnel_close(struct aws_secure_tunnel *secure_tunnel);
```
"""
function aws_secure_tunnel_close(secure_tunnel)
    ccall((:aws_secure_tunnel_close, libawscrt), Cint, (Ptr{aws_secure_tunnel},), secure_tunnel)
end

"""
    aws_secure_tunnel_send_data(secure_tunnel, data)

### Prototype
```c
int aws_secure_tunnel_send_data(struct aws_secure_tunnel *secure_tunnel, const struct aws_byte_cursor *data);
```
"""
function aws_secure_tunnel_send_data(secure_tunnel, data)
    ccall((:aws_secure_tunnel_send_data, libawscrt), Cint, (Ptr{aws_secure_tunnel}, Ptr{aws_byte_cursor}), secure_tunnel, data)
end

"""
    aws_secure_tunnel_stream_start(secure_tunnel)

### Prototype
```c
int aws_secure_tunnel_stream_start(struct aws_secure_tunnel *secure_tunnel);
```
"""
function aws_secure_tunnel_stream_start(secure_tunnel)
    ccall((:aws_secure_tunnel_stream_start, libawscrt), Cint, (Ptr{aws_secure_tunnel},), secure_tunnel)
end

"""
    aws_secure_tunnel_stream_reset(secure_tunnel)

### Prototype
```c
int aws_secure_tunnel_stream_reset(struct aws_secure_tunnel *secure_tunnel);
```
"""
function aws_secure_tunnel_stream_reset(secure_tunnel)
    ccall((:aws_secure_tunnel_stream_reset, libawscrt), Cint, (Ptr{aws_secure_tunnel},), secure_tunnel)
end

"""
    aws_secure_tunnel_options_validate(options)

Raises exception and returns [`AWS_OP_ERR`](@ref) if options are missing required parameters.

### Prototype
```c
int aws_secure_tunnel_options_validate(const struct aws_secure_tunnel_options *options);
```
"""
function aws_secure_tunnel_options_validate(options)
    ccall((:aws_secure_tunnel_options_validate, libawscrt), Cint, (Ptr{aws_secure_tunnel_options},), options)
end

"""
    aws_secure_tunnel_options_storage_new(options)

Create persistent storage for [`aws_secure_tunnel_options`](@ref). Makes a deep copy of (or acquires reference to) any data referenced by options,

### Prototype
```c
struct aws_secure_tunnel_options_storage *aws_secure_tunnel_options_storage_new( const struct aws_secure_tunnel_options *options);
```
"""
function aws_secure_tunnel_options_storage_new(options)
    ccall((:aws_secure_tunnel_options_storage_new, libawscrt), Ptr{aws_secure_tunnel_options_storage}, (Ptr{aws_secure_tunnel_options},), options)
end

"""
    aws_secure_tunnel_options_storage_destroy(storage)

Destroy options storage, and release any references held.

### Prototype
```c
void aws_secure_tunnel_options_storage_destroy(struct aws_secure_tunnel_options_storage *storage);
```
"""
function aws_secure_tunnel_options_storage_destroy(storage)
    ccall((:aws_secure_tunnel_options_storage_destroy, libawscrt), Cvoid, (Ptr{aws_secure_tunnel_options_storage},), storage)
end

"""
    aws_secure_tunnel_options_storage_get(storage)

Return pointer to options struct stored within.

### Prototype
```c
const struct aws_secure_tunnel_options *aws_secure_tunnel_options_storage_get( const struct aws_secure_tunnel_options_storage *storage);
```
"""
function aws_secure_tunnel_options_storage_get(storage)
    ccall((:aws_secure_tunnel_options_storage_get, libawscrt), Ptr{aws_secure_tunnel_options}, (Ptr{aws_secure_tunnel_options_storage},), storage)
end

"""
    on_websocket_incoming_frame_payload(websocket, frame, data, user_data)

### Prototype
```c
bool on_websocket_incoming_frame_payload( struct aws_websocket *websocket, const struct aws_websocket_incoming_frame *frame, struct aws_byte_cursor data, void *user_data);
```
"""
function on_websocket_incoming_frame_payload(websocket, frame, data, user_data)
    ccall((:on_websocket_incoming_frame_payload, libawscrt), Bool, (Ptr{aws_websocket}, Ptr{aws_websocket_incoming_frame}, aws_byte_cursor, Ptr{Cvoid}), websocket, frame, data, user_data)
end

struct aws_mqtt_client
    allocator::Ptr{aws_allocator}
    bootstrap::Ptr{aws_client_bootstrap}
    ref_count::aws_ref_count
end

# typedef void ( aws_mqtt_op_complete_fn ) ( struct aws_mqtt_client_connection * connection , uint16_t packet_id , int error_code , void * userdata )
"""
Callback called when a request roundtrip is complete (QoS0 immediately, QoS1 on PUBACK, QoS2 on PUBCOMP). Either succeed or not
"""
const aws_mqtt_op_complete_fn = Cvoid

# typedef void ( aws_mqtt_client_on_connection_complete_fn ) ( struct aws_mqtt_client_connection * connection , int error_code , enum aws_mqtt_connect_return_code return_code , bool session_present , void * userdata )
"""
Called when a connection attempt is completed, either in success or error.

If error code is AWS\\_ERROR\\_SUCCESS, then a CONNACK has been received from the server and return\\_code and session\\_present contain the values received. If error\\_code is not AWS\\_ERROR\\_SUCCESS, it refers to the internal error that occurred during connection, and return\\_code and session\\_present are invalid.
"""
const aws_mqtt_client_on_connection_complete_fn = Cvoid

# typedef void ( aws_mqtt_client_on_connection_interrupted_fn ) ( struct aws_mqtt_client_connection * connection , int error_code , void * userdata )
const aws_mqtt_client_on_connection_interrupted_fn = Cvoid

# typedef void ( aws_mqtt_client_on_connection_resumed_fn ) ( struct aws_mqtt_client_connection * connection , enum aws_mqtt_connect_return_code return_code , bool session_present , void * userdata )
"""
Called when a connection to the server is resumed (if clean\\_session is true, calling [`aws_mqtt_resubscribe_existing_topics`](@ref) is suggested)
"""
const aws_mqtt_client_on_connection_resumed_fn = Cvoid

# typedef void ( aws_mqtt_suback_multi_fn ) ( struct aws_mqtt_client_connection * connection , uint16_t packet_id , const struct aws_array_list * topic_subacks , /* contains aws_mqtt_topic_subscription pointers */ int error_code , void * userdata )
"""
Called when a multi-topic subscription request is complete. Note: If any topic\\_suback's qos value is AWS\\_MQTT\\_QOS\\_FAILURE, then that topic subscription was rejected by the broker.
"""
const aws_mqtt_suback_multi_fn = Cvoid

# typedef void ( aws_mqtt_suback_fn ) ( struct aws_mqtt_client_connection * connection , uint16_t packet_id , const struct aws_byte_cursor * topic , enum aws_mqtt_qos qos , int error_code , void * userdata )
"""
Called when a single-topic subscription request is complete. Note: If the qos value is AWS\\_MQTT\\_QOS\\_FAILURE, then the subscription was rejected by the broker.
"""
const aws_mqtt_suback_fn = Cvoid

# typedef void ( aws_mqtt_client_publish_received_fn ) ( struct aws_mqtt_client_connection * connection , const struct aws_byte_cursor * topic , const struct aws_byte_cursor * payload , bool dup , enum aws_mqtt_qos qos , bool retain , void * userdata )
"""
Called when a publish message is received.

### Parameters
* `connection`:\\[in\\] The connection object
* `topic`:\\[in\\] The information channel to which the payload data was published.
* `payload`:\\[in\\] The payload data.
* `dup`:\\[in\\] DUP flag. If true, this might be re-delivery of an earlier attempt to send the message.
* `qos`:\\[in\\] Quality of Service used to deliver the message.
* `retain`:\\[in\\] Retain flag. If true, the message was sent as a result of a new subscription being made by the client.
"""
const aws_mqtt_client_publish_received_fn = Cvoid

# typedef void ( aws_mqtt_client_on_disconnect_fn ) ( struct aws_mqtt_client_connection * connection , void * userdata )
"""
Called when a connection is closed, right before any resources are deleted
"""
const aws_mqtt_client_on_disconnect_fn = Cvoid

# typedef void ( aws_mqtt_transform_websocket_handshake_complete_fn ) ( struct aws_http_message * request , int error_code , void * complete_ctx )
"""
Function to invoke when the websocket handshake request transformation completes. This function MUST be invoked or the application will soft-lock.

`request` and `complete_ctx` must be the same pointers provided to the [`aws_mqtt_transform_websocket_handshake_fn`](@ref). `error_code` should should be AWS\\_ERROR\\_SUCCESS if transformation was successful, otherwise pass a different AWS\\_ERROR\\_X value.
"""
const aws_mqtt_transform_websocket_handshake_complete_fn = Cvoid

# typedef void ( aws_mqtt_transform_websocket_handshake_fn ) ( struct aws_http_message * request , void * user_data , aws_mqtt_transform_websocket_handshake_complete_fn * complete_fn , void * complete_ctx )
"""
Function that may transform the websocket handshake request. Called each time a websocket connection is attempted.

The default request uses path "/mqtt". All required headers are present, plus the optional header "Sec-WebSocket-Protocol: mqtt".

The user MUST invoke the `complete_fn` when transformation is complete or the application will soft-lock. When invoking the `complete_fn`, pass along the `request` and `complete_ctx` provided here and an error code. The error code should be AWS\\_ERROR\\_SUCCESS if transformation was successful, otherwise pass a different AWS\\_ERROR\\_X value.
"""
const aws_mqtt_transform_websocket_handshake_fn = Cvoid

# typedef int aws_mqtt_validate_websocket_handshake_fn ( struct aws_mqtt_client_connection * connection , const struct aws_http_header * header_array , size_t num_headers , void * userdata )
"""
Function that may accept or reject a websocket handshake response. Called each time a valid websocket connection is established.

All required headers have been checked already (ex: "Sec-Websocket-Accept"), but optional headers have not (Ex: "Sec-Websocket-Protocol").

Return [`AWS_OP_SUCCESS`](@ref) to accept the connection or [`AWS_OP_ERR`](@ref) to stop the connection attempt.
"""
const aws_mqtt_validate_websocket_handshake_fn = Cvoid

@cenum aws_mqtt_qos::UInt32 begin
    AWS_MQTT_QOS_AT_MOST_ONCE = 0
    AWS_MQTT_QOS_AT_LEAST_ONCE = 1
    AWS_MQTT_QOS_EXACTLY_ONCE = 2
    AWS_MQTT_QOS_FAILURE = 128
end

"""
    aws_mqtt_topic_subscription

Passed to subscribe() and suback callbacks
"""
struct aws_mqtt_topic_subscription
    topic::aws_byte_cursor
    qos::aws_mqtt_qos
    on_publish::Ptr{Cvoid}
    on_cleanup::Ptr{Cvoid}
    on_publish_ud::Ptr{Cvoid}
end

"""
    aws_mqtt_connection_options

host\\_name The server name to connect to. This resource may be freed immediately on return. port The port on the server to connect to client\\_id The clientid to place in the CONNECT packet. socket\\_options The socket options to pass to the [`aws_client_bootstrap`](@ref) functions. This is copied into the connection tls\\_options TLS settings to use when opening a connection. This is copied into the connection Pass NULL to connect without TLS (NOT RECOMMENDED) clean\\_session True to discard all server session data and start fresh keep\\_alive\\_time\\_secs The keep alive value to place in the CONNECT PACKET, a PING will automatically be sent at this interval as well. If you specify 0, defaults will be used and a ping will be sent once per 20 minutes. This duration must be longer than ping\\_timeout\\_ms. ping\\_timeout\\_ms Network connection is re-established if a ping response is not received within this amount of time (milliseconds). If you specify 0, a default value of 3 seconds is used. Alternatively, tcp keep-alive may be away to accomplish this in a more efficient (low-power) scenario, but keep-alive options may not work the same way on every platform and OS version. This duration must be shorter than keep\\_alive\\_time\\_secs. protocol\\_operation\\_timeout\\_ms Timeout when waiting for the response to some operation requires response by protocol. Set to zero to disable timeout. Otherwise, the operation will fail with error AWS\\_ERROR\\_MQTT\\_TIMEOUT if no response is received within this amount of time after the packet is written to the socket. The timer is reset if the connection is interrupted. It applied to PUBLISH (QoS>0) and UNSUBSCRIBE now. Note: While the MQTT 3 specification states that a broker MUST respond, some brokers are known to ignore publish packets in exceptional circumstances (e.g. AWS IoT Core will not respond if the publish quota is exceeded). on\\_connection\\_complete The callback to fire when the connection attempt completes user\\_data Passed to the userdata param of on\\_connection\\_complete
"""
struct aws_mqtt_connection_options
    host_name::aws_byte_cursor
    port::UInt16
    socket_options::Ptr{aws_socket_options}
    tls_options::Ptr{aws_tls_connection_options}
    client_id::aws_byte_cursor
    keep_alive_time_secs::UInt16
    ping_timeout_ms::UInt32
    protocol_operation_timeout_ms::UInt32
    on_connection_complete::Ptr{Cvoid}
    user_data::Ptr{Cvoid}
    clean_session::Bool
end

"""
    aws_mqtt_client_new(allocator, bootstrap)

Creates an instance of [`aws_mqtt_client`](@ref).

### Parameters
* `allocator`:\\[in\\] The allocator the client will use for all future allocations
* `bootstrap`:\\[in\\] The client bootstrap to use to initiate new socket connections
### Returns
a new instance of an [`aws_mqtt_client`](@ref) if successful, NULL otherwise
### Prototype
```c
struct aws_mqtt_client *aws_mqtt_client_new(struct aws_allocator *allocator, struct aws_client_bootstrap *bootstrap);
```
"""
function aws_mqtt_client_new(allocator, bootstrap)
    ccall((:aws_mqtt_client_new, libawscrt), Ptr{aws_mqtt_client}, (Ptr{aws_allocator}, Ptr{aws_client_bootstrap}), allocator, bootstrap)
end

"""
    aws_mqtt_client_acquire(client)

Increments the ref count to an mqtt client, allowing the caller to take a reference to it

### Parameters
* `client`:\\[in\\] The client to increment the ref count on
### Returns
the mqtt client
### Prototype
```c
struct aws_mqtt_client *aws_mqtt_client_acquire(struct aws_mqtt_client *client);
```
"""
function aws_mqtt_client_acquire(client)
    ccall((:aws_mqtt_client_acquire, libawscrt), Ptr{aws_mqtt_client}, (Ptr{aws_mqtt_client},), client)
end

"""
    aws_mqtt_client_release(client)

Decrements the ref count on an mqtt client. If the ref count drops to zero, the client is cleaned up.

### Parameters
* `client`:\\[in\\] The client to release a ref count on
### Prototype
```c
void aws_mqtt_client_release(struct aws_mqtt_client *client);
```
"""
function aws_mqtt_client_release(client)
    ccall((:aws_mqtt_client_release, libawscrt), Cvoid, (Ptr{aws_mqtt_client},), client)
end

"""
    aws_mqtt_client_connection_new(client)

Spawns a new connection object.

### Parameters
* `client`:\\[in\\] The client to spawn the connection from
### Returns
a new mqtt connection on success, NULL otherwise
### Prototype
```c
struct aws_mqtt_client_connection *aws_mqtt_client_connection_new(struct aws_mqtt_client *client);
```
"""
function aws_mqtt_client_connection_new(client)
    ccall((:aws_mqtt_client_connection_new, libawscrt), Ptr{aws_mqtt_client_connection}, (Ptr{aws_mqtt_client},), client)
end

"""
    aws_mqtt_client_connection_acquire(connection)

Increments the ref count to an mqtt client connection, allowing the caller to take a reference to it

### Parameters
* `connection`:\\[in\\] The connection object
### Returns
the mqtt connection
### Prototype
```c
struct aws_mqtt_client_connection *aws_mqtt_client_connection_acquire(struct aws_mqtt_client_connection *connection);
```
"""
function aws_mqtt_client_connection_acquire(connection)
    ccall((:aws_mqtt_client_connection_acquire, libawscrt), Ptr{aws_mqtt_client_connection}, (Ptr{aws_mqtt_client_connection},), connection)
end

"""
    aws_mqtt_client_connection_release(connection)

Decrements the ref count on an mqtt connection. If the ref count drops to zero, the connection is cleaned up. Note: cannot call this with lock held, since it will start the destroy process and cause a dead lock.

### Parameters
* `connection`:\\[in\\] The connection object
### Prototype
```c
void aws_mqtt_client_connection_release(struct aws_mqtt_client_connection *connection);
```
"""
function aws_mqtt_client_connection_release(connection)
    ccall((:aws_mqtt_client_connection_release, libawscrt), Cvoid, (Ptr{aws_mqtt_client_connection},), connection)
end

"""
    aws_mqtt_client_connection_set_will(connection, topic, qos, retain, payload)

Sets the will message to send with the CONNECT packet.

### Parameters
* `connection`:\\[in\\] The connection object
* `topic`:\\[in\\] The topic to publish the will on
* `qos`:\\[in\\] The QoS to publish the will with
* `retain`:\\[in\\] The retain flag to publish the will with
* `payload`:\\[in\\] The data if the will message
### Prototype
```c
int aws_mqtt_client_connection_set_will( struct aws_mqtt_client_connection *connection, const struct aws_byte_cursor *topic, enum aws_mqtt_qos qos, bool retain, const struct aws_byte_cursor *payload);
```
"""
function aws_mqtt_client_connection_set_will(connection, topic, qos, retain, payload)
    ccall((:aws_mqtt_client_connection_set_will, libawscrt), Cint, (Ptr{aws_mqtt_client_connection}, Ptr{aws_byte_cursor}, aws_mqtt_qos, Bool, Ptr{aws_byte_cursor}), connection, topic, qos, retain, payload)
end

"""
    aws_mqtt_client_connection_set_login(connection, username, password)

Sets the username and/or password to send with the CONNECT packet.

### Parameters
* `connection`:\\[in\\] The connection object
* `username`:\\[in\\] The username to connect with
* `password`:\\[in\\] [optional] The password to connect with
### Prototype
```c
int aws_mqtt_client_connection_set_login( struct aws_mqtt_client_connection *connection, const struct aws_byte_cursor *username, const struct aws_byte_cursor *password);
```
"""
function aws_mqtt_client_connection_set_login(connection, username, password)
    ccall((:aws_mqtt_client_connection_set_login, libawscrt), Cint, (Ptr{aws_mqtt_client_connection}, Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}), connection, username, password)
end

"""
    aws_mqtt_client_connection_use_websockets(connection, transformer, transformer_ud, validator, validator_ud)

Use MQTT over websockets when connecting. Requires the MQTT\\_WITH\\_WEBSOCKETS build option.

In this scenario, an HTTP connection is established, which is then upgraded to a websocket connection, which is then used to send MQTT data.

### Parameters
* `connection`:\\[in\\] The connection object.
* `transformer`:\\[in\\] [optional] Function that may transform the websocket handshake request. See [`aws_mqtt_transform_websocket_handshake_fn`](@ref) for more info.
* `transformer_ud`:\\[in\\] [optional] Userdata for request\\_transformer.
* `validator`:\\[in\\] [optional] Function that may reject the websocket handshake response.
* `validator_ud`:\\[in\\] [optional] Userdata for response\\_validator.
### Prototype
```c
int aws_mqtt_client_connection_use_websockets( struct aws_mqtt_client_connection *connection, aws_mqtt_transform_websocket_handshake_fn *transformer, void *transformer_ud, aws_mqtt_validate_websocket_handshake_fn *validator, void *validator_ud);
```
"""
function aws_mqtt_client_connection_use_websockets(connection, transformer, transformer_ud, validator, validator_ud)
    ccall((:aws_mqtt_client_connection_use_websockets, libawscrt), Cint, (Ptr{aws_mqtt_client_connection}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), connection, transformer, transformer_ud, validator, validator_ud)
end

"""
    aws_mqtt_client_connection_set_http_proxy_options(connection, proxy_options)

Set http proxy options for the connection.

### Prototype
```c
int aws_mqtt_client_connection_set_http_proxy_options( struct aws_mqtt_client_connection *connection, struct aws_http_proxy_options *proxy_options);
```
"""
function aws_mqtt_client_connection_set_http_proxy_options(connection, proxy_options)
    ccall((:aws_mqtt_client_connection_set_http_proxy_options, libawscrt), Cint, (Ptr{aws_mqtt_client_connection}, Ptr{aws_http_proxy_options}), connection, proxy_options)
end

"""
    aws_mqtt_client_connection_set_reconnect_timeout(connection, min_timeout, max_timeout)

Sets the minimum and maximum reconnect timeouts.

The time between reconnect attempts will start at min and multiply by 2 until max is reached.

### Parameters
* `connection`:\\[in\\] The connection object
* `min_timeout`:\\[in\\] The timeout to start with
* `max_timeout`:\\[in\\] The highest allowable wait time between reconnect attempts
### Prototype
```c
int aws_mqtt_client_connection_set_reconnect_timeout( struct aws_mqtt_client_connection *connection, uint64_t min_timeout, uint64_t max_timeout);
```
"""
function aws_mqtt_client_connection_set_reconnect_timeout(connection, min_timeout, max_timeout)
    ccall((:aws_mqtt_client_connection_set_reconnect_timeout, libawscrt), Cint, (Ptr{aws_mqtt_client_connection}, UInt64, UInt64), connection, min_timeout, max_timeout)
end

"""
    aws_mqtt_client_connection_set_connection_interruption_handlers(connection, on_interrupted, on_interrupted_ud, on_resumed, on_resumed_ud)

Sets the callbacks to call when a connection is interrupted and resumed.

### Parameters
* `connection`:\\[in\\] The connection object
* `on_interrupted`:\\[in\\] The function to call when a connection is lost
* `on_interrupted_ud`:\\[in\\] Userdata for on\\_interrupted
* `on_resumed`:\\[in\\] The function to call when a connection is resumed (if clean\\_session is true, calling [`aws_mqtt_resubscribe_existing_topics`](@ref) is suggested)
* `on_resumed_ud`:\\[in\\] Userdata for on\\_resumed
### Prototype
```c
int aws_mqtt_client_connection_set_connection_interruption_handlers( struct aws_mqtt_client_connection *connection, aws_mqtt_client_on_connection_interrupted_fn *on_interrupted, void *on_interrupted_ud, aws_mqtt_client_on_connection_resumed_fn *on_resumed, void *on_resumed_ud);
```
"""
function aws_mqtt_client_connection_set_connection_interruption_handlers(connection, on_interrupted, on_interrupted_ud, on_resumed, on_resumed_ud)
    ccall((:aws_mqtt_client_connection_set_connection_interruption_handlers, libawscrt), Cint, (Ptr{aws_mqtt_client_connection}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), connection, on_interrupted, on_interrupted_ud, on_resumed, on_resumed_ud)
end

"""
    aws_mqtt_client_connection_set_on_any_publish_handler(connection, on_any_publish, on_any_publish_ud)

Sets the callback to call whenever ANY publish packet is received. Only safe to set when connection is not connected.

### Parameters
* `connection`:\\[in\\] The connection object
* `on_any_publish`:\\[in\\] The function to call when a publish is received (pass NULL to unset)
* `on_any_publish_ud`:\\[in\\] Userdata for on\\_any\\_publish
### Prototype
```c
int aws_mqtt_client_connection_set_on_any_publish_handler( struct aws_mqtt_client_connection *connection, aws_mqtt_client_publish_received_fn *on_any_publish, void *on_any_publish_ud);
```
"""
function aws_mqtt_client_connection_set_on_any_publish_handler(connection, on_any_publish, on_any_publish_ud)
    ccall((:aws_mqtt_client_connection_set_on_any_publish_handler, libawscrt), Cint, (Ptr{aws_mqtt_client_connection}, Ptr{Cvoid}, Ptr{Cvoid}), connection, on_any_publish, on_any_publish_ud)
end

"""
    aws_mqtt_client_connection_connect(connection, connection_options)

Opens the actual connection defined by [`aws_mqtt_client_connection_new`](@ref). Once the connection is opened, on\\_connack will be called. Only called when connection is disconnected.

### Parameters
* `connection`:\\[in\\] The connection object
* `connection_options`:\\[in\\] Configuration information for the connection attempt
### Returns
[`AWS_OP_SUCCESS`](@ref) if the connection has been successfully initiated, otherwise [`AWS_OP_ERR`](@ref) and [`aws_last_error`](@ref)() will be set.
### Prototype
```c
int aws_mqtt_client_connection_connect( struct aws_mqtt_client_connection *connection, const struct aws_mqtt_connection_options *connection_options);
```
"""
function aws_mqtt_client_connection_connect(connection, connection_options)
    ccall((:aws_mqtt_client_connection_connect, libawscrt), Cint, (Ptr{aws_mqtt_client_connection}, Ptr{aws_mqtt_connection_options}), connection, connection_options)
end

"""
    aws_mqtt_client_connection_reconnect(connection, on_connection_complete, userdata)

DEPRECATED Opens the actual connection defined by [`aws_mqtt_client_connection_new`](@ref). Once the connection is opened, on\\_connack will be called.

Must be called on a connection that has previously been open, as the parameters passed during the last connection will be reused.

### Parameters
* `connection`:\\[in\\] The connection object
* `on_connection_complete`:\\[in\\] The callback to fire when the connection attempt completes
* `userdata`:\\[in\\] (nullable) Passed to the userdata param of on\\_connection\\_complete
### Returns
[`AWS_OP_SUCCESS`](@ref) if the connection has been successfully initiated, otherwise [`AWS_OP_ERR`](@ref) and [`aws_last_error`](@ref)() will be set.
### Prototype
```c
int aws_mqtt_client_connection_reconnect( struct aws_mqtt_client_connection *connection, aws_mqtt_client_on_connection_complete_fn *on_connection_complete, void *userdata);
```
"""
function aws_mqtt_client_connection_reconnect(connection, on_connection_complete, userdata)
    ccall((:aws_mqtt_client_connection_reconnect, libawscrt), Cint, (Ptr{aws_mqtt_client_connection}, Ptr{Cvoid}, Ptr{Cvoid}), connection, on_connection_complete, userdata)
end

"""
    aws_mqtt_client_connection_disconnect(connection, on_disconnect, userdata)

Closes the connection asynchronously, calls the on\\_disconnect callback. All uncompleted requests (publish/subscribe/unsubscribe) will be cancelled, regardless to the status of clean\\_session. DISCONNECT packet will be sent, which deletes the will message from server.

### Parameters
* `connection`:\\[in\\] The connection to close
* `on_disconnect`:\\[in\\] (nullable) Callback function to invoke when the connection is completely disconnected.
* `userdata`:\\[in\\] (nullable) passed to on\\_disconnect
### Returns
[`AWS_OP_SUCCESS`](@ref) if the connection is open and is being shutdown, otherwise [`AWS_OP_ERR`](@ref) and [`aws_last_error`](@ref)() is set.
### Prototype
```c
int aws_mqtt_client_connection_disconnect( struct aws_mqtt_client_connection *connection, aws_mqtt_client_on_disconnect_fn *on_disconnect, void *userdata);
```
"""
function aws_mqtt_client_connection_disconnect(connection, on_disconnect, userdata)
    ccall((:aws_mqtt_client_connection_disconnect, libawscrt), Cint, (Ptr{aws_mqtt_client_connection}, Ptr{Cvoid}, Ptr{Cvoid}), connection, on_disconnect, userdata)
end

"""
    aws_mqtt_client_connection_subscribe_multiple(connection, topic_filters, on_suback, on_suback_ud)

Subscribe to topic filters. on\\_publish will be called when a PUBLISH matching each topic\\_filter is received.

### Parameters
* `connection`:\\[in\\] The connection to subscribe on
* `topic_filters`:\\[in\\] An array\\_list of [`aws_mqtt_topic_subscription`](@ref) (NOT pointers) describing the requests.
* `on_suback`:\\[in\\] (nullable) Called when a SUBACK has been received from the server and the subscription is complete. Broker may fail one of the topics, check the qos in [`aws_mqtt_topic_subscription`](@ref) from the callback
* `on_suback_ud`:\\[in\\] (nullable) Passed to on\\_suback
### Returns
The packet id of the subscribe packet if successfully sent, otherwise 0.
### Prototype
```c
uint16_t aws_mqtt_client_connection_subscribe_multiple( struct aws_mqtt_client_connection *connection, const struct aws_array_list *topic_filters, aws_mqtt_suback_multi_fn *on_suback, void *on_suback_ud);
```
"""
function aws_mqtt_client_connection_subscribe_multiple(connection, topic_filters, on_suback, on_suback_ud)
    ccall((:aws_mqtt_client_connection_subscribe_multiple, libawscrt), UInt16, (Ptr{aws_mqtt_client_connection}, Ptr{aws_array_list}, Ptr{Cvoid}, Ptr{Cvoid}), connection, topic_filters, on_suback, on_suback_ud)
end

"""
    aws_mqtt_client_connection_subscribe(connection, topic_filter, qos, on_publish, on_publish_ud, on_ud_cleanup, on_suback, on_suback_ud)

Subscribe to a single topic filter. on\\_publish will be called when a PUBLISH matching topic\\_filter is received.

### Parameters
* `connection`:\\[in\\] The connection to subscribe on
* `topic_filter`:\\[in\\] The topic filter to subscribe on. This resource must persist until on\\_suback.
* `qos`:\\[in\\] The maximum QoS of messages to receive
* `on_publish`:\\[in\\] (nullable) Called when a PUBLISH packet matching topic\\_filter is received
* `on_publish_ud`:\\[in\\] (nullable) Passed to on\\_publish
* `on_ud_cleanup`:\\[in\\] (nullable) Called when a subscription is removed, on\\_publish\\_ud is passed.
* `on_suback`:\\[in\\] (nullable) Called when a SUBACK has been received from the server and the subscription is complete
* `on_suback_ud`:\\[in\\] (nullable) Passed to on\\_suback
### Returns
The packet id of the subscribe packet if successfully sent, otherwise 0.
### Prototype
```c
uint16_t aws_mqtt_client_connection_subscribe( struct aws_mqtt_client_connection *connection, const struct aws_byte_cursor *topic_filter, enum aws_mqtt_qos qos, aws_mqtt_client_publish_received_fn *on_publish, void *on_publish_ud, aws_mqtt_userdata_cleanup_fn *on_ud_cleanup, aws_mqtt_suback_fn *on_suback, void *on_suback_ud);
```
"""
function aws_mqtt_client_connection_subscribe(connection, topic_filter, qos, on_publish, on_publish_ud, on_ud_cleanup, on_suback, on_suback_ud)
    ccall((:aws_mqtt_client_connection_subscribe, libawscrt), UInt16, (Ptr{aws_mqtt_client_connection}, Ptr{aws_byte_cursor}, aws_mqtt_qos, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), connection, topic_filter, qos, on_publish, on_publish_ud, on_ud_cleanup, on_suback, on_suback_ud)
end

"""
    aws_mqtt_client_connection_subscribe_local(connection, topic_filter, on_publish, on_publish_ud, on_ud_cleanup, on_suback, on_suback_ud)

Subscribe to a single topic filter WITHOUT sending a SUBSCRIBE packet. This is useful if you expect the broker to send PUBLISHES without first subscribing. on\\_publish will be called when a PUBLISH matching topic\\_filter is received.

### Parameters
* `connection`:\\[in\\] The connection to subscribe on
* `topic_filter`:\\[in\\] The topic filter to subscribe on. This resource must persist until on\\_suback.
* `on_publish`:\\[in\\] (nullable) Called when a PUBLISH packet matching topic\\_filter is received
* `on_publish_ud`:\\[in\\] (nullable) Passed to on\\_publish
* `on_ud_cleanup`:\\[in\\] (nullable) Called when a subscription is removed, on\\_publish\\_ud is passed.
* `on_suback`:\\[in\\] (nullable) Called when a SUBACK has been received from the server and the subscription is complete
* `on_suback_ud`:\\[in\\] (nullable) Passed to on\\_suback
### Returns
The "packet id" of the operation if successfully initiated, otherwise 0.
### Prototype
```c
uint16_t aws_mqtt_client_connection_subscribe_local( struct aws_mqtt_client_connection *connection, const struct aws_byte_cursor *topic_filter, aws_mqtt_client_publish_received_fn *on_publish, void *on_publish_ud, aws_mqtt_userdata_cleanup_fn *on_ud_cleanup, aws_mqtt_suback_fn *on_suback, void *on_suback_ud);
```
"""
function aws_mqtt_client_connection_subscribe_local(connection, topic_filter, on_publish, on_publish_ud, on_ud_cleanup, on_suback, on_suback_ud)
    ccall((:aws_mqtt_client_connection_subscribe_local, libawscrt), UInt16, (Ptr{aws_mqtt_client_connection}, Ptr{aws_byte_cursor}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), connection, topic_filter, on_publish, on_publish_ud, on_ud_cleanup, on_suback, on_suback_ud)
end

"""
    aws_mqtt_resubscribe_existing_topics(connection, on_suback, on_suback_ud)

Resubscribe to all topics currently subscribed to. This is to help when resuming a connection with a clean session.

### Parameters
* `connection`:\\[in\\] The connection to subscribe on
* `on_suback`:\\[in\\] (nullable) Called when a SUBACK has been received from the server and the subscription is complete
* `on_suback_ud`:\\[in\\] (nullable) Passed to on\\_suback
### Returns
The packet id of the subscribe packet if successfully sent, otherwise 0 (and [`aws_last_error`](@ref)() will be set).
### Prototype
```c
uint16_t aws_mqtt_resubscribe_existing_topics( struct aws_mqtt_client_connection *connection, aws_mqtt_suback_multi_fn *on_suback, void *on_suback_ud);
```
"""
function aws_mqtt_resubscribe_existing_topics(connection, on_suback, on_suback_ud)
    ccall((:aws_mqtt_resubscribe_existing_topics, libawscrt), UInt16, (Ptr{aws_mqtt_client_connection}, Ptr{Cvoid}, Ptr{Cvoid}), connection, on_suback, on_suback_ud)
end

"""
    aws_mqtt_client_connection_unsubscribe(connection, topic_filter, on_unsuback, on_unsuback_ud)

Unsubscribe to a topic filter.

### Parameters
* `connection`:\\[in\\] The connection to unsubscribe on
* `topic_filter`:\\[in\\] The topic filter to unsubscribe on. This resource must persist until on\\_unsuback.
* `on_unsuback`:\\[in\\] (nullable) Called when a UNSUBACK has been received from the server and the subscription is removed
* `on_unsuback_ud`:\\[in\\] (nullable) Passed to on\\_unsuback
### Returns
The packet id of the unsubscribe packet if successfully sent, otherwise 0.
### Prototype
```c
uint16_t aws_mqtt_client_connection_unsubscribe( struct aws_mqtt_client_connection *connection, const struct aws_byte_cursor *topic_filter, aws_mqtt_op_complete_fn *on_unsuback, void *on_unsuback_ud);
```
"""
function aws_mqtt_client_connection_unsubscribe(connection, topic_filter, on_unsuback, on_unsuback_ud)
    ccall((:aws_mqtt_client_connection_unsubscribe, libawscrt), UInt16, (Ptr{aws_mqtt_client_connection}, Ptr{aws_byte_cursor}, Ptr{Cvoid}, Ptr{Cvoid}), connection, topic_filter, on_unsuback, on_unsuback_ud)
end

"""
    aws_mqtt_client_connection_publish(connection, topic, qos, retain, payload, on_complete, userdata)

Send a PUBLISH packet over connection.

### Parameters
* `connection`:\\[in\\] The connection to publish on
* `topic`:\\[in\\] The topic to publish on
* `qos`:\\[in\\] The requested QoS of the packet
* `retain`:\\[in\\] True to have the server save the packet, and send to all new subscriptions matching topic
* `payload`:\\[in\\] The data to send as the payload of the publish
* `on_complete`:\\[in\\] (nullable) For QoS 0, called as soon as the packet is sent For QoS 1, called when PUBACK is received For QoS 2, called when PUBCOMP is received
* `user_data`:\\[in\\] (nullable) Passed to on\\_complete
### Returns
The packet id of the publish packet if successfully sent, otherwise 0.
### Prototype
```c
uint16_t aws_mqtt_client_connection_publish( struct aws_mqtt_client_connection *connection, const struct aws_byte_cursor *topic, enum aws_mqtt_qos qos, bool retain, const struct aws_byte_cursor *payload, aws_mqtt_op_complete_fn *on_complete, void *userdata);
```
"""
function aws_mqtt_client_connection_publish(connection, topic, qos, retain, payload, on_complete, userdata)
    ccall((:aws_mqtt_client_connection_publish, libawscrt), UInt16, (Ptr{aws_mqtt_client_connection}, Ptr{aws_byte_cursor}, aws_mqtt_qos, Bool, Ptr{aws_byte_cursor}, Ptr{Cvoid}, Ptr{Cvoid}), connection, topic, qos, retain, payload, on_complete, userdata)
end

@cenum aws_mqtt_connect_return_code::UInt32 begin
    AWS_MQTT_CONNECT_ACCEPTED = 0
    AWS_MQTT_CONNECT_UNACCEPTABLE_PROTOCOL_VERSION = 1
    AWS_MQTT_CONNECT_IDENTIFIER_REJECTED = 2
    AWS_MQTT_CONNECT_SERVER_UNAVAILABLE = 3
    AWS_MQTT_CONNECT_BAD_USERNAME_OR_PASSWORD = 4
    AWS_MQTT_CONNECT_NOT_AUTHORIZED = 5
end

@cenum aws_mqtt_error::UInt32 begin
    AWS_ERROR_MQTT_INVALID_RESERVED_BITS = 5120
    AWS_ERROR_MQTT_BUFFER_TOO_BIG = 5121
    AWS_ERROR_MQTT_INVALID_REMAINING_LENGTH = 5122
    AWS_ERROR_MQTT_UNSUPPORTED_PROTOCOL_NAME = 5123
    AWS_ERROR_MQTT_UNSUPPORTED_PROTOCOL_LEVEL = 5124
    AWS_ERROR_MQTT_INVALID_CREDENTIALS = 5125
    AWS_ERROR_MQTT_INVALID_QOS = 5126
    AWS_ERROR_MQTT_INVALID_PACKET_TYPE = 5127
    AWS_ERROR_MQTT_INVALID_TOPIC = 5128
    AWS_ERROR_MQTT_TIMEOUT = 5129
    AWS_ERROR_MQTT_PROTOCOL_ERROR = 5130
    AWS_ERROR_MQTT_NOT_CONNECTED = 5131
    AWS_ERROR_MQTT_ALREADY_CONNECTED = 5132
    AWS_ERROR_MQTT_BUILT_WITHOUT_WEBSOCKETS = 5133
    AWS_ERROR_MQTT_UNEXPECTED_HANGUP = 5134
    AWS_ERROR_MQTT_CONNECTION_SHUTDOWN = 5135
    AWS_ERROR_MQTT_CONNECTION_DESTROYED = 5136
    AWS_ERROR_MQTT_CONNECTION_DISCONNECTING = 5137
    AWS_ERROR_MQTT_CANCELLED_FOR_CLEAN_SESSION = 5138
    AWS_ERROR_MQTT_QUEUE_FULL = 5139
    AWS_ERROR_END_MQTT_RANGE = 6143
end

@cenum aws_mqtt_log_subject::UInt32 begin
    AWS_LS_MQTT_GENERAL = 5120
    AWS_LS_MQTT_CLIENT = 5121
    AWS_LS_MQTT_TOPIC_TREE = 5122
end

# typedef void ( aws_mqtt_userdata_cleanup_fn ) ( void * userdata )
"""
Function called on cleanup of a userdata.
"""
const aws_mqtt_userdata_cleanup_fn = Cvoid

"""
    aws_mqtt_is_valid_topic(topic)

### Prototype
```c
bool aws_mqtt_is_valid_topic(const struct aws_byte_cursor *topic);
```
"""
function aws_mqtt_is_valid_topic(topic)
    ccall((:aws_mqtt_is_valid_topic, libawscrt), Bool, (Ptr{aws_byte_cursor},), topic)
end

"""
    aws_mqtt_is_valid_topic_filter(topic_filter)

### Prototype
```c
bool aws_mqtt_is_valid_topic_filter(const struct aws_byte_cursor *topic_filter);
```
"""
function aws_mqtt_is_valid_topic_filter(topic_filter)
    ccall((:aws_mqtt_is_valid_topic_filter, libawscrt), Bool, (Ptr{aws_byte_cursor},), topic_filter)
end

"""
    aws_mqtt_library_init(allocator)

Initializes internal datastructures used by aws-c-mqtt. Must be called before using any functionality in aws-c-mqtt.

### Prototype
```c
void aws_mqtt_library_init(struct aws_allocator *allocator);
```
"""
function aws_mqtt_library_init(allocator)
    ccall((:aws_mqtt_library_init, libawscrt), Cvoid, (Ptr{aws_allocator},), allocator)
end

"""
    aws_mqtt_library_clean_up()

Shuts down the internal datastructures used by aws-c-mqtt.

### Prototype
```c
void aws_mqtt_library_clean_up(void);
```
"""
function aws_mqtt_library_clean_up()
    ccall((:aws_mqtt_library_clean_up, libawscrt), Cvoid, ())
end

"""
    aws_mqtt_fatal_assert_library_initialized()

### Prototype
```c
void aws_mqtt_fatal_assert_library_initialized(void);
```
"""
function aws_mqtt_fatal_assert_library_initialized()
    ccall((:aws_mqtt_fatal_assert_library_initialized, libawscrt), Cvoid, ())
end

@cenum aws_s3_errors::UInt32 begin
    AWS_ERROR_S3_MISSING_CONTENT_RANGE_HEADER = 14336
    AWS_ERROR_S3_INVALID_CONTENT_RANGE_HEADER = 14337
    AWS_ERROR_S3_MISSING_CONTENT_LENGTH_HEADER = 14338
    AWS_ERROR_S3_INVALID_CONTENT_LENGTH_HEADER = 14339
    AWS_ERROR_S3_MISSING_ETAG = 14340
    AWS_ERROR_S3_INTERNAL_ERROR = 14341
    AWS_ERROR_S3_SLOW_DOWN = 14342
    AWS_ERROR_S3_INVALID_RESPONSE_STATUS = 14343
    AWS_ERROR_S3_MISSING_UPLOAD_ID = 14344
    AWS_ERROR_S3_PROXY_PARSE_FAILED = 14345
    AWS_ERROR_S3_UNSUPPORTED_PROXY_SCHEME = 14346
    AWS_ERROR_S3_CANCELED = 14347
    AWS_ERROR_S3_INVALID_RANGE_HEADER = 14348
    AWS_ERROR_S3_MULTIRANGE_HEADER_UNSUPPORTED = 14349
    AWS_ERROR_S3_RESPONSE_CHECKSUM_MISMATCH = 14350
    AWS_ERROR_S3_CHECKSUM_CALCULATION_FAILED = 14351
    AWS_ERROR_S3_END_RANGE = 15359
end

@cenum aws_s3_subject::UInt32 begin
    AWS_LS_S3_GENERAL = 14336
    AWS_LS_S3_CLIENT = 14337
    AWS_LS_S3_CLIENT_STATS = 14338
    AWS_LS_S3_REQUEST = 14339
    AWS_LS_S3_META_REQUEST = 14340
    AWS_LS_S3_ENDPOINT = 14341
    AWS_LS_S3_LAST = 15359
end

struct aws_s3_cpu_group_info
    cpu_group::UInt16
    nic_name_array::Ptr{aws_byte_cursor}
    nic_name_array_length::Csize_t
end

struct aws_s3_compute_platform_info
    instance_type::aws_byte_cursor
    max_throughput_gbps::UInt16
    cpu_group_info_array::Ptr{aws_s3_cpu_group_info}
    cpu_group_info_array_length::Csize_t
end

"""
    aws_s3_library_init(allocator)

Initializes internal datastructures used by aws-c-s3. Must be called before using any functionality in aws-c-s3.

### Prototype
```c
void aws_s3_library_init(struct aws_allocator *allocator);
```
"""
function aws_s3_library_init(allocator)
    ccall((:aws_s3_library_init, libawscrt), Cvoid, (Ptr{aws_allocator},), allocator)
end

"""
    aws_s3_get_compute_platform_info_for_instance_type(instance_type_name)

Retrieves the pre-configured metadata for an ec2 instance type. If no such pre-configuration exists, returns NULL.

### Prototype
```c
struct aws_s3_compute_platform_info *aws_s3_get_compute_platform_info_for_instance_type( const struct aws_byte_cursor instance_type_name);
```
"""
function aws_s3_get_compute_platform_info_for_instance_type(instance_type_name)
    ccall((:aws_s3_get_compute_platform_info_for_instance_type, libawscrt), Ptr{aws_s3_compute_platform_info}, (aws_byte_cursor,), instance_type_name)
end

"""
    aws_s3_library_clean_up()

Shuts down the internal datastructures used by aws-c-s3.

### Prototype
```c
void aws_s3_library_clean_up(void);
```
"""
function aws_s3_library_clean_up()
    ccall((:aws_s3_library_clean_up, libawscrt), Cvoid, ())
end

mutable struct aws_s3_client end

mutable struct aws_s3_request end

mutable struct aws_s3_meta_request end

"""
    aws_s3_meta_request_type

A Meta Request represents a group of generated requests that are being done on behalf of the original request. For example, one large GetObject request can be transformed into a series of ranged GetObject requests that are executed in parallel to improve throughput.

The [`aws_s3_meta_request_type`](@ref) is a hint of transformation to be applied.
"""
@cenum aws_s3_meta_request_type::UInt32 begin
    AWS_S3_META_REQUEST_TYPE_DEFAULT = 0
    AWS_S3_META_REQUEST_TYPE_GET_OBJECT = 1
    AWS_S3_META_REQUEST_TYPE_PUT_OBJECT = 2
    AWS_S3_META_REQUEST_TYPE_COPY_OBJECT = 3
    AWS_S3_META_REQUEST_TYPE_MAX = 4
end

# typedef int ( aws_s3_meta_request_headers_callback_fn ) ( struct aws_s3_meta_request * meta_request , const struct aws_http_headers * headers , int response_status , void * user_data )
"""
Invoked to provide response headers received during execution of the meta request, both for success and error HTTP status codes.

Return [`AWS_OP_SUCCESS`](@ref) to continue processing the request. Return [`AWS_OP_ERR`](@ref) to indicate failure and cancel the request.
"""
const aws_s3_meta_request_headers_callback_fn = Cvoid

# typedef int ( aws_s3_meta_request_receive_body_callback_fn ) ( /* The meta request that the callback is being issued for. */ struct aws_s3_meta_request * meta_request , /* The body data for this chunk of the object. */ const struct aws_byte_cursor * body , /* The byte index of the object that this refers to. For example, for an HTTP message that has a range header, the
#       first chunk received will have a range_start that matches the range header's range-start.*/ uint64_t range_start , /* User data specified by aws_s3_meta_request_options.*/ void * user_data )
"""
Invoked to provide the request body as it is received.

Return [`AWS_OP_SUCCESS`](@ref) to continue processing the request. Return [`AWS_OP_ERR`](@ref) to indicate failure and cancel the request.
"""
const aws_s3_meta_request_receive_body_callback_fn = Cvoid

# typedef void ( aws_s3_meta_request_finish_fn ) ( struct aws_s3_meta_request * meta_request , const struct aws_s3_meta_request_result * meta_request_result , void * user_data )
"""
Invoked when the entire meta request execution is complete.
"""
const aws_s3_meta_request_finish_fn = Cvoid

"""
    aws_s3_meta_request_progress

Information sent in the meta\\_request progress callback.
"""
struct aws_s3_meta_request_progress
    bytes_transferred::UInt64
    content_length::UInt64
end

# typedef void ( aws_s3_meta_request_progress_fn ) ( struct aws_s3_meta_request * meta_request , const struct aws_s3_meta_request_progress * progress , void * user_data )
"""
Invoked to report progress of multi-part upload and copy object requests.
"""
const aws_s3_meta_request_progress_fn = Cvoid

# typedef void ( aws_s3_meta_request_shutdown_fn ) ( void * user_data )
const aws_s3_meta_request_shutdown_fn = Cvoid

# typedef void ( aws_s3_client_shutdown_complete_callback_fn ) ( void * user_data )
const aws_s3_client_shutdown_complete_callback_fn = Cvoid

@cenum aws_s3_meta_request_tls_mode::UInt32 begin
    AWS_MR_TLS_ENABLED = 0
    AWS_MR_TLS_DISABLED = 1
end

@cenum aws_s3_meta_request_compute_content_md5::UInt32 begin
    AWS_MR_CONTENT_MD5_DISABLED = 0
    AWS_MR_CONTENT_MD5_ENABLED = 1
end

@cenum aws_s3_checksum_algorithm::UInt32 begin
    AWS_SCA_NONE = 0
    AWS_SCA_INIT = 1
    AWS_SCA_CRC32C = 1
    AWS_SCA_CRC32 = 2
    AWS_SCA_SHA1 = 3
    AWS_SCA_SHA256 = 4
    AWS_SCA_COUNT = 5
end

struct aws_s3_client_config
    max_active_connections_override::UInt32
    region::aws_byte_cursor
    client_bootstrap::Ptr{aws_client_bootstrap}
    tls_mode::aws_s3_meta_request_tls_mode
    tls_connection_options::Ptr{aws_tls_connection_options}
    signing_config::Ptr{aws_signing_config_aws}
    part_size::Csize_t
    max_part_size::Csize_t
    throughput_target_gbps::Cdouble
    retry_strategy::Ptr{aws_retry_strategy}
    compute_content_md5::aws_s3_meta_request_compute_content_md5
    shutdown_callback::Ptr{Cvoid}
    shutdown_callback_user_data::Ptr{Cvoid}
end

struct aws_s3_meta_request_options
    type::aws_s3_meta_request_type
    signing_config::Ptr{aws_signing_config_aws}
    message::Ptr{aws_http_message}
    checksum_algorithm::aws_s3_checksum_algorithm
    validate_get_response_checksum::Bool
    user_data::Ptr{Cvoid}
    headers_callback::Ptr{Cvoid}
    body_callback::Ptr{Cvoid}
    finish_callback::Ptr{Cvoid}
    shutdown_callback::Ptr{Cvoid}
    progress_callback::Ptr{Cvoid}
    endpoint::Ptr{aws_uri}
end

struct aws_s3_meta_request_result
    error_response_headers::Ptr{aws_http_headers}
    error_response_body::Ptr{aws_byte_buf}
    response_status::Cint
    did_validate::Bool
    validation_algorithm::aws_s3_checksum_algorithm
    error_code::Cint
end

"""
    aws_s3_client_new(allocator, client_config)

### Prototype
```c
struct aws_s3_client *aws_s3_client_new( struct aws_allocator *allocator, const struct aws_s3_client_config *client_config);
```
"""
function aws_s3_client_new(allocator, client_config)
    ccall((:aws_s3_client_new, libawscrt), Ptr{aws_s3_client}, (Ptr{aws_allocator}, Ptr{aws_s3_client_config}), allocator, client_config)
end

"""
    aws_s3_client_acquire(client)

### Prototype
```c
void aws_s3_client_acquire(struct aws_s3_client *client);
```
"""
function aws_s3_client_acquire(client)
    ccall((:aws_s3_client_acquire, libawscrt), Cvoid, (Ptr{aws_s3_client},), client)
end

"""
    aws_s3_client_release(client)

### Prototype
```c
void aws_s3_client_release(struct aws_s3_client *client);
```
"""
function aws_s3_client_release(client)
    ccall((:aws_s3_client_release, libawscrt), Cvoid, (Ptr{aws_s3_client},), client)
end

"""
    aws_s3_client_make_meta_request(client, options)

### Prototype
```c
struct aws_s3_meta_request *aws_s3_client_make_meta_request( struct aws_s3_client *client, const struct aws_s3_meta_request_options *options);
```
"""
function aws_s3_client_make_meta_request(client, options)
    ccall((:aws_s3_client_make_meta_request, libawscrt), Ptr{aws_s3_meta_request}, (Ptr{aws_s3_client}, Ptr{aws_s3_meta_request_options}), client, options)
end

"""
    aws_s3_meta_request_cancel(meta_request)

### Prototype
```c
void aws_s3_meta_request_cancel(struct aws_s3_meta_request *meta_request);
```
"""
function aws_s3_meta_request_cancel(meta_request)
    ccall((:aws_s3_meta_request_cancel, libawscrt), Cvoid, (Ptr{aws_s3_meta_request},), meta_request)
end

"""
    aws_s3_meta_request_acquire(meta_request)

### Prototype
```c
void aws_s3_meta_request_acquire(struct aws_s3_meta_request *meta_request);
```
"""
function aws_s3_meta_request_acquire(meta_request)
    ccall((:aws_s3_meta_request_acquire, libawscrt), Cvoid, (Ptr{aws_s3_meta_request},), meta_request)
end

"""
    aws_s3_meta_request_release(meta_request)

### Prototype
```c
void aws_s3_meta_request_release(struct aws_s3_meta_request *meta_request);
```
"""
function aws_s3_meta_request_release(meta_request)
    ccall((:aws_s3_meta_request_release, libawscrt), Cvoid, (Ptr{aws_s3_meta_request},), meta_request)
end

"""
    aws_s3_init_default_signing_config(signing_config, region, credentials_provider)

### Prototype
```c
void aws_s3_init_default_signing_config( struct aws_signing_config_aws *signing_config, const struct aws_byte_cursor region, struct aws_credentials_provider *credentials_provider);
```
"""
function aws_s3_init_default_signing_config(signing_config, region, credentials_provider)
    ccall((:aws_s3_init_default_signing_config, libawscrt), Cvoid, (Ptr{aws_signing_config_aws}, aws_byte_cursor, Ptr{aws_credentials_provider}), signing_config, region, credentials_provider)
end

mutable struct aws_profile_property end

mutable struct aws_profile end

mutable struct aws_profile_collection end

"""
    aws_profile_source_type

The profile specification has rule exceptions based on what file the profile collection comes from.
"""
@cenum aws_profile_source_type::UInt32 begin
    AWS_PST_NONE = 0
    AWS_PST_CONFIG = 1
    AWS_PST_CREDENTIALS = 2
end

"""
    aws_profile_collection_destroy(profile_collection)

Clean up everything associated with a profile collection

### Prototype
```c
void aws_profile_collection_destroy(struct aws_profile_collection *profile_collection);
```
"""
function aws_profile_collection_destroy(profile_collection)
    ccall((:aws_profile_collection_destroy, libawscrt), Cvoid, (Ptr{aws_profile_collection},), profile_collection)
end

"""
    aws_profile_collection_new_from_file(allocator, file_path, source)

Create a new profile collection by parsing a file with the specified path

### Prototype
```c
struct aws_profile_collection *aws_profile_collection_new_from_file( struct aws_allocator *allocator, const struct aws_string *file_path, enum aws_profile_source_type source);
```
"""
function aws_profile_collection_new_from_file(allocator, file_path, source)
    ccall((:aws_profile_collection_new_from_file, libawscrt), Ptr{aws_profile_collection}, (Ptr{aws_allocator}, Ptr{aws_string}, aws_profile_source_type), allocator, file_path, source)
end

"""
    aws_profile_collection_new_from_merge(allocator, config_profiles, credentials_profiles)

Create a new profile collection by merging a config-file-based profile collection and a credentials-file-based profile collection

### Prototype
```c
struct aws_profile_collection *aws_profile_collection_new_from_merge( struct aws_allocator *allocator, const struct aws_profile_collection *config_profiles, const struct aws_profile_collection *credentials_profiles);
```
"""
function aws_profile_collection_new_from_merge(allocator, config_profiles, credentials_profiles)
    ccall((:aws_profile_collection_new_from_merge, libawscrt), Ptr{aws_profile_collection}, (Ptr{aws_allocator}, Ptr{aws_profile_collection}, Ptr{aws_profile_collection}), allocator, config_profiles, credentials_profiles)
end

"""
    aws_profile_collection_new_from_buffer(allocator, buffer, source)

Create a new profile collection by parsing text in a buffer. Primarily for testing.

### Prototype
```c
struct aws_profile_collection *aws_profile_collection_new_from_buffer( struct aws_allocator *allocator, const struct aws_byte_buf *buffer, enum aws_profile_source_type source);
```
"""
function aws_profile_collection_new_from_buffer(allocator, buffer, source)
    ccall((:aws_profile_collection_new_from_buffer, libawscrt), Ptr{aws_profile_collection}, (Ptr{aws_allocator}, Ptr{aws_byte_buf}, aws_profile_source_type), allocator, buffer, source)
end

"""
    aws_profile_collection_get_profile(profile_collection, profile_name)

Retrieves a reference to a profile with the specified name, if it exists, from the profile collection

### Prototype
```c
const struct aws_profile *aws_profile_collection_get_profile( const struct aws_profile_collection *profile_collection, const struct aws_string *profile_name);
```
"""
function aws_profile_collection_get_profile(profile_collection, profile_name)
    ccall((:aws_profile_collection_get_profile, libawscrt), Ptr{aws_profile}, (Ptr{aws_profile_collection}, Ptr{aws_string}), profile_collection, profile_name)
end

"""
    aws_profile_collection_get_profile_count(profile_collection)

Returns how many profiles a collection holds

### Prototype
```c
size_t aws_profile_collection_get_profile_count(const struct aws_profile_collection *profile_collection);
```
"""
function aws_profile_collection_get_profile_count(profile_collection)
    ccall((:aws_profile_collection_get_profile_count, libawscrt), Csize_t, (Ptr{aws_profile_collection},), profile_collection)
end

"""
    aws_profile_get_name(profile)

Returns a reference to the name of the provided profile

### Prototype
```c
const struct aws_string *aws_profile_get_name(const struct aws_profile *profile);
```
"""
function aws_profile_get_name(profile)
    ccall((:aws_profile_get_name, libawscrt), Ptr{aws_string}, (Ptr{aws_profile},), profile)
end

"""
    aws_profile_get_property(profile, property_name)

Retrieves a reference to a property with the specified name, if it exists, from a profile

### Prototype
```c
const struct aws_profile_property *aws_profile_get_property( const struct aws_profile *profile, const struct aws_string *property_name);
```
"""
function aws_profile_get_property(profile, property_name)
    ccall((:aws_profile_get_property, libawscrt), Ptr{aws_profile_property}, (Ptr{aws_profile}, Ptr{aws_string}), profile, property_name)
end

"""
    aws_profile_get_property_count(profile)

Returns how many properties a profile holds

### Prototype
```c
size_t aws_profile_get_property_count(const struct aws_profile *profile);
```
"""
function aws_profile_get_property_count(profile)
    ccall((:aws_profile_get_property_count, libawscrt), Csize_t, (Ptr{aws_profile},), profile)
end

"""
    aws_profile_property_get_value(property)

Returns a reference to the property's string value

### Prototype
```c
const struct aws_string *aws_profile_property_get_value(const struct aws_profile_property *property);
```
"""
function aws_profile_property_get_value(property)
    ccall((:aws_profile_property_get_value, libawscrt), Ptr{aws_string}, (Ptr{aws_profile_property},), property)
end

"""
    aws_profile_property_get_sub_property(property, sub_property_name)

Returns a reference to the value of a sub property with the given name, if it exists, in the property

### Prototype
```c
const struct aws_string *aws_profile_property_get_sub_property( const struct aws_profile_property *property, const struct aws_string *sub_property_name);
```
"""
function aws_profile_property_get_sub_property(property, sub_property_name)
    ccall((:aws_profile_property_get_sub_property, libawscrt), Ptr{aws_string}, (Ptr{aws_profile_property}, Ptr{aws_string}), property, sub_property_name)
end

"""
    aws_profile_property_get_sub_property_count(property)

Returns how many sub properties the property holds

### Prototype
```c
size_t aws_profile_property_get_sub_property_count(const struct aws_profile_property *property);
```
"""
function aws_profile_property_get_sub_property_count(property)
    ccall((:aws_profile_property_get_sub_property_count, libawscrt), Csize_t, (Ptr{aws_profile_property},), property)
end

"""
    aws_get_credentials_file_path(allocator, override_path)

Computes the final platform-specific path for the profile credentials file. Does limited home directory expansion/resolution.

override\\_path, if not null, will be searched first instead of using the standard home directory config path

### Prototype
```c
struct aws_string *aws_get_credentials_file_path( struct aws_allocator *allocator, const struct aws_byte_cursor *override_path);
```
"""
function aws_get_credentials_file_path(allocator, override_path)
    ccall((:aws_get_credentials_file_path, libawscrt), Ptr{aws_string}, (Ptr{aws_allocator}, Ptr{aws_byte_cursor}), allocator, override_path)
end

"""
    aws_get_config_file_path(allocator, override_path)

Computes the final platform-specific path for the profile config file. Does limited home directory expansion/resolution.

override\\_path, if not null, will be searched first instead of using the standard home directory config path

### Prototype
```c
struct aws_string *aws_get_config_file_path( struct aws_allocator *allocator, const struct aws_byte_cursor *override_path);
```
"""
function aws_get_config_file_path(allocator, override_path)
    ccall((:aws_get_config_file_path, libawscrt), Ptr{aws_string}, (Ptr{aws_allocator}, Ptr{aws_byte_cursor}), allocator, override_path)
end

"""
    aws_get_profile_name(allocator, override_name)

Computes the profile to use for credentials lookups based on profile resolution rules

### Prototype
```c
struct aws_string *aws_get_profile_name(struct aws_allocator *allocator, const struct aws_byte_cursor *override_name);
```
"""
function aws_get_profile_name(allocator, override_name)
    ccall((:aws_get_profile_name, libawscrt), Ptr{aws_string}, (Ptr{aws_allocator}, Ptr{aws_byte_cursor}), allocator, override_name)
end

struct aws_resource_name
    partition::aws_byte_cursor
    service::aws_byte_cursor
    region::aws_byte_cursor
    account_id::aws_byte_cursor
    resource_id::aws_byte_cursor
end

"""
    aws_resource_name_init_from_cur(arn, input)

Given an ARN "Amazon Resource Name" represented as an in memory a structure representing the parts

### Prototype
```c
int aws_resource_name_init_from_cur(struct aws_resource_name *arn, const struct aws_byte_cursor *input);
```
"""
function aws_resource_name_init_from_cur(arn, input)
    ccall((:aws_resource_name_init_from_cur, libawscrt), Cint, (Ptr{aws_resource_name}, Ptr{aws_byte_cursor}), arn, input)
end

"""
    aws_resource_name_length(arn, size)

Calculates the space needed to write an ARN to a byte buf

### Prototype
```c
int aws_resource_name_length(const struct aws_resource_name *arn, size_t *size);
```
"""
function aws_resource_name_length(arn, size)
    ccall((:aws_resource_name_length, libawscrt), Cint, (Ptr{aws_resource_name}, Ptr{Csize_t}), arn, size)
end

"""
    aws_byte_buf_append_resource_name(buf, arn)

Serializes an ARN structure into the lexical string format

### Prototype
```c
int aws_byte_buf_append_resource_name(struct aws_byte_buf *buf, const struct aws_resource_name *arn);
```
"""
function aws_byte_buf_append_resource_name(buf, arn)
    ccall((:aws_byte_buf_append_resource_name, libawscrt), Cint, (Ptr{aws_byte_buf}, Ptr{aws_resource_name}), buf, arn)
end

@cenum aws_sdkutils_errors::UInt32 begin
    AWS_ERROR_SDKUTILS_GENERAL = 15360
    AWS_ERROR_SDKUTILS_PARSE_FATAL = 15361
    AWS_ERROR_SDKUTILS_PARSE_RECOVERABLE = 15362
    AWS_ERROR_SDKUTILS_END_RANGE = 16383
end

@cenum aws_sdkutils_log_subject::UInt32 begin
    AWS_LS_SDKUTILS_GENERAL = 15360
    AWS_LS_SDKUTILS_PROFILE = 15361
    AWS_LS_SDKUTILS_LAST = 16383
end

"""
    aws_sdkutils_library_init(allocator)

### Prototype
```c
void aws_sdkutils_library_init(struct aws_allocator *allocator);
```
"""
function aws_sdkutils_library_init(allocator)
    ccall((:aws_sdkutils_library_init, libawscrt), Cvoid, (Ptr{aws_allocator},), allocator)
end

"""
    aws_sdkutils_library_clean_up()

### Prototype
```c
void aws_sdkutils_library_clean_up(void);
```
"""
function aws_sdkutils_library_clean_up()
    ccall((:aws_sdkutils_library_clean_up, libawscrt), Cvoid, ())
end

struct aws_test_harness
    on_before::Ptr{Cvoid}
    run::Ptr{Cvoid}
    on_after::Ptr{Cvoid}
    ctx::Ptr{Cvoid}
    test_name::Ptr{Cchar}
    suppress_memcheck::Cint
end

"""
    s_aws_run_test_case(harness)

### Prototype
```c
static inline int s_aws_run_test_case(struct aws_test_harness *harness);
```
"""
function s_aws_run_test_case(harness)
    ccall((:s_aws_run_test_case, libawscrt), Cint, (Ptr{aws_test_harness},), harness)
end

# typedef int ( aws_test_before_fn ) ( struct aws_allocator * allocator , void * ctx )
const aws_test_before_fn = Cvoid

# typedef int ( aws_test_run_fn ) ( struct aws_allocator * allocator , void * ctx )
const aws_test_run_fn = Cvoid

# typedef int ( aws_test_after_fn ) ( struct aws_allocator * allocator , int setup_result , void * ctx )
const aws_test_after_fn = Cvoid

"""
    s_print_stack_trace(sig, sig_info, user_data)

### Prototype
```c
static void s_print_stack_trace(int sig, siginfo_t *sig_info, void *user_data);
```
"""
function s_print_stack_trace(sig, sig_info, user_data)
    ccall((:s_print_stack_trace, libawscrt), Cvoid, (Cint, Ptr{siginfo_t}, Ptr{Cvoid}), sig, sig_info, user_data)
end

"""
    enable_vt_mode()

### Prototype
```c
static inline int enable_vt_mode(void);
```
"""
function enable_vt_mode()
    ccall((:enable_vt_mode, libawscrt), Cint, ())
end

struct testing_loop
    scheduler::aws_task_scheduler
    mock_on_callers_thread::Bool
end

"""
    s_testing_loop_run(event_loop)

### Prototype
```c
static int s_testing_loop_run(struct aws_event_loop *event_loop);
```
"""
function s_testing_loop_run(event_loop)
    ccall((:s_testing_loop_run, libawscrt), Cint, (Ptr{aws_event_loop},), event_loop)
end

"""
    s_testing_loop_stop(event_loop)

### Prototype
```c
static int s_testing_loop_stop(struct aws_event_loop *event_loop);
```
"""
function s_testing_loop_stop(event_loop)
    ccall((:s_testing_loop_stop, libawscrt), Cint, (Ptr{aws_event_loop},), event_loop)
end

"""
    s_testing_loop_wait_for_stop_completion(event_loop)

### Prototype
```c
static int s_testing_loop_wait_for_stop_completion(struct aws_event_loop *event_loop);
```
"""
function s_testing_loop_wait_for_stop_completion(event_loop)
    ccall((:s_testing_loop_wait_for_stop_completion, libawscrt), Cint, (Ptr{aws_event_loop},), event_loop)
end

"""
    s_testing_loop_schedule_task_now(event_loop, task)

### Prototype
```c
static void s_testing_loop_schedule_task_now(struct aws_event_loop *event_loop, struct aws_task *task);
```
"""
function s_testing_loop_schedule_task_now(event_loop, task)
    ccall((:s_testing_loop_schedule_task_now, libawscrt), Cvoid, (Ptr{aws_event_loop}, Ptr{aws_task}), event_loop, task)
end

"""
    s_testing_loop_schedule_task_future(event_loop, task, run_at_nanos)

### Prototype
```c
static void s_testing_loop_schedule_task_future( struct aws_event_loop *event_loop, struct aws_task *task, uint64_t run_at_nanos);
```
"""
function s_testing_loop_schedule_task_future(event_loop, task, run_at_nanos)
    ccall((:s_testing_loop_schedule_task_future, libawscrt), Cvoid, (Ptr{aws_event_loop}, Ptr{aws_task}, UInt64), event_loop, task, run_at_nanos)
end

"""
    s_testing_loop_cancel_task(event_loop, task)

### Prototype
```c
static void s_testing_loop_cancel_task(struct aws_event_loop *event_loop, struct aws_task *task);
```
"""
function s_testing_loop_cancel_task(event_loop, task)
    ccall((:s_testing_loop_cancel_task, libawscrt), Cvoid, (Ptr{aws_event_loop}, Ptr{aws_task}), event_loop, task)
end

"""
    s_testing_loop_is_on_callers_thread(event_loop)

### Prototype
```c
static bool s_testing_loop_is_on_callers_thread(struct aws_event_loop *event_loop);
```
"""
function s_testing_loop_is_on_callers_thread(event_loop)
    ccall((:s_testing_loop_is_on_callers_thread, libawscrt), Bool, (Ptr{aws_event_loop},), event_loop)
end

"""
    s_testing_loop_destroy(event_loop)

### Prototype
```c
static void s_testing_loop_destroy(struct aws_event_loop *event_loop);
```
"""
function s_testing_loop_destroy(event_loop)
    ccall((:s_testing_loop_destroy, libawscrt), Cvoid, (Ptr{aws_event_loop},), event_loop)
end

"""
    s_testing_loop_new(allocator, clock)

### Prototype
```c
static struct aws_event_loop *s_testing_loop_new(struct aws_allocator *allocator, aws_io_clock_fn clock);
```
"""
function s_testing_loop_new(allocator, clock)
    ccall((:s_testing_loop_new, libawscrt), Ptr{aws_event_loop}, (Ptr{aws_allocator}, aws_io_clock_fn), allocator, clock)
end

# typedef void ( testing_channel_handler_on_shutdown_fn ) ( enum aws_channel_direction dir , int error_code , bool free_scarce_resources_immediately , void * user_data )
const testing_channel_handler_on_shutdown_fn = Cvoid

struct testing_channel_handler
    messages::aws_linked_list
    latest_window_update::Csize_t
    initial_window::Csize_t
    complete_write_immediately::Bool
    complete_write_error_code::Cint
    on_shutdown::Ptr{Cvoid}
    on_shutdown_user_data::Ptr{Cvoid}
    stats::aws_crt_statistics_socket
end

"""
    s_testing_channel_handler_process_read_message(handler, slot, message)

### Prototype
```c
static int s_testing_channel_handler_process_read_message( struct aws_channel_handler *handler, struct aws_channel_slot *slot, struct aws_io_message *message);
```
"""
function s_testing_channel_handler_process_read_message(handler, slot, message)
    ccall((:s_testing_channel_handler_process_read_message, libawscrt), Cint, (Ptr{aws_channel_handler}, Ptr{aws_channel_slot}, Ptr{aws_io_message}), handler, slot, message)
end

"""
    s_testing_channel_handler_process_write_message(handler, slot, message)

### Prototype
```c
static int s_testing_channel_handler_process_write_message( struct aws_channel_handler *handler, struct aws_channel_slot *slot, struct aws_io_message *message);
```
"""
function s_testing_channel_handler_process_write_message(handler, slot, message)
    ccall((:s_testing_channel_handler_process_write_message, libawscrt), Cint, (Ptr{aws_channel_handler}, Ptr{aws_channel_slot}, Ptr{aws_io_message}), handler, slot, message)
end

"""
    s_testing_channel_handler_increment_read_window(handler, slot, size)

### Prototype
```c
static int s_testing_channel_handler_increment_read_window( struct aws_channel_handler *handler, struct aws_channel_slot *slot, size_t size);
```
"""
function s_testing_channel_handler_increment_read_window(handler, slot, size)
    ccall((:s_testing_channel_handler_increment_read_window, libawscrt), Cint, (Ptr{aws_channel_handler}, Ptr{aws_channel_slot}, Csize_t), handler, slot, size)
end

"""
    s_testing_channel_handler_shutdown(handler, slot, dir, error_code, free_scarce_resources_immediately)

### Prototype
```c
static int s_testing_channel_handler_shutdown( struct aws_channel_handler *handler, struct aws_channel_slot *slot, enum aws_channel_direction dir, int error_code, bool free_scarce_resources_immediately);
```
"""
function s_testing_channel_handler_shutdown(handler, slot, dir, error_code, free_scarce_resources_immediately)
    ccall((:s_testing_channel_handler_shutdown, libawscrt), Cint, (Ptr{aws_channel_handler}, Ptr{aws_channel_slot}, aws_channel_direction, Cint, Bool), handler, slot, dir, error_code, free_scarce_resources_immediately)
end

"""
    s_testing_channel_handler_initial_window_size(handler)

### Prototype
```c
static size_t s_testing_channel_handler_initial_window_size(struct aws_channel_handler *handler);
```
"""
function s_testing_channel_handler_initial_window_size(handler)
    ccall((:s_testing_channel_handler_initial_window_size, libawscrt), Csize_t, (Ptr{aws_channel_handler},), handler)
end

"""
    s_testing_channel_handler_message_overhead(handler)

### Prototype
```c
static size_t s_testing_channel_handler_message_overhead(struct aws_channel_handler *handler);
```
"""
function s_testing_channel_handler_message_overhead(handler)
    ccall((:s_testing_channel_handler_message_overhead, libawscrt), Csize_t, (Ptr{aws_channel_handler},), handler)
end

"""
    s_testing_channel_handler_destroy(handler)

### Prototype
```c
static void s_testing_channel_handler_destroy(struct aws_channel_handler *handler);
```
"""
function s_testing_channel_handler_destroy(handler)
    ccall((:s_testing_channel_handler_destroy, libawscrt), Cvoid, (Ptr{aws_channel_handler},), handler)
end

"""
    s_testing_channel_handler_reset_statistics(handler)

### Prototype
```c
static void s_testing_channel_handler_reset_statistics(struct aws_channel_handler *handler);
```
"""
function s_testing_channel_handler_reset_statistics(handler)
    ccall((:s_testing_channel_handler_reset_statistics, libawscrt), Cvoid, (Ptr{aws_channel_handler},), handler)
end

"""
    s_testing_channel_handler_gather_statistics(handler, stats)

### Prototype
```c
static void s_testing_channel_handler_gather_statistics( struct aws_channel_handler *handler, struct aws_array_list *stats);
```
"""
function s_testing_channel_handler_gather_statistics(handler, stats)
    ccall((:s_testing_channel_handler_gather_statistics, libawscrt), Cvoid, (Ptr{aws_channel_handler}, Ptr{aws_array_list}), handler, stats)
end

"""
    s_new_testing_channel_handler(allocator, initial_window)

### Prototype
```c
static struct aws_channel_handler *s_new_testing_channel_handler( struct aws_allocator *allocator, size_t initial_window);
```
"""
function s_new_testing_channel_handler(allocator, initial_window)
    ccall((:s_new_testing_channel_handler, libawscrt), Ptr{aws_channel_handler}, (Ptr{aws_allocator}, Csize_t), allocator, initial_window)
end

struct testing_channel
    loop::Ptr{aws_event_loop}
    loop_impl::Ptr{testing_loop}
    channel::Ptr{aws_channel}
    left_handler_impl::Ptr{testing_channel_handler}
    right_handler_impl::Ptr{testing_channel_handler}
    left_handler_slot::Ptr{aws_channel_slot}
    right_handler_slot::Ptr{aws_channel_slot}
    channel_shutdown::Ptr{Cvoid}
    channel_shutdown_user_data::Ptr{Cvoid}
    channel_setup_completed::Bool
    channel_shutdown_completed::Bool
    channel_shutdown_error_code::Cint
end

"""
    s_testing_channel_on_setup_completed(channel, error_code, user_data)

### Prototype
```c
static void s_testing_channel_on_setup_completed(struct aws_channel *channel, int error_code, void *user_data);
```
"""
function s_testing_channel_on_setup_completed(channel, error_code, user_data)
    ccall((:s_testing_channel_on_setup_completed, libawscrt), Cvoid, (Ptr{aws_channel}, Cint, Ptr{Cvoid}), channel, error_code, user_data)
end

"""
    s_testing_channel_on_shutdown_completed(channel, error_code, user_data)

### Prototype
```c
static void s_testing_channel_on_shutdown_completed(struct aws_channel *channel, int error_code, void *user_data);
```
"""
function s_testing_channel_on_shutdown_completed(channel, error_code, user_data)
    ccall((:s_testing_channel_on_shutdown_completed, libawscrt), Cvoid, (Ptr{aws_channel}, Cint, Ptr{Cvoid}), channel, error_code, user_data)
end

"""
    testing_channel_push_read_message(testing, message)

when you want to test the read path of your handler, call this with the message you want it to read.

### Prototype
```c
static inline int testing_channel_push_read_message(struct testing_channel *testing, struct aws_io_message *message);
```
"""
function testing_channel_push_read_message(testing, message)
    ccall((:testing_channel_push_read_message, libawscrt), Cint, (Ptr{testing_channel}, Ptr{aws_io_message}), testing, message)
end

"""
    testing_channel_push_write_message(testing, message)

when you want to test the write path of your handler, call this with the message you want it to write. A downstream handler must have been installed

### Prototype
```c
static inline int testing_channel_push_write_message(struct testing_channel *testing, struct aws_io_message *message);
```
"""
function testing_channel_push_write_message(testing, message)
    ccall((:testing_channel_push_write_message, libawscrt), Cint, (Ptr{testing_channel}, Ptr{aws_io_message}), testing, message)
end

"""
    testing_channel_get_written_message_queue(testing)

when you want to test the write output of your handler, call this, get the queue and iterate the messages.

### Prototype
```c
static inline struct aws_linked_list *testing_channel_get_written_message_queue(struct testing_channel *testing);
```
"""
function testing_channel_get_written_message_queue(testing)
    ccall((:testing_channel_get_written_message_queue, libawscrt), Ptr{aws_linked_list}, (Ptr{testing_channel},), testing)
end

"""
    testing_channel_complete_written_messages_immediately(testing, complete_immediately, complete_error_code)

Set whether written messages have their on\\_complete callbacks invoked immediately. The on\\_complete callback will be cleared after it is invoked.

### Prototype
```c
static inline void testing_channel_complete_written_messages_immediately( struct testing_channel *testing, bool complete_immediately, int complete_error_code);
```
"""
function testing_channel_complete_written_messages_immediately(testing, complete_immediately, complete_error_code)
    ccall((:testing_channel_complete_written_messages_immediately, libawscrt), Cvoid, (Ptr{testing_channel}, Bool, Cint), testing, complete_immediately, complete_error_code)
end

"""
    testing_channel_get_read_message_queue(testing)

when you want to test the read output of your handler, call this, get the queue and iterate the messages. A downstream handler must have been installed

### Prototype
```c
static inline struct aws_linked_list *testing_channel_get_read_message_queue(struct testing_channel *testing);
```
"""
function testing_channel_get_read_message_queue(testing)
    ccall((:testing_channel_get_read_message_queue, libawscrt), Ptr{aws_linked_list}, (Ptr{testing_channel},), testing)
end

"""
    testing_channel_last_window_update(testing)

When you want to see what the latest window update issues from your channel handler was, call this.

### Prototype
```c
static inline size_t testing_channel_last_window_update(struct testing_channel *testing);
```
"""
function testing_channel_last_window_update(testing)
    ccall((:testing_channel_last_window_update, libawscrt), Csize_t, (Ptr{testing_channel},), testing)
end

"""
    testing_channel_increment_read_window(testing, size)

When you want the downstream handler to issue a window update

### Prototype
```c
static inline int testing_channel_increment_read_window(struct testing_channel *testing, size_t size);
```
"""
function testing_channel_increment_read_window(testing, size)
    ccall((:testing_channel_increment_read_window, libawscrt), Cint, (Ptr{testing_channel}, Csize_t), testing, size)
end

"""
    testing_channel_run_currently_queued_tasks(testing)

Executes all currently scheduled tasks whose time has come. Use [`testing_channel_drain_queued_tasks`](@ref)() to repeatedly run tasks until only future-tasks remain.

### Prototype
```c
static inline void testing_channel_run_currently_queued_tasks(struct testing_channel *testing);
```
"""
function testing_channel_run_currently_queued_tasks(testing)
    ccall((:testing_channel_run_currently_queued_tasks, libawscrt), Cvoid, (Ptr{testing_channel},), testing)
end

"""
    testing_channel_drain_queued_tasks(testing)

Repeatedly executes scheduled tasks until only those in the future remain. This covers the common case where there's a chain reaction of now-tasks scheduling further now-tasks.

### Prototype
```c
static inline void testing_channel_drain_queued_tasks(struct testing_channel *testing);
```
"""
function testing_channel_drain_queued_tasks(testing)
    ccall((:testing_channel_drain_queued_tasks, libawscrt), Cvoid, (Ptr{testing_channel},), testing)
end

"""
    testing_channel_set_is_on_users_thread(testing, on_users_thread)

When you want to force the "not on channel thread path" for your handler, set 'on\\_users\\_thread' to false. when you want to undo that, set it back to true. If you set it to false, you'll need to call 'testing\\_channel\\_execute\\_queued\\_tasks()' to invoke the tasks that ended up being scheduled.

### Prototype
```c
static inline void testing_channel_set_is_on_users_thread(struct testing_channel *testing, bool on_users_thread);
```
"""
function testing_channel_set_is_on_users_thread(testing, on_users_thread)
    ccall((:testing_channel_set_is_on_users_thread, libawscrt), Cvoid, (Ptr{testing_channel}, Bool), testing, on_users_thread)
end

struct aws_testing_channel_options
    clock_fn::Ptr{Cvoid}
end

"""
    testing_channel_init(testing, allocator, options)

### Prototype
```c
static inline int testing_channel_init( struct testing_channel *testing, struct aws_allocator *allocator, struct aws_testing_channel_options *options);
```
"""
function testing_channel_init(testing, allocator, options)
    ccall((:testing_channel_init, libawscrt), Cint, (Ptr{testing_channel}, Ptr{aws_allocator}, Ptr{aws_testing_channel_options}), testing, allocator, options)
end

"""
    testing_channel_clean_up(testing)

### Prototype
```c
static inline int testing_channel_clean_up(struct testing_channel *testing);
```
"""
function testing_channel_clean_up(testing)
    ccall((:testing_channel_clean_up, libawscrt), Cint, (Ptr{testing_channel},), testing)
end

"""
    testing_channel_install_downstream_handler(testing, initial_window)

When you want to test your handler with a downstream handler installed to the right.

### Prototype
```c
static inline int testing_channel_install_downstream_handler(struct testing_channel *testing, size_t initial_window);
```
"""
function testing_channel_install_downstream_handler(testing, initial_window)
    ccall((:testing_channel_install_downstream_handler, libawscrt), Cint, (Ptr{testing_channel}, Csize_t), testing, initial_window)
end

"""
    testing_channel_is_shutdown_completed(testing)

Return whether channel is completely shut down

### Prototype
```c
static inline bool testing_channel_is_shutdown_completed(const struct testing_channel *testing);
```
"""
function testing_channel_is_shutdown_completed(testing)
    ccall((:testing_channel_is_shutdown_completed, libawscrt), Bool, (Ptr{testing_channel},), testing)
end

"""
    testing_channel_get_shutdown_error_code(testing)

Return channel's shutdown error\\_code

### Prototype
```c
static inline int testing_channel_get_shutdown_error_code(const struct testing_channel *testing);
```
"""
function testing_channel_get_shutdown_error_code(testing)
    ccall((:testing_channel_get_shutdown_error_code, libawscrt), Cint, (Ptr{testing_channel},), testing)
end

"""
    testing_channel_set_downstream_handler_shutdown_callback(testing, on_shutdown, user_data)

Set a callback which is invoked during the handler's shutdown, once in the read direction and again in the write direction. Use this to inject actions that might occur in the middle of channel shutdown.

### Prototype
```c
static inline void testing_channel_set_downstream_handler_shutdown_callback( struct testing_channel *testing, testing_channel_handler_on_shutdown_fn *on_shutdown, void *user_data);
```
"""
function testing_channel_set_downstream_handler_shutdown_callback(testing, on_shutdown, user_data)
    ccall((:testing_channel_set_downstream_handler_shutdown_callback, libawscrt), Cvoid, (Ptr{testing_channel}, Ptr{Cvoid}, Ptr{Cvoid}), testing, on_shutdown, user_data)
end

"""
    testing_channel_check_written_message(channel, expected)

### Prototype
```c
static inline int testing_channel_check_written_message( struct testing_channel *channel, struct aws_byte_cursor expected);
```
"""
function testing_channel_check_written_message(channel, expected)
    ccall((:testing_channel_check_written_message, libawscrt), Cint, (Ptr{testing_channel}, aws_byte_cursor), channel, expected)
end

"""
    testing_channel_check_written_message_str(channel, expected)

### Prototype
```c
static inline int testing_channel_check_written_message_str(struct testing_channel *channel, const char *expected);
```
"""
function testing_channel_check_written_message_str(channel, expected)
    ccall((:testing_channel_check_written_message_str, libawscrt), Cint, (Ptr{testing_channel}, Ptr{Cchar}), channel, expected)
end

"""
    testing_channel_drain_messages(msgs, buffer)

### Prototype
```c
static inline int testing_channel_drain_messages(struct aws_linked_list *msgs, struct aws_byte_buf *buffer);
```
"""
function testing_channel_drain_messages(msgs, buffer)
    ccall((:testing_channel_drain_messages, libawscrt), Cint, (Ptr{aws_linked_list}, Ptr{aws_byte_buf}), msgs, buffer)
end

"""
    testing_channel_check_messages_ex(msgs, allocator, expected)

### Prototype
```c
static inline int testing_channel_check_messages_ex( struct aws_linked_list *msgs, struct aws_allocator *allocator, struct aws_byte_cursor expected);
```
"""
function testing_channel_check_messages_ex(msgs, allocator, expected)
    ccall((:testing_channel_check_messages_ex, libawscrt), Cint, (Ptr{aws_linked_list}, Ptr{aws_allocator}, aws_byte_cursor), msgs, allocator, expected)
end

"""
    testing_channel_check_written_messages(channel, allocator, expected)

### Prototype
```c
static inline int testing_channel_check_written_messages( struct testing_channel *channel, struct aws_allocator *allocator, struct aws_byte_cursor expected);
```
"""
function testing_channel_check_written_messages(channel, allocator, expected)
    ccall((:testing_channel_check_written_messages, libawscrt), Cint, (Ptr{testing_channel}, Ptr{aws_allocator}, aws_byte_cursor), channel, allocator, expected)
end

"""
    testing_channel_check_written_messages_str(channel, allocator, expected)

### Prototype
```c
static inline int testing_channel_check_written_messages_str( struct testing_channel *channel, struct aws_allocator *allocator, const char *expected);
```
"""
function testing_channel_check_written_messages_str(channel, allocator, expected)
    ccall((:testing_channel_check_written_messages_str, libawscrt), Cint, (Ptr{testing_channel}, Ptr{aws_allocator}, Ptr{Cchar}), channel, allocator, expected)
end

"""
    testing_channel_drain_written_messages(channel, output)

### Prototype
```c
static inline int testing_channel_drain_written_messages(struct testing_channel *channel, struct aws_byte_buf *output);
```
"""
function testing_channel_drain_written_messages(channel, output)
    ccall((:testing_channel_drain_written_messages, libawscrt), Cint, (Ptr{testing_channel}, Ptr{aws_byte_buf}), channel, output)
end

"""
    testing_channel_check_midchannel_read_messages(channel, allocator, expected)

### Prototype
```c
static inline int testing_channel_check_midchannel_read_messages( struct testing_channel *channel, struct aws_allocator *allocator, struct aws_byte_cursor expected);
```
"""
function testing_channel_check_midchannel_read_messages(channel, allocator, expected)
    ccall((:testing_channel_check_midchannel_read_messages, libawscrt), Cint, (Ptr{testing_channel}, Ptr{aws_allocator}, aws_byte_cursor), channel, allocator, expected)
end

"""
    testing_channel_check_midchannel_read_messages_str(channel, allocator, expected)

### Prototype
```c
static inline int testing_channel_check_midchannel_read_messages_str( struct testing_channel *channel, struct aws_allocator *allocator, const char *expected);
```
"""
function testing_channel_check_midchannel_read_messages_str(channel, allocator, expected)
    ccall((:testing_channel_check_midchannel_read_messages_str, libawscrt), Cint, (Ptr{testing_channel}, Ptr{aws_allocator}, Ptr{Cchar}), channel, allocator, expected)
end

"""
    testing_channel_send_data(channel, data, dir, ignore_send_message_errors)

### Prototype
```c
static inline int testing_channel_send_data( struct testing_channel *channel, struct aws_byte_cursor data, enum aws_channel_direction dir, bool ignore_send_message_errors);
```
"""
function testing_channel_send_data(channel, data, dir, ignore_send_message_errors)
    ccall((:testing_channel_send_data, libawscrt), Cint, (Ptr{testing_channel}, aws_byte_cursor, aws_channel_direction, Bool), channel, data, dir, ignore_send_message_errors)
end

"""
    testing_channel_push_read_data(channel, data)

Create an [`aws_io_message`](@ref), containing the following data, and pushes it up the channel in the read direction

### Prototype
```c
static inline int testing_channel_push_read_data(struct testing_channel *channel, struct aws_byte_cursor data);
```
"""
function testing_channel_push_read_data(channel, data)
    ccall((:testing_channel_push_read_data, libawscrt), Cint, (Ptr{testing_channel}, aws_byte_cursor), channel, data)
end

"""
    testing_channel_push_read_str(channel, str)

Create an [`aws_io_message`](@ref), containing the following data, and pushes it up the channel in the read direction

### Prototype
```c
static inline int testing_channel_push_read_str(struct testing_channel *channel, const char *str);
```
"""
function testing_channel_push_read_str(channel, str)
    ccall((:testing_channel_push_read_str, libawscrt), Cint, (Ptr{testing_channel}, Ptr{Cchar}), channel, str)
end

"""
    testing_channel_push_read_str_ignore_errors(channel, str)

Create an [`aws_io_message`](@ref), containing the following data. Tries to push it up the channel in the read direction, but don't assert if the message can't be sent. Useful for testing data that arrives during handler shutdown

### Prototype
```c
static inline int testing_channel_push_read_str_ignore_errors(struct testing_channel *channel, const char *str);
```
"""
function testing_channel_push_read_str_ignore_errors(channel, str)
    ccall((:testing_channel_push_read_str_ignore_errors, libawscrt), Cint, (Ptr{testing_channel}, Ptr{Cchar}), channel, str)
end

"""
    testing_channel_push_write_data(channel, data)

Create an [`aws_io_message`](@ref), containing the following data, and pushes it up the channel in the write direction

### Prototype
```c
static inline int testing_channel_push_write_data(struct testing_channel *channel, struct aws_byte_cursor data);
```
"""
function testing_channel_push_write_data(channel, data)
    ccall((:testing_channel_push_write_data, libawscrt), Cint, (Ptr{testing_channel}, aws_byte_cursor), channel, data)
end

"""
    testing_channel_push_write_str(channel, str)

Create an [`aws_io_message`](@ref), containing the following data, and pushes it up the channel in the write direction

### Prototype
```c
static inline int testing_channel_push_write_str(struct testing_channel *channel, const char *str);
```
"""
function testing_channel_push_write_str(channel, str)
    ccall((:testing_channel_push_write_str, libawscrt), Cint, (Ptr{testing_channel}, Ptr{Cchar}), channel, str)
end

struct var"##Ctag#5861"
    __lock::Cint
    __futex::Cuint
    __total_seq::Culonglong
    __wakeup_seq::Culonglong
    __woken_seq::Culonglong
    __mutex::Ptr{Cvoid}
    __nwaiters::Cuint
    __broadcast_seq::Cuint
end
function Base.getproperty(x::Ptr{var"##Ctag#5861"}, f::Symbol)
    f === :__lock && return Ptr{Cint}(x + 0)
    f === :__futex && return Ptr{Cuint}(x + 4)
    f === :__total_seq && return Ptr{Culonglong}(x + 8)
    f === :__wakeup_seq && return Ptr{Culonglong}(x + 16)
    f === :__woken_seq && return Ptr{Culonglong}(x + 24)
    f === :__mutex && return Ptr{Ptr{Cvoid}}(x + 32)
    f === :__nwaiters && return Ptr{Cuint}(x + 40)
    f === :__broadcast_seq && return Ptr{Cuint}(x + 44)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#5861", f::Symbol)
    r = Ref{var"##Ctag#5861"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#5861"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#5861"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#5863"
    __lock::Cint
    __nr_readers::Cuint
    __readers_wakeup::Cuint
    __writer_wakeup::Cuint
    __nr_readers_queued::Cuint
    __nr_writers_queued::Cuint
    __writer::Cint
    __shared::Cint
    __pad1::Culong
    __pad2::Culong
    __flags::Cuint
end
function Base.getproperty(x::Ptr{var"##Ctag#5863"}, f::Symbol)
    f === :__lock && return Ptr{Cint}(x + 0)
    f === :__nr_readers && return Ptr{Cuint}(x + 4)
    f === :__readers_wakeup && return Ptr{Cuint}(x + 8)
    f === :__writer_wakeup && return Ptr{Cuint}(x + 12)
    f === :__nr_readers_queued && return Ptr{Cuint}(x + 16)
    f === :__nr_writers_queued && return Ptr{Cuint}(x + 20)
    f === :__writer && return Ptr{Cint}(x + 24)
    f === :__shared && return Ptr{Cint}(x + 28)
    f === :__pad1 && return Ptr{Culong}(x + 32)
    f === :__pad2 && return Ptr{Culong}(x + 40)
    f === :__flags && return Ptr{Cuint}(x + 48)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#5863", f::Symbol)
    r = Ref{var"##Ctag#5863"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#5863"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#5863"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct __pthread_mutex_s
    __lock::Cint
    __count::Cuint
    __owner::Cint
    __nusers::Cuint
    __kind::Cint
    __spins::Cint
    __list::__pthread_list_t
end

struct var"##Ctag#5943"
    si_pid::__pid_t
    si_uid::__uid_t
end
function Base.getproperty(x::Ptr{var"##Ctag#5943"}, f::Symbol)
    f === :si_pid && return Ptr{__pid_t}(x + 0)
    f === :si_uid && return Ptr{__uid_t}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#5943", f::Symbol)
    r = Ref{var"##Ctag#5943"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#5943"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#5943"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#5944"
    si_tid::Cint
    si_overrun::Cint
    si_sigval::sigval_t
end
function Base.getproperty(x::Ptr{var"##Ctag#5944"}, f::Symbol)
    f === :si_tid && return Ptr{Cint}(x + 0)
    f === :si_overrun && return Ptr{Cint}(x + 4)
    f === :si_sigval && return Ptr{sigval_t}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#5944", f::Symbol)
    r = Ref{var"##Ctag#5944"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#5944"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#5944"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#5945"
    si_pid::__pid_t
    si_uid::__uid_t
    si_sigval::sigval_t
end
function Base.getproperty(x::Ptr{var"##Ctag#5945"}, f::Symbol)
    f === :si_pid && return Ptr{__pid_t}(x + 0)
    f === :si_uid && return Ptr{__uid_t}(x + 4)
    f === :si_sigval && return Ptr{sigval_t}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#5945", f::Symbol)
    r = Ref{var"##Ctag#5945"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#5945"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#5945"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#5946"
    si_pid::__pid_t
    si_uid::__uid_t
    si_status::Cint
    si_utime::__clock_t
    si_stime::__clock_t
end
function Base.getproperty(x::Ptr{var"##Ctag#5946"}, f::Symbol)
    f === :si_pid && return Ptr{__pid_t}(x + 0)
    f === :si_uid && return Ptr{__uid_t}(x + 4)
    f === :si_status && return Ptr{Cint}(x + 8)
    f === :si_utime && return Ptr{__clock_t}(x + 16)
    f === :si_stime && return Ptr{__clock_t}(x + 24)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#5946", f::Symbol)
    r = Ref{var"##Ctag#5946"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#5946"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#5946"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#5947"
    si_addr::Ptr{Cvoid}
end
function Base.getproperty(x::Ptr{var"##Ctag#5947"}, f::Symbol)
    f === :si_addr && return Ptr{Ptr{Cvoid}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#5947", f::Symbol)
    r = Ref{var"##Ctag#5947"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#5947"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#5947"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#5948"
    si_band::Clong
    si_fd::Cint
end
function Base.getproperty(x::Ptr{var"##Ctag#5948"}, f::Symbol)
    f === :si_band && return Ptr{Clong}(x + 0)
    f === :si_fd && return Ptr{Cint}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#5948", f::Symbol)
    r = Ref{var"##Ctag#5948"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#5948"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#5948"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


const AWS_C_AUTH_PACKAGE_ID = 6

const AWS_C_CAL_PACKAGE_ID = 7

const AWS_SHA256_LEN = 32

const AWS_SHA1_LEN = 20

const AWS_MD5_LEN = 16

const AWS_SHA256_HMAC_LEN = 32

const AWS_ARRAY_LIST_DEBUG_FILL = 0xdd

const AWS_OP_SUCCESS = 0

const AWS_BUS_ADDRESS_CLOSE = 0

# Skipping MacroDefinition: AWS_CONDITION_VARIABLE_INIT { . condition_handle = PTHREAD_COND_INITIALIZER , . initialized = true }

const AWS_DATE_TIME_STR_MAX_LEN = 100

const AWS_DATE_TIME_STR_MAX_BASIC_LEN = 20

const AWS_OP_ERR = -1

const AWS_ERROR_ENUM_STRIDE_BITS = 10

const AWS_ERROR_ENUM_STRIDE = Cuint(1) << AWS_ERROR_ENUM_STRIDE_BITS

# Skipping MacroDefinition: AWS_STATIC_IMPL static inline

const AWS_PATH_DELIM = Cchar('/')

const AWS_PATH_DELIM_STR = "/"

const AWS_COMMON_HASH_TABLE_ITER_CONTINUE = 1 << 0

const AWS_COMMON_HASH_TABLE_ITER_DELETE = 1 << 1

const AWS_COMMON_HASH_TABLE_ITER_ERROR = 1 << 2

const AWS_LOG_LEVEL_NONE = 0

const AWS_LOG_LEVEL_FATAL = 1

const AWS_LOG_LEVEL_ERROR = 2

const AWS_LOG_LEVEL_WARN = 3

const AWS_LOG_LEVEL_INFO = 4

const AWS_LOG_LEVEL_DEBUG = 5

const AWS_LOG_LEVEL_TRACE = 6

const AWS_LOG_SUBJECT_STRIDE_BITS = 10

const AWS_LOG_SUBJECT_STRIDE = Cuint(1) << AWS_LOG_SUBJECT_STRIDE_BITS

const AWS_CACHE_LINE = 64

const PRInSTR = "%.*s"

# Skipping MacroDefinition: AWS_FORCE_INLINE __attribute__ ( ( always_inline ) )

# Skipping MacroDefinition: AWS_NO_INLINE __attribute__ ( ( noinline ) )

# Skipping MacroDefinition: AWS_ATTRIBUTE_NORETURN __attribute__ ( ( noreturn ) )

const SIZE_BITS = 64

# Skipping MacroDefinition: AWS_MUTEX_INIT { . mutex_handle = PTHREAD_MUTEX_INITIALIZER , . initialized = true }

const AWS_PACKAGE_SLOTS = 16

const AWS_C_COMMON_PACKAGE_ID = 0

# Skipping MacroDefinition: AWS_RW_LOCK_INIT { . lock_handle = PTHREAD_RWLOCK_INITIALIZER }

const AWS_CRT_STATISTICS_CATEGORY_STRIDE_BITS = 8

const AWS_CRT_STATISTICS_CATEGORY_STRIDE = Cuint(1) << AWS_CRT_STATISTICS_CATEGORY_STRIDE_BITS

# Skipping MacroDefinition: AWS_THREAD_ID_T_REPR_BUFSZ ( sizeof ( aws_thread_id_t ) * 2 + 1 )

const AWS_UUID_STR_LEN = 37

const AWS_C_COMPRESSION_PACKAGE_ID = 3

const AWS_HTTP2_DEFAULT_MAX_CLOSED_STREAMS = 32

const AWS_HTTP2_PING_DATA_SIZE = 8

const AWS_HTTP2_SETTINGS_COUNT = 6

# Skipping MacroDefinition: AWS_HTTP_CLIENT_CONNECTION_OPTIONS_INIT { . self_size = sizeof ( struct aws_http_client_connection_options ) , . initial_window_size = SIZE_MAX , }

const AWS_C_HTTP_PACKAGE_ID = 2

# Skipping MacroDefinition: AWS_HTTP_REQUEST_HANDLER_OPTIONS_INIT { . self_size = sizeof ( struct aws_http_request_handler_options ) , }

# Skipping MacroDefinition: AWS_HTTP_SERVER_OPTIONS_INIT { . self_size = sizeof ( struct aws_http_server_options ) , . initial_window_size = SIZE_MAX , }

# Skipping MacroDefinition: AWS_HTTP_SERVER_CONNECTION_OPTIONS_INIT { . self_size = sizeof ( struct aws_http_server_connection_options ) , }

const AWS_WEBSOCKET_MAX_PAYLOAD_LENGTH = 0x7fffffffffffffff

const AWS_WEBSOCKET_MAX_HANDSHAKE_KEY_LENGTH = 25

const AWS_WEBSOCKET_CLOSE_TIMEOUT = 1000000000

const AWS_C_IO_PACKAGE_ID = 1

const aws_pcks11_lib_behavior = aws_pkcs11_lib_behavior

# Skipping MacroDefinition: AWS_ADDRESS_MAX_LEN sizeof ( ( ( struct sockaddr_un * ) 0 ) -> sun_path )

const AWS_C_IOTDEVICE_PACKAGE_ID = 13

const AWS_IOT_ST_SPLIT_MESSAGE_SIZE = 15000

const aws_secure_tunneling_connection_config = aws_secure_tunnel_options

const AWS_C_MQTT_PACKAGE_ID = 5

const AWS_C_S3_PACKAGE_ID = 14

const AWS_C_SDKUTILS_PACKAGE_ID = 15

const AWS_TESTING_REPORT_FD = stderr

const FAIL_PREFIX = "***FAILURE*** "

const SUCCESS = 0

const FAILURE = -1

