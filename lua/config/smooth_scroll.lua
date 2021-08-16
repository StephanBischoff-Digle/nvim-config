local keymap = vim.api.nvim_set_keymap

keymap('n', '<c-u>', '<cmd>call smooth_scroll#up(&scroll, 0, 2)<cr>', {noremap = true})
keymap('n', '<c-d>', '<cmd>call smooth_scroll#down(&scroll, 0, 2)<cr>', {noremap = true})
keymap('n', '<c-b>', '<cmd>call smooth_scroll#up(&scroll*2, 0, 4)<cr>', {noremap = true})
keymap('n', '<c-f>', '<cmd>call smooth_scroll#down(&scroll*2, 0, 4)<cr>', {noremap = true})

