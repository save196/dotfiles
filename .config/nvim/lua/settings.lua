-- settings.lua
local set = vim.opt

-- Misc
set.mouse = 'a'
set.clipboard:append('unnamedplus')
set.termguicolors = true
set.showmode = false
set.laststatus = 3
set.cursorline = true
set.scrolloff = 5
set.updatetime = 1000

-- Line number
set.number = true
set.relativenumber = true

-- Indentation
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.smartindent = true

-- Text wrap
set.wrap = true
set.linebreak = true
set.breakindent = true

-- Case settings
set.ignorecase = true
set.smartcase = true

-- Configure how new splits should be opened
set.splitright = true
set.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor
set.list = true
set.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Colorscheme (available: 'gruvbox' and 'hackthebox')
vim.g.colors_name = 'gruvbox'
