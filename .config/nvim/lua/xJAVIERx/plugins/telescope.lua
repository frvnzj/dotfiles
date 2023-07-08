return {
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "nvim-telescope/telescope-bibtex.nvim",
        config = function()
            require "telescope".load_extension("bibtex")
        end,
    }
}
