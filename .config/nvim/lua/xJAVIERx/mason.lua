local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>lI"] = { "<cmd>Mason<cr>", "Mason" },
  }

  local servers = {
    "astro",
    "bashls",
    "cssls",
    "html",
    "tsserver",
    "texlab",
    "lua_ls",
    "tailwindcss",
  }

  require("mason").setup {
    ui = {
      border = "rounded",
    },
  }

  require("mason-lspconfig").setup {
    ensure_istalled = servers,
  }
end

return M
