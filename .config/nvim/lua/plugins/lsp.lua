return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",
      { "j-hui/fidget.nvim",       opts = {} },
      {
        'saghen/blink.compat',
        version = '*',
        lazy = true,
        opts = {},
      },
      {
        "saghen/blink.cmp",
        dependencies = 'rafamadriz/friendly-snippets',
        version = '*',
        opts = {
          completion = {
            ghost_text = { enabled = false },
          },
          sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
          },
          signature = { enabled = true },
        },
      },
    },

    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "bashls",
          "clangd",
          "pyright",
          "ruff"
        },
        handlers = {
          function(server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {
              capabilities = capabilities,
            }
          end,
          ["lua_ls"] = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup {
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" },
                  }
                }
              }
            }
          end,
          ["pyright"] = function()
            local lspconfig = require("lspconfig")
            lspconfig.pyright.setup {
              capabilities = capabilities,
              settings = {
                pyright = {
                  -- Using Ruff's import organizer
                  disableOrganizeImports = true,
                },
                python = {
                  analysis = {
                    -- Ignore all files for analysis to exclusively use Ruff for linting
                    ignore = { '*' },
                  },
                },
              },
            }
          end,
          ["ruff"] = function()
            local lspconfig = require("lspconfig")
            lspconfig.ruff.setup {
              capabilities = capabilities,
            }
          end,
        }
      })
    end
  }
}
