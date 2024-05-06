vim.g.vimwiki_ext2syntax = {
    ['.Rmd'] = 'markdown',
    ['.rmd'] = 'markdown',
    ['.md'] = 'markdown',
    ['.markdown'] = 'markdown',
    ['.mdown'] = 'markdown',
    ['.wiki'] = 'markdown'
}

-- Define Wikis
local main_wiki = { syntax = 'markdown', ext = '.md', links_space_char = '_' }
vim.g.vimwiki_list = { main_wiki }

-- Enable auto-save
vim.api.nvim_create_autocmd({ "CursorHold", "BufLeave" }, {
    pattern = vim.env.HOME .. "/vimwiki/*.md",
    command = "update"
})

-- Color highlight '> Text'
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*.md",
    callback = function()
        vim.cmd [[syntax match customMarkdownBlockquote '^\s*>\+\s\+']]
        vim.cmd [[hi def link customMarkdownBlockquote Comment]]
        vim.cmd [[hi def link Underlined MatchParen]]
    end,
})

-- Copy screenshot
vim.cmd([[
function! PasteMarkdownImage(text)
    let link = a:text
    exec 'normal! a'.link
    if link =~? '^\/\([a-z0-9_+-]\+\/\)\+Screenshots\/[a-z0-9_+-]\+\.\(png\|jpg\|jpeg\)$'
        let myDir = expand('%:p:h')
        let fileName = substitute(system('basename "'. link .'"'), '\n\+$', '', '')
        exec 'sno,'. link .',\![IMG]('. fileName .'),g'
        noh
        exec '!cp "'. link .'" "'. myDir .'"'
    endif
endfunction
autocmd BufRead,BufNewFile *.md nnoremap <MiddleMouse> :call PasteMarkdownImage(@*)<CR><CR>
]])

return { "vimwiki/vimwiki" }
