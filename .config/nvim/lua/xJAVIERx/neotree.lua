local M = {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>e"] = { { "<cmd>Neotree toggle<cr>", "NeoTree" } },
  }

  local icons = require "xJAVIERx.icons"

  require("neo-tree").setup {
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    default_component_configs = {
      icon = {
        folder_closed = icons.ui.Folder,
        folder_open = icons.ui.FolderOpen,
        folder_empty = icons.ui.EmptyFolder,
        -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
        -- then these will never be used.
        default = "*",
        highlight = "NeoTreeFileIcon",
      },
      modified = {
        symbol = icons.ui.Circle,
        highlight = "NeoTreeModified",
      },
      name = {
        trailing_slash = false,
        use_git_status_colors = true,
        highlight = "NeoTreeFileName",
      },
      git_status = {
        symbols = {
          -- Change type
          added = icons.git.LineAdded, -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified = icons.git.LineModified, -- or "", but this is redundant info if you use git_status_colors on the name
          deleted = icons.git.FileDeleted, -- this can only be used in the git_status source
          renamed = icons.git.FileRenamed, -- this can only be used in the git_status source
          -- Status type
          untracked = icons.git.FileUntracked,
          ignored = icons.git.FileIgnored,
          unstaged = icons.git.FileUnstaged,
          staged = icons.git.FileStaged,
          conflict = icons.git.FileUnmerged,
        },
      },
    },
    window = {
      position = "left",
      width = 30,
    },
    filesystem = {
      hijack_netrw_behavior = "disabled",
    },
  }
end

return M
