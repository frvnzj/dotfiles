local M = {
"HakonHarnes/img-clip.nvim",
  event = "BufEnter",
  opts = {
    -- add options here
    -- or leave it empty to use the default settings
  },
  keys = {
    -- suggested keymap
    { "<leader>wp", "<cmd>PasteImage<cr>", desc = "Clipimage" },
  },
}

return M
