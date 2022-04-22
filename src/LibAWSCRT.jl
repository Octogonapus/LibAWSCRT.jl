module LibAWSCRT

using AWSCRT_jll
export AWSCRT_jll

const IS_LIBC_MUSL = occursin("musl", Base.BUILD_TRIPLET)
if Sys.isapple() && Sys.ARCH === :aarch64
    include("../lib/aarch64-apple-darwin20.jl")
elseif Sys.islinux() && Sys.ARCH === :aarch64 && !IS_LIBC_MUSL
    include("../lib/aarch64-linux-gnu.jl")
elseif Sys.islinux() && Sys.ARCH === :aarch64 && IS_LIBC_MUSL
    include("../lib/aarch64-linux-musl.jl")
elseif Sys.islinux() && startswith(string(Sys.ARCH), "arm") && !IS_LIBC_MUSL
    include("../lib/armv7l-linux-gnueabihf.jl")
elseif Sys.islinux() && startswith(string(Sys.ARCH), "arm") && IS_LIBC_MUSL
    include("../lib/armv7l-linux-musleabihf.jl")
elseif Sys.islinux() && Sys.ARCH === :i686 && !IS_LIBC_MUSL
    include("../lib/i686-linux-gnu.jl")
elseif Sys.islinux() && Sys.ARCH === :i686 && IS_LIBC_MUSL
    include("../lib/i686-linux-musl.jl")
elseif Sys.islinux() && Sys.ARCH === :powerpc64le
    include("../lib/powerpc64le-linux-gnu.jl")
elseif Sys.isapple() && Sys.ARCH === :x86_64
    include("../lib/x86_64-apple-darwin14.jl")
elseif Sys.islinux() && Sys.ARCH === :x86_64 && !IS_LIBC_MUSL
    include("../lib/x86_64-linux-gnu.jl")
elseif Sys.islinux() && Sys.ARCH === :x86_64 && IS_LIBC_MUSL
    include("../lib/x86_64-linux-musl.jl")
elseif Sys.isbsd() && !Sys.isapple()
    error("AWSCRT_jll does not support BSD: $(Base.BUILD_TRIPLET)")
elseif Sys.iswindows()
    error("AWSCRT_jll does not support windows: $(Base.BUILD_TRIPLET)")
else
    error("Unknown platform: $(Base.BUILD_TRIPLET)")
end

# exports
const PREFIXES = ["aws_", "AWS_"]
for name in names(@__MODULE__; all=true), prefix in PREFIXES
    if startswith(string(name), prefix)
        @eval export $name
    end
end

end # module
