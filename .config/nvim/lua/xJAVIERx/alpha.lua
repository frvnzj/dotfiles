local M = {
  "goolord/alpha-nvim",
  event = "VimEnter",
}

function M.config()
  local alpha = require "alpha"
  local icons = require "xJAVIERx.icons"

  local header = {
    type = "text",
    val = {
      -- [[                                                                     ]],
      -- [[       ████ ██████           █████      ██                     ]],
      -- [[      ███████████             █████                             ]],
      -- [[      █████████ ███████████████████ ███   ███████████   ]],
      -- [[     █████████  ███    █████████████ █████ ██████████████   ]],
      -- [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      -- [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      -- [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      -- [[███    ██ ██    ██ ██ ███    ███ ]],
      -- [[████   ██ ██    ██ ██ ████  ████ ]],
      -- [[██ ██  ██ ██    ██ ██ ██ ████ ██ ]],
      -- [[██  ██ ██  ██  ██  ██ ██  ██  ██ ]],
      -- [[██   ████   ████   ██ ██      ██ ]],
      [[                               __                ]],
      [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
      [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
      [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
      [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
      [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    },
    opts = {
      position = "center",
      hl = "AlphaHeader",
    },
  }

  local heading = {
    type = "text",
    val = "Javier Gómez",
    opts = {
      position = "center",
      hl = "String",
    },
  }

  local heading2 = {
    type = "text",
    val = "Philosopher :: P. Scientist",
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
      hl = "Function",
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
      button("e", icons.ui.NewFile .. "  Nuevo archivo", "<cmd>enew<cr>"),
      button("n", icons.ui.Note .. "  Neorg", "<cmd>Neorg index<cr>"),
      button("l", "󰒲  Lazy", "<cmd>Lazy<cr>"),
      button("f", icons.ui.Search .. "  Buscar archivo", "<cmd>Telescope fd<cr>"),
      button("r", icons.ui.History .. "  Archivos recientes", "<cmd>Telescope oldfiles<cr>"),
      button("g", icons.ui.Text .. "  Grep", "<cmd>Telescope live_grep<cr>"),
      button("c", icons.ui.Gear .. "  Configuración", "<cmd>e ~/.config/nvim/init.lua<cr>"),
      button("q", icons.ui.SignOut .. "  Salir", "<cmd>qa<cr>"),
    },
    opts = {
      spacing = 1,
    },
  }

  local section = {
    header = header,
    heading = heading,
    heading2 = heading2,
    buttons = buttons,
  }

  local opts = {
    layout = {
      { type = "padding", val = 2 },
      section.header,
      { type = "padding", val = 1 },
      section.heading,
      section.heading2,
      { type = "padding", val = 2 },
      section.buttons,
    },
  }

  alpha.setup(opts)

  vim.api.nvim_create_autocmd({ "User" }, {
    pattern = { "AlphaReady" },
    callback = function()
      vim.cmd [[
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
      ]]
    end,
  })
end

return M
