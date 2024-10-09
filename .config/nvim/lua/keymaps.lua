-- keymaps.lua
local map = vim.keymap.set

-- Leader key
vim.g.mapleader = ","

-- Some basics
map('n', 'c', '"_c')
map('n', 'C', '"_C')
map('n', 'x', '"_x')
map('n', '*', [[:call setreg('/', '\C\<' . expand('<cword>') . '\>')<CR>:set hlsearch<CR>]], { silent = true })

-- Move selected lines up and down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "J", "mzJ`z")

-- Spell-check set to <leader>o, 'o' for 'orthography'
map('n', '<leader>o', ':setlocal spell! spelllang=en_us<CR>')

-- Shortcutting split navigation
map('', '<C-h>', '<C-w>h')
map('', '<C-j>', '<C-w>j')
map('', '<C-k>', '<C-w>k')
map('', '<C-l>', '<C-w>l')

-- Replace all is aliased to S
map('n', 'S', ':%s//g<Left><Left>')

-- Exit terminal
map('t', '<Esc><Esc>', '<C-\\><C-n>')

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)
map('n', '<leader>e', vim.diagnostic.open_float)
map('n', '<leader>q', vim.diagnostic.setloclist)
