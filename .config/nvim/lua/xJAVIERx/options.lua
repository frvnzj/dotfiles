vim.cmd[[colorscheme catppuccin]]

vim.o.clipboard = "unnamedplus"

vim.o.nu = true
vim.o.relativenumber = true
vim.o.smd = false

vim.o.spelllang = "es_mx"

vim.o.title = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.bri = true
vim.o.smartindent = true

vim.o.wrap = false

vim.o.swapfile = false
vim.o.backup = false

vim.o.udir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.ignorecase = true

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.tgc = true

vim.o.scrolloff = 8
vim.o.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.o.updatetime = 100
vim.o.cot = 'menuone,noselect'

vim.o.laststatus = 3

vim.o.conceallevel = 3
