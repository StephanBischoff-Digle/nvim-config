require'nvim-tree'.setup()

local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', {silent = true})
