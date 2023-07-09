return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        signs = {
            add = { text = "▎" },
            change = { text = "▎" },
            delete = { text = "" },
            topdelete = { text = "" },
            changedelete = { text = "▎" },
            untracked = { text = "▎" },
        },
        on_attach = function(bufnr)
            vim.keymap.set('n', '<leader>pp', require('gitsigns').prev_hunk,
                { buffer = bufnr, desc = 'Go to Previous Hunk' })
            vim.keymap.set('n', '<leader>pn', require('gitsigns').next_hunk,
                { buffer = bufnr, desc = 'Go to Next Hunk' })
            vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk,
                { buffer = bufnr, desc = 'Preview Hunk' })
        end,
    },
}
