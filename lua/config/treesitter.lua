require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        'bash', 'bibtex', 'c', 'cmake', 'comment', 'cpp', 'fish', 'javascript',
        'json', 'latex', 'ledger', 'lua', 'python', 'rust', 'toml', 'yaml', 'markdown'
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    locals = {enabled = true},

    -- lsp cursorhold
    vim.api.nvim_command([[
        autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
    ]]),

    playground = {
        enable = true,
        disable = {},
        updatetime = 25,
        persist_queries = false,
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
        },
    }
}

