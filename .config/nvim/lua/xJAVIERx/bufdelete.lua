local M = {
  "famiu/bufdelete.nvim",
  event = "VeryLazy",
}

function M.config()
  local keymap = vim.keymap.set
  keymap(
    "n",
    "<leader>c",
    ":lua require('bufdelete').bufdelete(0, false)<cr>",
    { noremap = true, silent = true, desc = "CerrarBuf" }
  )
end

return M
