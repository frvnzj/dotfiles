local M = {
  "altermo/ultimate-autopair.nvim",
  event = { "InsertEnter", "CmdlineEnter" },
  branch = "v0.6",
}

function M.config()
  require("ultimate-autopair").setup {
    cmap = false,
    extensions = {
      cond = {
        -- disable in comments
        -- https://github.com/altermo/ultimate-autopair.nvim/blob/6fd0d6aa976a97dd6f1bed4d46be1b437613a52f/Q%26A.md?plain=1#L26
        cond = {
          function(fn)
            return not fn.in_node "comment"
          end,
        },
      },
      -- get fly mode working on strings:
      -- https://github.com/altermo/ultimate-autopair.nvim/issues/33
      fly = {
        nofilter = true,
      },
    },
    config_internal_pairs = {
      { '"', '"', fly = true },
      { "'", "'", fly = true },
    },
  }
end

return M
