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
      "projekt0n/github-nvim-theme",
      config = function()
        require('github-theme').setup({
          theme_style = 'light_default'
        })
      end
    }

    use {
        'tpope/vim-surround'
    }

    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function()
            require'lualine'.setup({
              options = {
                icons_enabled = true,
                theme = 'auto'
              }
            })
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
        'nvim-treesitter/nvim-treesitter',
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

    use {
        'folke/which-key.nvim',
        config = function() require'config.which-key' end,
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

    use {
      'kdheepak/lazygit.nvim',
      config = function() require'config.lazygit' end,
    }


end)
