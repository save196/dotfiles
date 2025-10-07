return {
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = 'master',
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
      -- default telescope file finder to git_files and fallback to find_files if not in a git repo
      local function find_files()
        local status, _ = pcall(builtin.git_files)
        if not status then
          builtin.find_files()
        end
      end
      vim.keymap.set('n', '<leader>f', find_files, {})
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
