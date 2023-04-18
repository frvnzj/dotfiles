vim.api.nvim_create_autocmd("VimLeave", {pattern = { "*.tex" }, command = "!texclear %",})

vim.api.nvim_create_autocmd("BufEnter", {pattern = { "*.tex", "*.md" }, command = "set textwidth=55",})
