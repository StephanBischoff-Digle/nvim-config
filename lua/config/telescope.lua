local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {noremap = true})
keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {noremap = true})
keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {noremap = true})
