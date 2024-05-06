return {
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local telescope = require('telescope')
            telescope.setup {
                defaults = {
                    mappings = {
                        i = {
                            ["<Esc>"] = "close"
                        }
                    }
                },
                extensions = {
                    fzf = {
                        fuzzy = true,                   -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true,    -- override the file sorter
                        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                    }
                }
            }
            telescope.load_extension('fzf')

            -- keymaps
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>f', builtin.git_files, {})
            vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(e)
                    local bufopts = { buffer = e.buf }
                    vim.keymap.set('n', 'gd', builtin.lsp_definitions, bufopts)
                    vim.keymap.set('n', 'gi', builtin.lsp_implementations, bufopts)
                    vim.keymap.set('n', 'gr', builtin.lsp_references, bufopts)
                end
            })
        end
    }
}
