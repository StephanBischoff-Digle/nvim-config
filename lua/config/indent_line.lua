vim.g['indentLine_char_list'] = {'|', '¦', '┆', '┊'}
vim.g['indentLine_enabled'] = false

local keymap = vim.api.nvim_set_keymap
keymap('n', '<leader>i', '<cmd>IndentLinesToggle<cr>', {noremap = true})
