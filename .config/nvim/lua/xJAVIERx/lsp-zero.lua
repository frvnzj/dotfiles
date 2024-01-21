local M = {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = true,
    init = function()
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = true,
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
        dependencies = { "rafamadriz/friendly-snippets" },
      },
      {
        "hrsh7th/cmp-nvim-lsp",
        event = "InsertEnter",
      },
      { "hrsh7th/cmp-emoji",        event = "InsertEnter" },
      { "hrsh7th/cmp-cmdline",      event = "InsertEnter" },
      { "saadparwaiz1/cmp_luasnip", event = "InsertEnter" },
      { "hrsh7th/cmp-path",         event = "InsertEnter" },
      { "hrsh7th/cmp-buffer",       event = "InsertEnter" },
      { "hrsh7th/cmp-nvim-lua" },
    },
    config = function()
      local lsp_zero = require "lsp-zero"
      lsp_zero.extend_cmp()

      -- And you can configure cmp even more, if you want to.
      local cmp = require "cmp"
      local cmp_action = lsp_zero.cmp_action()

      -- local luasnip = require("luasnip")
      -- local has_words_before = function()
      --     unpack = unpack or table.unpack
      --     local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      --     return col ~= 0 and
      --         vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      -- end
      --
      require("luasnip.loaders.from_vscode").lazy_load()
      local icons = require "xJAVIERx.icons"

      cmp.setup {
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            vim_item.kind = icons.kind[vim_item.kind]
            vim_item.menu = ({
              nvim_lsp = "",
              nvim_lua = "",
              luasnip = "",
              buffer = "",
              path = "",
              emoji = "",
            })[entry.source.name]

            if entry.source.name == "emoji" then
              vim_item.kind = icons.misc.Smiley
              vim_item.kind_hl_group = "CmpItemKindEmoji"
            end

            return vim_item
          end,
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "nvim_lua" },
          { name = "buffer" },
          { name = "path" },
          { name = "emoji" },
          { name = "neorg" },
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ["<CR>"] = cmp.mapping.confirm { select = false },
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-f>"] = cmp_action.luasnip_jump_forward(),
          ["<C-b>"] = cmp_action.luasnip_jump_backward(),
          ["<Right>"] = cmp.mapping.abort(),
          ["<Tab>"] = cmp_action.luasnip_supertab(),
          ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),

          -- ["<Tab>"] = cmp.mapping(function(fallback)
          --     if cmp.visible() then
          --         cmp.select_next_item()
          --         -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
          --         -- they way you will only jump inside the snippet region
          --     elseif luasnip.expand_or_jumpable() then
          --         luasnip.expand_or_jump()
          --     elseif has_words_before() then
          --         cmp.complete()
          --     else
          --         fallback()
          --     end
          -- end, { "i", "s" }),
          --
          -- ["<S-Tab>"] = cmp.mapping(function(fallback)
          --     if cmp.visible() then
          --         cmp.select_prev_item()
          --     elseif luasnip.jumpable(-1) then
          --         luasnip.jump(-1)
          --     else
          --         fallback()
          --     end
          -- end, { "i", "s" }),
        },
        window = {
          completion = {
            border = "rounded",
            scrollbar = false,
          },
          documentation = {
            border = "rounded",
          },
        },
      }
    end,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "williamboman/mason-lspconfig.nvim" },
      {
        "folke/neodev.nvim",
      },
      -- {
      --     'j-hui/fidget.nvim',
      --     tag = 'legacy',
      --     opts = {
      --         window = {
      --             blend = 0
      --         }
      --     }
      -- }
    },
    config = function()
      -- This is where all the LSP shenanigans will live
      local wk = require "which-key"
      wk.register {
        ["<leader>la"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        ["<leader>ld"] = { "<cmd>Telescope diagnostics theme=dropdown<cr>", "Diagnostics" },
        ["<leader>lf"] = {
          "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
          "Format",
        },
        ["<leader>lI"] = { "<cmd>Mason<cr>", "Mason" },
        ["<leader>li"] = { "<cmd>LspInfo<cr>", "Info" },
        ["<leader>lj"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
        ["<leader>lh"] = { "<cmd>lua require('xJAVIERx.lspconfig').toggle_inlay_hints()<cr>", "Hints" },
        ["<leader>lk"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
        ["<leader>ll"] = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        ["<leader>lq"] = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
        ["<leader>lr"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
      }

      local lsp_zero = require "lsp-zero"
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        -- lsp_zero.default_keymaps { buffer = bufnr }
        local opts = { noremap = true, silent = true }
        local keymap = vim.api.nvim_buf_set_keymap
        keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
        keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
        keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
        keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
        keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
        keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
      end)

      -- lsp_zero.configure ""
      --
      -- require("mason-lspconfig").setup {
      --   handlers = {
      --     lsp_zero.default_setup,
      --     lua_ls = function()
      --       local lua_opts = lsp_zero.nvim_lua_ls()
      --       require("lspconfig").lua_ls.setup(lua_opts)
      --     end,
      --   },
      -- }

      local lspconfig = require "lspconfig"
      local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.lua_ls.setup {
        capabilities = lsp_capabilities,
        settings = {
          Lua = {
            format = {
              enable = false,
            },
            diagnostics = {
              globals = { "vim", "spec" },
            },
            runtime = {
              version = "LuaJIT",
              special = {
                spec = "require",
              },
            },
            workspace = {
              checkThirdParty = false,
              library = {
                [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                [vim.fn.stdpath "config" .. "/lua"] = true,
              },
            },
            hint = {
              enable = false,
              arrayIndex = "Disable",
              await = true,
              paramName = "Disable",
              paramType = true,
              semicolon = "All",
              setType = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      }

      lspconfig.astro.setup { capabilities = lsp_capabilities }

      lspconfig.bashls.setup { capabilities = lsp_capabilities }

      lspconfig.cssls.setup { capabilities = lsp_capabilities }

      lspconfig.html.setup { capabilities = lsp_capabilities }

      lspconfig.emmet_ls.setup { capabilities = lsp_capabilities }

      lspconfig.eslint.setup { capabilities = lsp_capabilities }

      lspconfig.jsonls.setup { capabilities = lsp_capabilities }

      lspconfig.pyright.setup { capabilities = lsp_capabilities }

      lspconfig.tailwindcss.setup { capabilities = lsp_capabilities }

      lspconfig.texlab.setup { capabilities = lsp_capabilities }

      lspconfig.tsserver.setup { capabilities = lsp_capabilities }

      lspconfig.typst_lsp.setup {
        settings = {
          exportPdf = "never",
        },
      }
    end,
  },
  {
    "vuki656/package-info.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
    event = "BufRead package.json",
  },
}

return M
