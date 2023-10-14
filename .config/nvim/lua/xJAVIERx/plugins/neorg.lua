return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    opts = {
        load = {
            ["core.defaults"] = {},
            ["core.concealer"] = {},
            ["core.completion"] = {
                config = {
                    engine = "nvim-cmp",
                },
            },
            ["core.dirman"] = {
                config = {
                    workspaces = {
                        notes = "~/Neorg/notas",
                    },
                    default_workspace = "notes",
                },
            },
            ["core.export"] = {},
        },
    },
}
