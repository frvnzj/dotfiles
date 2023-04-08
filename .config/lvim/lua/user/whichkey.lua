lvim.builtin.which_key.mappings["z"] = { "<cmd>!opout '%:p'<CR>", "Zathura" }

lvim.builtin.which_key.mappings["m"] = {
  name = "+Compilar",
  l = { "<cmd>!latexmk -pdf %<CR>", "LaTeX" },
  p = { "<cmd>!compiler '%:p'<CR>", "Pandoc"}
}

lvim.builtin.which_key.mappings["o"] = { "<cmd>vsp ~/bib/refs.bib<CR>", "Bibliography"}

lvim.builtin.which_key.mappings["x"] = { "<cmd>!chmod +x %<CR>", "cmx" }
