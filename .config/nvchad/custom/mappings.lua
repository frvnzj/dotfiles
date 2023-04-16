local M = {}

M.abc = {
  n = {
    ["<leader>z"] = { "<cmd>!opout '%:p'<CR>", "Zathura" },
    ["<leader>ml"] = { "<cmd>!latexmk -pdf %<CR>", "LaTeX" },
    ["<leader>mp"] = { "<cmd>!compiler '%:p'<CR>", "Pandoc" },
    ["<leader>o"] = { "<cmd>vsp ~/bib/refs.bib<CR>", "Bibliography"},
  }
}

return M
