local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ' '

keymap('n', '<leader>w', '<cmd>write<cr>', {noremap = true})
keymap('n', '<leader>b', '<cmd>set list!<cr>', {noremap = true})

keymap('t', '<esc>', [[<c-\><c-n>]], {noremap = true})



