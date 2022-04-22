using Clang.Generators
using Clang.JLLEnvs
using AWSCRT_jll

cd(@__DIR__)

include_dir = normpath(AWSCRT_jll.artifact_dir, "include")

for target in JLLEnvs.JLL_ENV_TRIPLES
    options = load_options(joinpath(@__DIR__, "generator.toml"))
    options["general"]["output_file_path"] = joinpath(@__DIR__, "..", "lib", "$target.jl")

    # add compiler flags, e.g. "-DXXXXXXXXX"
    args = get_default_args()  # Note you must call this function firstly and then append your own flags
    push!(args, "-I$include_dir")

    header_dirs = vcat([
        readdir(joinpath(include_dir, "aws", "auth"); join = true),
        readdir(joinpath(include_dir, "aws", "cal"); join = true),
        readdir(joinpath(include_dir, "aws", "checksums"); join = true),
        readdir(joinpath(include_dir, "aws", "common"); join = true),
        readdir(joinpath(include_dir, "aws", "compression"); join = true),
        readdir(joinpath(include_dir, "aws", "http"); join = true),
        readdir(joinpath(include_dir, "aws", "io"); join = true),
        readdir(joinpath(include_dir, "aws", "iotdevice"); join = true),
        readdir(joinpath(include_dir, "aws", "mqtt"); join = true),
        readdir(joinpath(include_dir, "aws", "s3"); join = true),
        readdir(joinpath(include_dir, "aws", "sdkutils"); join = true),
        readdir(joinpath(include_dir, "aws", "testing"); join = true),
    ]...)
    headers = [header for header in header_dirs if endswith(header, ".h")]

    # create context
    ctx = create_context(headers, args, options)

    # run generator
    build!(ctx)
end
