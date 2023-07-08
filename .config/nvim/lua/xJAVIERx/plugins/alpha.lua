return {
    'goolord/alpha-nvim',
    event = "VimEnter",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local alpha = require 'alpha'
        local dashboard = require 'alpha.themes.dashboard'

        local function pick_color()
            local colors = { "String", "Identifier", "Keyword", "Number" }
            return colors[math.random(#colors)]
        end

        dashboard.section.header.val = {
            [[██╗  ██╗███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗██╗  ██╗]],
            [[╚██╗██╔╝████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║╚██╗██╔╝]],
            [[ ╚███╔╝ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ╚███╔╝ ]],
            [[ ██╔██╗ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ██╔██╗ ]],
            [[██╔╝ ██╗██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║██╔╝ ██╗]],
            [[╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝]],
        }
        dashboard.section.header.opts.hl = pick_color()

        dashboard.section.buttons.val = {
            dashboard.button("e", "🗒️ Nuevo archivo", "<cmd>enew<cr>"),
            dashboard.button("n", "📓 Neorg", "<cmd>Neorg index<cr>"),
            dashboard.button("l", "💤 Lazy", "<cmd>Lazy update<cr>"),
            dashboard.button("f", "🔎 Buscar archivo", "<cmd>Telescope find_files<cr>"),
            dashboard.button("r", "📂 Archivos recientes", "<cmd>Telescope oldfiles<cr>"),
            dashboard.button("g", "🐶 Grep", "<cmd>Telescope live_grep<cr>"),
            dashboard.button("q", "❌ Salir", "<cmd>qa<cr>"),
        }

        dashboard.config.opts.noautocmd = true

        local group = vim.api.nvim_create_augroup("CleanDashboard", {})

        vim.api.nvim_create_autocmd("User", {
            group = group,
            pattern = "AlphaReady",
            callback = function()
                vim.opt.laststatus = 0
                vim.opt.showcmd = false
                vim.opt.ruler = false
            end,
        })

        vim.api.nvim_create_autocmd("BufUnload", {
            group = group,
            pattern = "<buffer>",
            callback = function()
                vim.opt.laststatus = 3
                vim.opt.showcmd = true
            end,
        })

        alpha.setup(dashboard.config)
    end
}
