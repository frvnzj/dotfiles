vim.api.nvim_create_autocmd(
    "BufEnter",
    {
        pattern = { "*.tex", "*.md", "*.typ", "*.txt" },
        command = "set textwidth=60"
    }
)

vim.api.nvim_create_autocmd(
    "VimLeave",
    {
        pattern = { "*.tex" },
        command = "!texclear %"
    }
)
