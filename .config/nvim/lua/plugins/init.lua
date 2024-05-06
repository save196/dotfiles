return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            vim.treesitter.language.register('markdown', 'vimwiki')
        end
    },
    {
        "save196/toggle-terminal",
        config = function()
            vim.keymap.set('n', '<leader>t', ':ToggleTerminal<CR>')
        end
    },
    { "windwp/nvim-autopairs", event = "InsertEnter", config = true },
    "nvim-treesitter/nvim-treesitter-context",
    "eandrju/cellular-automaton.nvim",
    "tpope/vim-fugitive",
}
