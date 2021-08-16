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

