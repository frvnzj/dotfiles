local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<leader>x", "<cmd>!chmod +x %<cr>", { noremap = true, silent = true, desc = "cmx" })
keymap(
  "n",
  "<leader>i",
  ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
  { noremap = true, desc = "RempPalabra" }
)

keymap("n", "<Tab>", "<cmd>bn<cr>", opts)
keymap("n", "<S-Tab>", "<cmd>bp<cr>", opts)

keymap("n", "<leader>ne", ":Neorg export to-file ~/Neorg/markdown/", { noremap = true, silent = true, desc = "Export" })

keymap("n", "<leader>wa", "<cmd>!latexmk -pdf %<cr>", { noremap = true, silent = true, desc = "LaTeXmk" })
keymap("n", "<leader>wb", "<cmd>vsp ~/Documentos/bib/refs.bib<cr>", { noremap = true, silent = true, desc = "BibFile" })
keymap("n", "<leader>wc", "<cmd>!compiler '%:p'<cr>", { noremap = true, silent = true, desc = "Compiler" })
keymap("n", "<leader>wd", "<cmd>!latexdoc.sh<cr>", { noremap = true, silent = true, desc = "LaTeX Docs" })
keymap("n", "<leader>ws", "<cmd>setlocal spell!<cr>", { noremap = true, silent = true, desc = "Corrector" })
keymap("n", "<leader>wt", "<cmd>!typst -c %<cr>", { noremap = true, silent = true, desc = "Typst" })
keymap("n", "<leader>wz", "<cmd>!opout '%:p'<cr>", { noremap = true, silent = true, desc = "Zathura" })
keymap(
  "n",
  "<leader>wm",
  ":!sed -i '1i---\\nfontfamily: imfellEnglish\\nfontsize: 12pt\\ngeometry:\\n    - margin=2.5cm\\n---\\n' %<cr>",
  { noremap = true, silent = true, desc = "metaMark" }
)

keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-j>", "<C-w>j", opts)

keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)

keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("i", "<A-j>", "<esc>:m .+1<CR>==gi", opts)
keymap("i", "<A-k>", "<esc>:m .-2<CR>==gi", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("n", "J", "mzJ`z", opts)
-- keymap("n", "<C-d>", "<C-d>zz")
-- keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

keymap("x", "<leader>p", [["_dP]])
