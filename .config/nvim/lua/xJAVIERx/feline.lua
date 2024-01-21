local M = {
  "freddiehaddad/feline.nvim",
}

function M.config()
  local clrs = require("catppuccin.palettes").get_palette()
  local ctp_feline = require "catppuccin.groups.integrations.feline"

  ctp_feline.setup {
    assets = {
      right_separator = "",
      left_separator = "",
      mode_icon = "",
    },
    sett = {
      curr_file = clrs.surface2,
      curr_dir = clrs.surface1,
      show_modified = true,
    },
  }

  require("feline").setup {
    components = ctp_feline.get(),
  }
end

return M
