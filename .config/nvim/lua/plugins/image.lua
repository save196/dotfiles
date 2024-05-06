return {
    {
        "vhyrro/luarocks.nvim",
        priority = 1001, -- this plugin needs to run before anything else
        ft = "vimwiki",
        opts = {
            rocks = { "magick" },
        },
    },
    {
        "3rd/image.nvim",
        dependencies = { "luarocks.nvim" },
        ft = "vimwiki",
        config = function()
            require("image").setup({
                hijack_file_patterns = {}, -- render image files as images when opened
            })
        end
    }
}
