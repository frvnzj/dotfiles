return {
  "stevearc/oil.nvim",
  opts = {},
  enabled = true,
  cmd = "Oil",
  keys = {
    { "<leader>e", function() require("oil").open() end, desc = "Oil" },
  },
}
