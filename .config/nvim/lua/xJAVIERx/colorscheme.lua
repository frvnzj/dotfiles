local M = {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
}

function M.config()
  require("catppuccin").setup {
    flavour = "mocha",
    transparent_background = true,
    integrations = {
      fidget = true,
      mason = true,
      neotree = true,
      noice = true,
      notify = true,
      telescope = {
        enabled = true,
        style = "nvchad",
      },
      which_key = true,
    },
  }

  vim.cmd.colorscheme "catppuccin"
end

return M
