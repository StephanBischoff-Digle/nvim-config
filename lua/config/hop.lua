require'hop'.setup()


local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>hw', '<cmd>lua require"hop".hint_words()<cr>', {silent = true})
keymap('n', '<leader>hl', '<cmd>lua require"hop".hint_lines()<cr>', {silent = true})
