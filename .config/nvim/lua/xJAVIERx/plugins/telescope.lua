return {
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            defaults = {
                layout_config = {
                    horizontal = {
                        prompt_position = 'top'
                    }
                }
            }
        }
    },
    {
        "nvim-telescope/telescope-bibtex.nvim",
        config = function()
            require "telescope".load_extension("bibtex")
        end,
    },
    {
        'stevearc/dressing.nvim',
        opts = {},
    }
}
