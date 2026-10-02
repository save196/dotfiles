require("settings")
require("keymaps")
require("lazy_init")

-- Remove trailing spaces
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save_cursor)
  end,
})

-- Disable comments on new line
vim.api.nvim_create_autocmd('FileType', {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ 'r', 'o' })
  end,
})

-- Colorcolumn per filetype (linter defaults)
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    local col = ({
      python = "88",
      c = "80",
      cpp = "80",
      lua = "120",
      sh = "80",
      bash = "80",
      rust = "100",
      javascript = "80",
      typescript = "80",
    })[vim.bo.filetype]
    vim.wo.colorcolumn = col or ""
  end,
})

-- Lsp mapping
-- Defaults:
-- "K" hover
-- "grn" rename
-- "gra" code actions
-- "gO" document symbols
-- "<C-s>" signature help (insert)
-- "[d" / "]d" prev/next diagnostic
-- "<C-w>d" diagnostic float
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(e)
    local bufopts = { buffer = e.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
  end
})

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Close help and quickfix windows with q
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'help', 'qf' },
  callback = function(ev)
    vim.keymap.set('n', 'q', function()
      if not pcall(vim.cmd.close) then vim.cmd.bdelete() end
    end, { buffer = ev.buf, silent = true, nowait = true })
  end,
})
