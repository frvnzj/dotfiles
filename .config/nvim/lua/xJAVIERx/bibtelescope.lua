local M = {
  "nvim-telescope/telescope-bibtex.nvim",
}

function M.config()
  require("telescope").load_extension "bibtex"
end

return M
