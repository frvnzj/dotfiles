return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            transparent_background = true,
            integrations = {
                mason = true,
                mini = true,
                neotree = true,
                telescope = {
                    enabled = true,
                    style = "nvchad"
                },
                which_key = true
            }
        })

        vim.cmd [[colorscheme catppuccin]]
    end
}
