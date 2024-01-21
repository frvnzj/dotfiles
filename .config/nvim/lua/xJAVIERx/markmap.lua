local M = {
  "Zeioth/markmap.nvim",
  event = "VeryLazy",
  build = "yarn global add markmap-cli",
  cmd = { "MarkmapOpen", "MarkmapSave", "MarkmapWatch", "MarkmapWatchStop" },
}

function M.config()
  local opts = {
    html_output = "/tmp/markmap.html",
    hide_toolbar = false,
    grace_period = 3600000,
  }

  require("markmap").setup(opts)
end

return M
