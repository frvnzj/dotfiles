local M = {
  "mbbill/undotree"
}

function M.config()
  vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { noremap = true, silent = true, desc = "Undotree" })
end

return M
