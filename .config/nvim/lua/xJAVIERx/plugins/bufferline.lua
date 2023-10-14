return {
    'akinsho/bufferline.nvim',
    version = "*",
    config = function()
        require("bufferline").setup {
            options = {
                show_buffer_close_icons = false,
            },
            highlights = require("catppuccin.groups.integrations.bufferline").get()
        }
    end
}
