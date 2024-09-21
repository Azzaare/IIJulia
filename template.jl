# Template for creating a new package for IIJulia
using PkgTemplates

t = Template(;
    # User Options
    user = "Azzaare", # Need to be updated to IIJ research lab
    authors = ["Jean-François BAFFIER (@Azzaare)"],

    # Package Options
    julia = v"1.10",

    # Plugins
    plugins = [
        #NOTE - Could be switch to v"1.0.0-DEV" once the organization is created
        ProjectFile(; version = v"0.0.1"),

        #NOTE - Check the module.jl file in the same directory
        SrcDir(; file = joinpath(@__DIR__, "module.jl")),

        #NOTE - Aqua keywords might need to be added
        Tests(; aqua = true, jet = true),

        #NOTE - LICENSE is temporary
        License(; name = "MIT"
        ),

        #NOTE - Git config
        Git(;
            ignore = [
                ".gitignore",
                ".vscode/*",
                ".DS_Store",
                "Manifest.toml",
            ],
            # gpgsign = true,
        ),

        #NOTE - Move to self-hosted CI
        GitHubActions(;
            osx = true,
            windows = true,
            linux = true,
            x64 = true,
            x86 = true,
            extra_versions = ["lts", "1", "pre"],
            coverage = true,
        ),

        #NOTE - Need to be updated to IIJ research lab
        CompatHelper(),

        #NOTE - Need to be updated to Cirrus-gaming once the organization is created
        TagBot(;
            registry = "Azzaare/IIJulia",
        ),

        #NOTE - Signal actions updates
        Dependabot(),

        #NOTE - Codecov
        PkgTemplates.Codecov(),

        #NOTE - Dev the package
        Develop(),

        #NOTE - JuliaFormatter
        Formatter(;
            file = joinpath(@__DIR__, ".JuliaFormatter.toml")
        ),
    ],
)
