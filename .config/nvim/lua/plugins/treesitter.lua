return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc', 'python', 'javascript' },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = { 'ruby', 'markdown' }
        },
        indent = { enable = true, disable = { 'ruby' } },
      })
    end
  },
}
