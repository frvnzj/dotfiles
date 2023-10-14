return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
        transparent_background = true,
        integrations = {
            mason = true,
            mini = true,
            telescope = {
                enabled = true,
                style = "nvchad"
            },
            which_key = true
        }
    }
}
