return {
    'goolord/alpha-nvim',
    event = "VimEnter",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local alpha = require('alpha')
        require 'alpha.term'
        local function pick_color()
            local colors = { "String", "Identifier", "Keyword", "Number" }
            return colors[math.random(#colors)]
        end

        local term = {
            type = "terminal",
            command = "cat | " .. os.getenv("HOME") .. "/path/to/logonvim",
            width = 23,
            height = 14,
            opts = {
                redraw = true
            }
        }

        local header = {
            type = "text",
            val = {
                [[                                                                     ]],
                [[       ████ ██████           █████      ██                     ]],
                [[      ███████████             █████                             ]],
                [[      █████████ ███████████████████ ███   ███████████   ]],
                [[     █████████  ███    █████████████ █████ ██████████████   ]],
                [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
                [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
                [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
            },
            opts = {
                position = "center",
                hl = pick_color()
            }
        }

        local heading = {
            type = "text",
            val = "[ https://xjavierx.netlify.app/ ]",
            opts = {
                position = "center",
                hl = "String",
            },
        }

        local function button(sc, txt, keybind)
            local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

            local opts = {
                position = "center",
                text = txt,
                shortcut = sc,
                cursor = 3,
                width = 35,
                align_shortcut = "right",
                hl_shortcut = "Number",
                hl = "Function"
            }
            if keybind then
                opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
            end

            return {
                type = "button",
                val = txt,
                on_press = function()
                    local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
                    vim.api.nvim_feedkeys(key, "normal", false)
                end,
                opts = opts,
            }
        end

        local buttons = {
            type = "group",
            val = {
                button("e", "  Nuevo archivo", "<cmd>enew<cr>"),
                button("n", "  Neorg", "<cmd>Neorg index<cr>"),
                button("l", "󰒲  Lazy", "<cmd>Lazy update<cr>"),
                button("f", "  Buscar archivo", "<cmd>Telescope find_files<cr>"),
                button("r", "  Archivos recientes", "<cmd>Telescope oldfiles<cr>"),
                button("g", "  Grep", "<cmd>Telescope live_grep<cr>"),
                button("q", "󰗼  Salir", "<cmd>qa<cr>"),
            },
            opts = {
                spacing = 1
            }
        }

        local section = {
            header = header,
            terminal = term,
            heading = heading,
            buttons = buttons
        }

        local opts = {
            layout = {
                { type = "padding", val = 2 },
                section.header,
                -- { type = "padding", val = 1},
                -- section.heading,
                { type = "padding", val = 3 },
                section.buttons,
            }
        }

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

        alpha.setup(opts)
    end
}
