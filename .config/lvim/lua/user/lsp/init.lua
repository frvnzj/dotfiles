vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "typst-lsp" })

require("lvim.lsp.manager").setup("typst_lsp", {
  cmd = { "typst-lsp" },
  filetypes = { "typst" },
  root_dir = require'lspconfig'.util.root_pattern('*.typ'),
})

vim.filetype.add({ extension = {typ = "typst"}})
