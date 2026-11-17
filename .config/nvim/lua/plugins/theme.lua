local colorscheme = {}

-- Colorschemes definitions
local gruvbox = {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  version = false,
  config = function()
    require('gruvbox').setup({
      transparent_mode = true,
      overrides = { TabLineFill = { bg = 'NONE' } },
    })
    vim.cmd.colorscheme('gruvbox')
    vim.api.nvim_set_hl(0, 'DiffText', { bg = '#675425' })
    vim.api.nvim_set_hl(0, 'BlinkCmpMenu', { link = 'NormalFloat' })
    vim.api.nvim_set_hl(0, 'BlinkCmpMenuBorder', { link = 'NormalFloat' })
    vim.api.nvim_set_hl(0, 'DiagnosticSignError', { link = 'GruvboxRed' })
    vim.api.nvim_set_hl(0, 'DiagnosticSignWarn', { link = 'GruvboxYellow' })
    vim.api.nvim_set_hl(0, 'DiagnosticSignInfo', { link = 'GruvboxBlue' })
    vim.api.nvim_set_hl(0, 'DiagnosticSignHint', { link = 'GruvboxAqua' })
    vim.api.nvim_set_hl(0, 'VimwikiHeader1', { fg = '#98971A' })
    vim.api.nvim_set_hl(0, 'VimwikiHeader2', { fg = '#458588' })
    vim.api.nvim_set_hl(0, 'VimwikiHeader3', { fg = '#D79921' })
    vim.api.nvim_set_hl(0, 'VimwikiHeader4', { fg = '#B16286' })
    vim.api.nvim_set_hl(0, 'VimwikiHeader5', { fg = '#689D6A' })
    vim.api.nvim_set_hl(0, 'VimwikiHeader6', { fg = '#CC241D' })

    vim.api.nvim_set_hl(0, 'RenderMarkdownH1', { fg = '#98971A', bold = false })
    vim.api.nvim_set_hl(0, 'RenderMarkdownH2', { fg = '#458588', bold = false })
    vim.api.nvim_set_hl(0, 'RenderMarkdownH3', { fg = '#D79921', bold = false })
    vim.api.nvim_set_hl(0, 'RenderMarkdownH4', { fg = '#B16286', bold = false })
    vim.api.nvim_set_hl(0, 'RenderMarkdownH5', { fg = '#689D6A', bold = false })
    vim.api.nvim_set_hl(0, 'RenderMarkdownH6', { fg = '#CC241D', bold = false })
    vim.api.nvim_set_hl(0, '@markup.heading.1', { fg = '#98971A', bold = true })
    vim.api.nvim_set_hl(0, '@markup.heading.2', { fg = '#458588', bold = true })
    vim.api.nvim_set_hl(0, '@markup.heading.3', { fg = '#D79921', bold = true })
    vim.api.nvim_set_hl(0, '@markup.heading.4', { fg = '#B16286', bold = true })
    vim.api.nvim_set_hl(0, '@markup.heading.5', { fg = '#689D6A', bold = true })
    vim.api.nvim_set_hl(0, '@markup.heading.6', { fg = '#CC241D', bold = true })
    vim.api.nvim_set_hl(0, '@markup.heading.1.markdown', { fg = '#98971A', bold = true })
    vim.api.nvim_set_hl(0, '@markup.heading.2.markdown', { fg = '#458588', bold = true })
    vim.api.nvim_set_hl(0, '@markup.heading.3.markdown', { fg = '#D79921', bold = true })
    vim.api.nvim_set_hl(0, '@markup.heading.4.markdown', { fg = '#B16286', bold = true })
    vim.api.nvim_set_hl(0, '@markup.heading.5.markdown', { fg = '#689D6A', bold = true })
    vim.api.nvim_set_hl(0, '@markup.heading.6.markdown', { fg = '#CC241D', bold = true })
    vim.api.nvim_set_hl(0, 'RenderMarkdownH1Bg', { bg = '#313127' })
    vim.api.nvim_set_hl(0, 'RenderMarkdownH2Bg', { bg = '#2A2F30' })
    vim.api.nvim_set_hl(0, 'RenderMarkdownH3Bg', { bg = '#363127' })
    vim.api.nvim_set_hl(0, 'RenderMarkdownH4Bg', { bg = '#332D30' })
    vim.api.nvim_set_hl(0, 'RenderMarkdownH5Bg', { bg = '#2D312D' })
    vim.api.nvim_set_hl(0, 'RenderMarkdownH6Bg', { bg = '#352827' })
  end
}
local hackthebox = {
  "audibleblink/hackthebox.vim",
  priority = 1100,
  config = function()
    vim.cmd.colorscheme('hackthebox')
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
local lualine_theme = 'auto'
if vim.g.theme == 'gruvbox' then
  lualine_theme = 'gruvbox-material'
  colorscheme = gruvbox
elseif vim.g.theme == 'hackthebox' then
  colorscheme = hackthebox
end

return {
  {
    'catgoose/nvim-colorizer.lua',
    event = "BufReadPre",
    opts = {},
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup {
        options = {
          numbers = "buffer_id",
          buffer_close_icon = '✕',
          separator_style = "slope",
          tab_size = 0,
        },
        highlights = function(defaults)
          local sel = vim.api.nvim_get_hl(0, { name = 'CursorLine' }).bg
          local out = {}
          for name in pairs(defaults.highlights) do
            out[name] = { bg = name:match('_selected$') and sel or 'NONE' }
            if name:match('separator') then out[name].fg = vim.g.terminal_color_0 end
          end
          out.buffer_selected.fg = vim.api.nvim_get_hl(0, { name = 'TabLineSel' }).fg
          return out
        end,
      }
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('lualine').setup {
        options = {
          theme = lualine_theme,
        },
      }
    end
  },
  colorscheme,
}
