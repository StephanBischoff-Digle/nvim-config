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

    -- use {
    --     'rose-pine/neovim',
    --     config = function() 
    --         vim.g.rose_pine_variant = 'dawn'
    --         vim.g.rose_pine_disable_italics = false
    --         vim.g.rose_pine_bold_vertical_split_line = true
    --         vim.cmd('colorscheme rose-pine')
    --     end,
    -- }

    use {
      'Shatur/neovim-ayu',
      config = function()
        require'ayu'.setup({
          mirage = true,
        })
        vim.o.background = "dark"
        require'ayu'.colorscheme()
      end
    }


    -- use {
    --   "sonph/onehalf",
    --   rtp = 'vim',
    --   config = function()
    --     vim.cmd [[colorscheme onehalflight]]
    --   end

    -- }

    use {
        'ThePrimeagen/harpoon',
        require = {'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim'},
    }

    use {
        'reedes/vim-pencil',
        'folke/zen-mode.nvim',
        config = function()
            require'zen-mode'.setup()
        end,
    }

    use {
        'tpope/vim-surround'
    }

    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function()
            require'lualine'.setup({})
        end
    }

    use {
        'yamatsum/nvim-nonicons',
        requires = {'kyazdani42/nvim-web-devicons'}
    }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function() require'config.nvim_tree' end,
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
        'nvim-treesitter/playground',
        run = ':TSUpdate',
        config = function()
            require'config.treesitter'
        end
    }

    use {
        'neovim/nvim-lspconfig',
        requires = { 'nvim-lua/lsp_extensions.nvim' },
        config = function() require'config.lsp' end
    }

    use {
        'Yggdroot/indentLine',
        config = [[require'config.indent_line']]
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

    use {
        'phaazon/hop.nvim',
        as = 'hop',
        config = function()
            require'config.hop'
        end
    }

    use {
        'nvim-telescope/telescope.nvim',
    }

    use {
        'folke/trouble.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            'neovim/nvim-lspconfig',
        },
        config = function() require'trouble'.setup() end
    }

    use {
        'folke/todo-comments.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'folke/trouble.nvim'
        },
        config = function() require'config.todo_comments' end
    }

    -- use {
    --     'vimwiki/vimwiki',
    --     requires = {
    --         'mattn/calendar-vim',
    --         'Shatur/neovim-ayu',
    --     },
    --     config = function() require'config.vimwiki' end
    -- }

    use {
        'folke/which-key.nvim',
        config = function() require'config.which-key' end,
    }

    use {
        'noahfrederick/vim-laravel',
        requires = {
            'tpope/vim-dispatch',
            'tpope/vim-projectionist',
            'noahfrederick/vim-composer',
            'noahfrederick/vim-laravel',
        }
    }

    use {
        'jwalton512/vim-blade'
    }

    use {
        'python/black'
    }

    use {
      'cespare/vim-toml'
    }


end)
