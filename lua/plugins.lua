return require'packer'.startup(function()
    use 'wbthomason/packer.nvim'

    use 'mhartington/oceanic-next'

    use 'kyazdani42/nvim-tree.lua'
    use 'kyazdani42/nvim-web-devicons'

    use 'unblevable/quick-scope'
    use 'itchyny/lightline.vim'
    use 'terryma/vim-smooth-scroll'
    use 'tpope/vim-commentary'

    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function() require'gitsigns'.setup() end
    }
    use 'kdheepak/lazygit.nvim'

    use {
        'folke/todo-comments.nvim',
        requires = {'folke/trouble.nvim'},
        config = function() require'todo-comments'.setup() end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = [[require'config.treesitter']]
    }

    use {
        'neovim/nvim-lspconfig',
        requires = { 'nvim-lua/lsp_extensions.nvim' },
        config = [[require'config.lsp']]
    }

    use 'nvim-lua/completion-nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/plenary.nvim'}
    }
end)

