vim.opt.cmdheight = 0
vim.opt.relativenumber = true
vim.opt.showtabline = 0

vim.api.nvim_create_autocmd("VimLeave", { pattern = { "*.tex" }, command = "!texclear %", })
vim.api.nvim_create_autocmd("BufEnter", { pattern = { "*.tex", "*.md" }, command = "set textwidth=55", })
