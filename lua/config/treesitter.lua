require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        'bash', 'bibtex', 'c', 'cmake', 'comment', 'cpp', 'fish', 'javascript',
        'json', 'latex', 'ledger', 'lua', 'python', 'rust', 'toml', 'yaml'
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    locals = {enabled = true},

    -- lsp cursorhold
    vim.api.nvim_command([[
        autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
    ]])
}

