local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

lspconfig.astro.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"astro"},
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
}

lspconfig.bashls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"sh"},
}

lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.rust_analyzer.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"rust"},
  root_dir = lspconfig.util.root_pattern("Cargo.toml"),
}

lspconfig.tailwindcss.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "astro", "astro-markdown", "html", "markdown", "css", "javascript", "javascriptreact", "typescript", "typescriptreact"},
  root_dir = lspconfig.util.root_pattern('tailwind.config.js', 'tailwind.config.ts', 'postcss.config.js', 'postcss.config.ts', 'package.json', 'node_modules', '.git'),
}

lspconfig.texlab.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"tex", "bib"},
}

lspconfig.tsserver.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
}
