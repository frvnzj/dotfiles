return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
        'JoosepAlviste/nvim-ts-context-commentstring',
    },
}
