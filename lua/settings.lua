print("Loading Settings")

local o = vim.o
local opt = vim.opt

-- UI
o.termguicolors = true
o.background = "light"
o.number = false
o.scrolloff = 3
o.signcolumn = "yes"
o.showbreak = "↪"

-- listchars
opt.listchars = {
    eol = '¬',
    tab = '->',
    trail = '~',
    extends = '>',
    precedes = '<',
    space = '␣'
}

-- Tabs
local tabwidth = 4
o.tabstop = tabwidth
o.softtabstop = tabwidth
o.shiftwidth = tabwidth
o.expandtab = true

-- TODO: comment
o.splitbelow = true
o.splitright = true
o.ignorecase = true
o.smartcase = true

o.swapfile = false
o.undofile = true
o.fileencoding = "utf-8"

-- TODO: comment
o.completeopt='menuone,noinsert,noselect'
o.shortmess = o.shortmess .. 'c'
o.updatetime = 3000


-- highlight yank
vim.api.nvim_command([[
autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank{timeout=250}
]])


-- lsp cursorhold
vim.api.nvim_command([[
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
]])

-- colorscheme
vim.cmd [[
    colorscheme OceanicNext
]]

-- lightline
vim.g['lightline'] = { colorscheme = 'oceanicnext' }

-- quickscope
vim.g['qs_highlight_on_keys'] = {'f', 'F', 't', 'T' }
vim.g['qs_max_chars'] = 150


