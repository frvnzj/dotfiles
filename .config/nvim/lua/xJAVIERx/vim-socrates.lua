local M = {
  "NI57721/vim-socrates"
}

function M.config()
  vim.keymap.set("n", "<leader>wg", "<Plug>(socrates-greed)", { noremap = true, desc = "GreekText" })
end

return M
