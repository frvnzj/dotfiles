vim.keymap.set('n', '<leader>ff', require('telescope.builtin').fd, { desc = 'Buscar Archivo' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Grep' })
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').oldfiles, { desc = 'Archivos recientes' })
