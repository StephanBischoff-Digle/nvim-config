vim.g['qs_highlight_on_keys'] = {'f', 'F', 't', 'T' }
vim.g['qs_max_chars'] = 150

vim.cmd[[
    highlight QuickScopePrimary cterm=underline gui=underline guibg='#553300'
    highlight QuickScopeSecondary cterm=underline gui=underline guibg='#003355'
]]
