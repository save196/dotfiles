return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "j-hui/fidget.nvim",
            "rafamadriz/friendly-snippets"
        },

        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            require("fidget").setup({})
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "bashls",
                    "clangd",
                    "pylsp"
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
                    ["pylsp"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.pylsp.setup {
                            capabilities = capabilities,
                            settings = {
                                pylsp = {
                                    plugins = {
                                        pycodestyle = { maxLineLength = 88 },
                                    }
                                }
                            }
                        }
                    end,
                }
            })

            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<CR>'] = cmp.mapping.confirm(),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif vim.snippet.jumpable(1) then
                            vim.snippet.jump(1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif vim.snippet.jumpable(-1) then
                            vim.snippet.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                }),

                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                }, {
                    { name = 'buffer' },
                }),
                experimental = {
                    ghost_text = true,
                },
            })
        end
    }
}
