local colorscheme = {}

-- Colorschemes definitions
local gruvbox = {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        vim.cmd('colorscheme gruvbox')
        vim.api.nvim_set_hl(0, 'Normal', { ctermbg = 'NONE', bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'VimwikiHeader1', { fg = '#98971A' })
        vim.api.nvim_set_hl(0, 'VimwikiHeader2', { fg = '#458588' })
        vim.api.nvim_set_hl(0, 'VimwikiHeader3', { fg = '#D79921' })
        vim.api.nvim_set_hl(0, 'VimwikiHeader4', { fg = '#B16286' })
        vim.api.nvim_set_hl(0, 'VimwikiHeader5', { fg = '#689D6A' })
        vim.api.nvim_set_hl(0, 'VimwikiHeader6', { fg = '#CC241D' })
    end
}
local hackthebox = {
    "audibleblink/hackthebox.vim",
    priority = 1100,
    config = function()
        vim.cmd('colorscheme hackthebox')
        vim.api.nvim_set_hl(0, 'Normal', { ctermbg = 'NONE', bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextOk', { bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'VimwikiHeader1', { fg = '#9fef00' })
        vim.api.nvim_set_hl(0, 'VimwikiHeader2', { fg = '#0086ff' })
        vim.api.nvim_set_hl(0, 'VimwikiHeader3', { fg = '#ffaf00' })
        vim.api.nvim_set_hl(0, 'VimwikiHeader4', { fg = '#ff3e3e' })
        vim.api.nvim_set_hl(0, 'VimwikiHeader5', { fg = '#9f00ff' })
        vim.api.nvim_set_hl(0, 'VimwikiHeader6', { fg = '#2ee7b6' })
    end
}

-- Colorscheme config
if vim.g.colors_name == 'gruvbox' then
    vim.g.airline_theme = 'base16_gruvbox_dark_hard'
    colorscheme = gruvbox
elseif vim.g.colors_name == 'hackthebox' then
    vim.g.airline_theme = 'onedark'
    colorscheme = hackthebox
end

-- Airline config
vim.g.airline_powerline_fonts = 1
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#buffer_nr_show'] = 1
vim.g['airline#extensions#tabline#formatter'] = 'unique_tail'

return {
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end
    },
    {
        "vim-airline/vim-airline",
        dependencies = {
            'vim-airline/vim-airline-themes'
        },
    },
    colorscheme,
}
