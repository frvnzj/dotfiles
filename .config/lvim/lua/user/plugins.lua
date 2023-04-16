lvim.plugins = {
  {'psliwka/vim-smoothie'},
  -- {
  --   "folke/trouble.nvim",
  --   cmd = "TroubleToggle",
  -- },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  { "catppuccin/nvim", name = "catppuccin" },
  -- {'nvim-orgmode/orgmode', config = function()
  --   require('orgmode').setup({
  --     org_agenda_files = '~/orgmode/*',
  --     org_capture_templates = {
  --       t = 'Agenda',
  --       td = {
  --         description = 'Hoy',
  --         template= '\n** TODO %?\n %t',
  --         target = '~/orgmode/agenda.org',
  --         headline = 'En el transcurso del día'
  --       },
  --       th = {
  --         description = 'Hora',
  --         template= '\n** TODO %?\n %T',
  --         target = '~/orgmode/agenda.org',
  --         headline = 'Hora agendada'
  --       },
  --       j = {
  --         description = 'Diario',
  --         template = '\n** %<%Y-%m-%d> %<%A>\n*** %U\n\n%?',
  --         target = '~/orgmode/diario.org'
  --       },
  --       n = 'notas',
  --       nt = {
  --         description = 'Tesis',
  --         template = '\n** %?\n %U\n\n%?',
  --         target = '~/orgmode/notas.org',
  --         headline = 'Para Tesis'
  --       },
  --       ne = {
  --         description = 'Ensayo',
  --         template = '\n** %?\n %U\n\n%?',
  --         target = '~/orgmode/notas.org',
  --         headline = 'Para ensayos'
  --       },
  --       na = {
  --         description = 'Aforismos',
  --         template = '\n** %?\n %U\n\n%?',
  --         target = '~/orgmode/notas.org',
  --         headline = 'Para aforismos'
  --       },
  --     },
  --   })
  --   require('orgmode').setup_ts_grammar()
  -- end
  -- },
  {
  "iamcco/markdown-preview.nvim",
  build = "cd app && npm install",
  ft = "markdown",
  config = function()
    vim.g.mkdp_auto_start = 1
  end,
  },
  {
  "folke/zen-mode.nvim",
  config = function()
    require("zen-mode").setup {
        window = {
          options = {
            number = false,
            relativenumber = false,
          },
        },
    }
  end
  },
  -- {'MunifTanjim/nui.nvim'},
  -- {
  -- "folke/noice.nvim",
  -- config = function()
  --   require("noice").setup({
  --       -- add any options here
  --   })
  -- end,
  -- requires = {
  --   "MunifTanjim/nui.nvim",
  --   }
  -- },
}
