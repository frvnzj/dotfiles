local M = {
  "folke/which-key.nvim",
}

function M.config()
  local mappings = {
    ["|"] = { "<cmd>vs<cr>", "VSplit" },

    ["-"] = { "<C-w>|", "MaxWidth" },

    ["_"] = { "<C-w>=", "EqualWidth" },

    b = { name = "Buffers"},

    f = { name = "Telescope"},

    g = { name = "Git" },

    l = { name = "LSP" },

    w = { name = "Writer" },
  }

  local which_key = require "which-key"

  which_key.setup {
    window = {
      border = "single",
    },
  }

  local opts = {
    mode = "n",
    prefix = "<leader>",
  }

  which_key.register(mappings, opts)
end

return M
