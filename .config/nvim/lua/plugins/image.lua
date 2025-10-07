return {
  {
    "3rd/image.nvim",
    ft = "vimwiki",
    config = function()
      require("image").setup({
        integrations = {
          markdown = {
            download_remote_images = false
          }
        },
        hijack_file_patterns = {}, -- render image files as images when opened
      })
    end
  }
}
