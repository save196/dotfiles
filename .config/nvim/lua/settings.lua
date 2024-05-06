-- settings.lua
local set = vim.opt

-- Misc
set.mouse = 'a'
set.clipboard:append('unnamedplus')
set.termguicolors = true

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

-- Case settings
set.ignorecase = true
set.smartcase = true

vim.g.python3_host_prog = '~/.local/share/python/nvim/bin/python3'

-- Colorscheme (available: 'gruvbox' and 'hackthebox')
vim.g.colors_name = 'gruvbox'
