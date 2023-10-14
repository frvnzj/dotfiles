local wk = require("which-key")
wk.register({
    ["<leader>"] = {
        ["|"] = { "<cmd>vs<cr>", "VSplit" },

        a = { "<cmd>enew<cr>", "Nuevo archivo" },

        b = {
            name = "Buffers",
            b = { "<cmd>Telescope buffers<cr>", "Lista" },
            n = { "<cmd>bn<cr>", "Buffer siguiente" },
            p = { "<cmd>bp<cr>", "Buffer anterior" },
            s = { "<cmd>vertical sball<cr>", "Split buffers" },
        },

        c = { "<cmd>bd<cr>", "Cerrar buffer" },

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

        n = {
            name = "Neorg",
            i = { "<cmd>Neorg index<cr>", "Index" },
            j = { "<cmd>Neorg journal today<cr>", "Journal" },
        },

        p = {
            name = "PrevMD",
            a = { "<cmd>PeekOpen<cr>", "Abrir" },
            s = { "<cmd>PeekClose<cr>", "Cerrar" },
        },

        r = {
            name = "Lazy",
            u = { "<cmd>Lazy update<cr>", "Update" },
            s = { "<cmd>Lazy sync<cr>", "Sync" },
        },

        s = { "<cmd>setlocal spell!<cr>", "Corrector" },

        u = { "<cmd>ColorizerToggle<cr>", "Colorizer" },

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
