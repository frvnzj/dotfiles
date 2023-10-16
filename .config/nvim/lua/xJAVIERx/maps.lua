vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<cr>", { silent = true, desc = "chmod +x" })
vim.keymap.set("n", "<leader>m", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "Reemplazar palabra" })

vim.keymap.set("n", "<leader>ne", ":Neorg export to-file ~/Neorg/markdown/", { desc = "Export" })

vim.keymap.set("n", "<leader>wm", ":!sed -i '1i---\\nfontfamily: imfellEnglish\\nfontsize: 12pt\\ngeometry:\\n    - margin=2.5cm\\n---\\n' %<cr>", { silent = true, desc = "MetaMD" })

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-j>", "<C-w>j")

vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")

vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("i", "<A-j>", "<esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<esc>:m .-2<CR>==gi")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<A-3>", "<cmd>ToggleTerm direction=float<cr>")
vim.keymap.set("t", "<A-3>", "<cmd>ToggleTerm direction=float<cr>")
