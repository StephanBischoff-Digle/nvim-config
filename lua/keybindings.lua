local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ' '

keymap('n', '<leader>w', '<cmd>write<cr>', {noremap = true})
keymap('n', '<leader>b', '<cmd>set list!<cr>', {noremap = true})

keymap('', '<leader>e', '<cmd>NvimTreeToggle<cr>', {silent = true})
keymap('', '<leader>gg', '<cmd>LazyGit<cr>', {noremap = true})

keymap('n', '<c-u>', '<cmd>call smoot_scroll#up(&scroll, 0, 2)<cr>', {noremap = true})
keymap('n', '<c-d>', '<cmd>call smoot_scroll#down(&scroll, 0, 2)<cr>', {noremap = true})
keymap('n', '<c-b>', '<cmd>call smoot_scroll#up(&scroll*2, 0, 4)<cr>', {noremap = true})
keymap('n', '<c-f>', '<cmd>call smoot_scroll#down(&scroll*2, 0, 4)<cr>', {noremap = true})

keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {noremap = true})
keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {noremap = true})
keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {noremap = true})
