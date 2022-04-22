using LibAWSCRT
using Documenter

DocMeta.setdocmeta!(LibAWSCRT, :DocTestSetup, :(using LibAWSCRT); recursive=true)

makedocs(;
    modules=[LibAWSCRT],
    authors="Octogonapus <firey45@gmail.com> and contributors",
    repo="https://github.com/Octogonapus/LibAWSCRT.jl/blob/{commit}{path}#{line}",
    sitename="LibAWSCRT.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://Octogonapus.github.io/LibAWSCRT.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/Octogonapus/LibAWSCRT.jl",
    devbranch="main",
)
