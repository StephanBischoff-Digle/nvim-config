local o = vim.o
local opt = vim.opt

-- NOTE: Display
o.termguicolors = true
o.background = "dark"
o.scrolloff = 3
o.signcolumn = "yes"
o.showbreak = "↪"

opt.number = false
opt.relativenumber = false
opt.numberwidth = 2
opt.signcolumn = 'yes:1'
opt.cursorline = true
opt.wrap = true
opt.linebreak = true
opt.showmode = false
opt.conceallevel = 0

opt.titlestring = '❐ %t'
opt.title = true
opt.titlelen = 70

-- listchars
opt.listchars = {
    eol = '¬',
    tab = '->',
    trail = '☗',
    extends = '>',
    precedes = '<',
    space = '_'
}

-- Tabs
local tabwidth = 2
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
opt.completeopt = { 'menuone', 'noselect', 'noinsert'}
o.shortmess = o.shortmess .. 'c'
o.updatetime = 3000


opt.confirm = true -- prompt to save before destructive actions

-- NOTE: Timings
opt.updatetime = 300
opt.timeout = true
opt.timeoutlen = 1000
opt.ttimeoutlen = 10


-- highlight yank
vim.api.nvim_command([[
autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank{timeout=250}
]])

-- format python files on save
vim.api.nvim_command([[
autocmd BufWrite *.py execute ':Black'
]])
