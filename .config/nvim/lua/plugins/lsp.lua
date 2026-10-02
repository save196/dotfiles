return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",
      { "j-hui/fidget.nvim",       opts = {} },
      {
        "saghen/blink.cmp",
        dependencies = 'rafamadriz/friendly-snippets',
        version = '*',
        opts = {
          completion = {
            ghost_text = { enabled = true },
          },
          sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
          },
          signature = { enabled = true },
        },
      },
    },

    config = function()
      require('mason').setup()
      require('blink.cmp').setup {
        completion = { ghost_text = { enabled = true } },
        sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
        signature = { enabled = true },
      }

      vim.lsp.config('lua_ls', { settings = { Lua = { diagnostics = { globals = { 'vim' } } } } })
      vim.lsp.config('pyright', {
        settings = {
          pyright = { disableOrganizeImports = true },
          python = { analysis = { ignore = { '*' } } },
        },
      })

      -- automatic_enable (default) calls vim.lsp.enable on installed servers
      require('mason-lspconfig').setup { ensure_installed = { 'lua_ls', 'bashls', 'clangd', 'pyright', 'ruff' } }
    end
  }
}
