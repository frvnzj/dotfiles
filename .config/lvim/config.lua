-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.transparent_window = true
lvim.colorscheme = "catppuccin"
-- lvim.colorscheme = "lunar"

vim.opt.wrap = true
vim.opt.cursorline = false
vim.opt.relativenumber = true

lvim.leader = "space"

lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-q>"] = ":!latexmk -pdf %<cr>"
lvim.keys.normal_mode["<F6>"] = ":set spell! spelllang=es<cr>"

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
  "astro",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- Additional Plugins
lvim.plugins = {
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
  { "catppuccin/nvim", as = "catppuccin" },
  {'nvim-orgmode/orgmode', config = function()
    require('orgmode').setup({
      org_agenda_files = '~/orgmode/*',
      org_capture_templates = {
        t = 'Agenda',
        td = {
          description = 'Hoy',
          template= '\n** TODO %?\n %t',
          target = '~/orgmode/agenda.org',
          headline = 'En el transcurso del día'
        },
        th = {
          description = 'Hora',
          template= '\n** TODO %?\n %T',
          target = '~/orgmode/agenda.org',
          headline = 'Hora agendada'
        },
        j = {
          description = 'Diario',
          template = '\n** %<%Y-%m-%d> %<%A>\n*** %U\n\n%?',
          target = '~/orgmode/diario.org'
        },
        n = 'notas',
        nt = {
          description = 'Tesis',
          template = '\n** %?\n %U\n\n%?',
          target = '~/orgmode/notas.org',
          headline = 'Para Tesis'
        },
        ne = {
          description = 'Ensayo',
          template = '\n** %?\n %U\n\n%?',
          target = '~/orgmode/notas.org',
          headline = 'Para ensayos'
        },
        na = {
          description = 'Aforismos',
          template = '\n** %?\n %U\n\n%?',
          target = '~/orgmode/notas.org',
          headline = 'Para aforismos'
        },
      },
    })
    require('orgmode').setup_ts_grammar()
  end
  },
  {
  "iamcco/markdown-preview.nvim",
  run = "cd app && npm install",
  ft = "markdown",
  config = function()
    vim.g.mkdp_auto_start = 1
  end,
  },
  {
    "potamides/pantran.nvim"
  },
}

-- Autocommands
vim.api.nvim_create_autocmd("VimLeave", { pattern = { "*.tex" }, command = "!texclear %", })
vim.api.nvim_create_autocmd("BufEnter", { pattern = { "*.tex", "*.md" }, command = "set textwidth=50", })
