-- INFO: from https://jdhao.github.io/2021/07/11/from_vim_plug_to_packer/
local exec = vim.api.nvim_command
local fn = vim.fn

local packer_install_dir = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

local plug_url_format = 'https://github.com/%s'
local packer_repo = string.format(plug_url_format, 'wbthomason/packer.nvim')
local install_cmd = string.format('10split |term git clone --depth=1 %s %s', packer_repo, packer_install_dir)

if fn.empty(fn.glob(packer_install_dir)) > 0 then
    vim.api.nvim_echo({{'Installing packer.nvim', 'Type'}}, true, {})
    exec(install_cmd)
    exec 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]
-- End of Copy 'n Paste


return require'packer'.startup(function()
    use 'wbthomason/packer.nvim'

    use {
        'mhartington/oceanic-next',
        config = [[require'config.oceanicnext']]
    }

    use {
        'ThePrimeagen/harpoon',
        require = {'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim'},
    }


    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        -- your statusline
        config = function() require'config.galaxy_line' end,
        -- some optional icons
        requires = {'kyazdani42/nvim-web-devicons', 'nvim-lua/lsp-status.nvim', 'ThePrimeagen/harpoon'}
    }

    use {
        'yamatsum/nvim-nonicons',
        requires = {'kyazdani42/nvim-web-devicons'}
    }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = [[require'config.nvim_tree']],
    }

    use {
        'unblevable/quick-scope',
        config = [[require'config.quickscope']]
    }
    use {
        'terryma/vim-smooth-scroll',
        config = [[require'config.smooth_scroll']]
    }
    use 'tpope/vim-commentary'

    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function() require'gitsigns'.setup() end
    }
    use {
        'kdheepak/lazygit.nvim',
        config = [[require'config.lazygit']]
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

    use {
        'Yggdroot/indentLine',
        config = [[require'config.indent_line']]
    }

    use {
        'folke/todo-comments.nvim',
        requires = {
            'folke/trouble.nvim',
            'folke/lsp-colors.nvim',
            'nvim-lua/plenary.nvim',
            'neovim/nvim-lspconfig',
            'nvim-telescope/telescope.nvim',
            'nvim-treesitter/nvim-treesitter'
        },
        after = {'galaxyline.nvim', 'oceanic-next', 'nvim-lspconfig', 'telescope.nvim', 'nvim-treesitter'},
        config = function() require'todo-comments'.setup() end
    }

    use {
        'simrat39/symbols-outline.nvim',
        requires = {'neovim/nvim-lspconfig'},
        config = function() require'config.symbols_outline' end
    }

    use {
        'romgrk/barbar.nvim',
        config = require('config.bufferline').config,
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    }

    use {
        "onsails/lspkind-nvim",
        requires = {'neovim/nvim-lspconfig'},
        event = "BufEnter",
        config = function() require'lspkind'.init() end,
    }

    use {
        "windwp/nvim-autopairs",
        after = "nvim-compe",
        config = function()
            require "config.autopairs"
        end,
    }


    use {
        'hrsh7th/nvim-compe',
        event = 'InsertEnter',
        config = function() require'config.compe' end,
        wants = 'LuaSnip',
        requires = {
            {
                'L3MON4D3/LuaSnip',
                wants = 'friendly-snippets',
                event = 'InsertCharPre',
                config = function() require'config.luasnip' end,
            },
            {
                'rafamadriz/friendly-snippets',
                event = 'InsertCharPre',
            },
        }
    }

    use {
        "ray-x/lsp_signature.nvim",
        after = "nvim-lspconfig",
        config = function()
            require"config.others".signature()
        end,
    }


end)
