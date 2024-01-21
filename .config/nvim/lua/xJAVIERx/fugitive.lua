local M = {
  "tpope/vim-fugitive",
}

function M.config()
  vim.keymap.set("n", "<leader>gg", vim.cmd.Git, { noremap = true, silent = true, desc = "Fugitive" })
end

return M
