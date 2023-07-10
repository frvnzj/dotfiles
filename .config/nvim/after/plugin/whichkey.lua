local wk = require("which-key")
wk.register({
    ["<leader>"] = {
        ["|"] = { "<cmd>vs<cr>", "VSplit" },

        e = { "<cmd>NvimTreeToggle<cr>", "Explorar" },

        f = {
            name = "Telescope",
        },

        l = {
            name = "LSP",
            a = { function()
                vim.lsp.buf.code_action()
            end,
                "Code Action" },
            f = { function()
                vim.lsp.buf.format()
            end,
                "Formatear" },
            m = { "<cmd>Mason<cr>", "Mason" },
        },

        n = { "<cmd>enew<cr>", "Nuevo archivo" },

        o = { "<cmd>Neorg index<cr>", "Neorg" },

        s = { "<cmd>setlocal spell!<cr>", "Corrector" },

        u = {
            name = "Lazy",
            u = { "<cmd>Lazy update<cr>", "Update" },
            s = { "<cmd>Lazy sync<cr>", "Sync" },
        },

        w = {
            name = "Writer",
            b = { "<cmd>vsp refs.bib<cr>", "Bibliografía" },
            c = { "<cmd>!compiler '%:p'<cr>", "Compiler" },
            l = { "<cmd>!latexmk -pdf %<cr>", "LaTeX" },
            t = { "<cmd>Telescope bibtex theme=dropdown<cr>", "LaTeX.bib" },
            z = { "<cmd>!opout '%:p'<cr>", "Zathura" },
        },

        z = { "<cmd>ZenMode<cr>", "ZenMode" },
    },
}
)
