local M = {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

function M.config()
  local null_ls = require "null-ls"

  local code_actions = null_ls.builtins.code_actions
  local completion = null_ls.builtins.completion
  local diagnostics = null_ls.builtins.diagnostics
  local formatting = null_ls.builtins.formatting

  null_ls.setup {
    sources = {
      code_actions.eslint_d,
      code_actions.shellcheck,
      completion.luasnip,
      completion.spell,
      diagnostics.eslint_d,
      diagnostics.flake8,
      diagnostics.shellcheck,
      diagnostics.textidote.with {
        args = { "--read-all", "--output", "singleline", "--no-color", "--check", "es", "--quiet", "$FILENAME" },
      },
      formatting.bibclean,
      formatting.eslint_d,
      formatting.latexindent,
      formatting.prettierd,
      formatting.shfmt,
      formatting.stylua,
      formatting.typstfmt,
    },
  }
end

return M
