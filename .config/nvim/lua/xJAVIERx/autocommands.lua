vim.api.nvim_create_autocmd(
    "VimLeave",
    {
        pattern = { "*.tex" },
        command = "!texclear %"
    }
)
