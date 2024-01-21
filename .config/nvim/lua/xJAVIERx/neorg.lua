local M = {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  dependencies = {
    "max397574/neorg-contexts",
  },
  event = "VeryLazy",
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>n"] = {
      name = "Neorg",
      i = { "<cmd>Neorg index<cr>", "Index" },
      j = { "<cmd>Neorg journal today<cr>", "Journal" },
      m = { "<cmd>Neorg inject-metadata<cr>", "Metadata" },
    },
  }

  require("neorg").setup {
    load = {
      ["core.defaults"] = {},
      ["core.keybinds"] = {
        config = {
          neorg_leader = ";"
        },
      },
      ["core.concealer"] = {},
      ["core.completion"] = {
        config = {
          engine = "nvim-cmp",
        },
      },
      ["core.dirman"] = {
        config = {
          workspaces = {
            notes = "~/Neorg/notas",
          },
          default_workspace = "notes",
        },
      },
      ["core.export"] = {},
      ["external.context"] = {},
    },
  }
end

return M
