let mapleader =","

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
Plug 'lukesmithxyz/vimling'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-commentary'
Plug 'kovetskiy/sxhkd-vim'
Plug 'xolox/vim-misc'
Plug 'neomake/neomake'
Plug 'pearofducks/ansible-vim'
Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
Plug 'audibleblink/hackthebox.vim'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'mfukar/robotframework-vim'
Plug 'neomutt/neomutt.vim'
Plug 'save196/toggle-terminal'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ap/vim-css-color'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-hijack.vim'
call plug#end()

set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus

" Some basics:
	nnoremap c "_c
	nnoremap C "_C
	nnoremap x "_x
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
	set linebreak
        set termguicolors
        set bg=dark
        let g:gruvbox_italic=1
        let g:hackthebox_terminal_italic=1
        colorscheme gruvbox
        let g:airline_theme='base16_gruvbox_dark_hard'
        let g:airline_powerline_fonts = 1
        hi Normal guibg=NONE ctermbg=NONE
        set hlsearch
	set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Goyo plugin makes text more readable when writing prose:
	map <leader>f :Goyo \| set linebreak<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Fern tree
	map <leader>n :Fern . -drawer -toggle<CR>

" vimling:
	nm <leader>d :call ToggleDeadKeys()<CR>
	imap <leader>d <esc>:call ToggleDeadKeys()<CR>a
	nm <leader>i :call ToggleIPA()<CR>
	imap <leader>i <esc>:call ToggleIPA()<CR>a
	nm <leader>q :call ToggleProse()<CR>

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Replace ex mode with gq
	map Q gq

" Check file in shellcheck:
	map <leader>s :!clear && shellcheck %<CR>

" Open my bibliography file in split
	map <leader>b :vsp<space>$BIB<CR>
	map <leader>r :vsp<space>$REFER<CR>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	map <leader>v :VimwikiIndex
	let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost files,directories !shortcuts
" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
" Update binds when sxhkdrc is updated.
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
" if &diff
"    highlight! link DiffText MatchParen
" endif


" Neomake
"let g:neomake_makeclean_maker = { 'exe': 'make', 'args': ['clean'] }

"autocmd! BufReadPost * Neomake
"autocmd! BufWritePost * Neomake
call neomake#configure#automake('w')
let g:ansible_name_highlight = 'b'
au BufRead,BufNewFile ~/Documents/*.yml set filetype=yaml.ansible

let wiki = {}
let wiki.syntax = 'default'
let wiki.ext = '.wiki'
let g:vimwiki_list = [wiki]
hi VimwikiHeader1 guifg=#98971A
hi VimwikiHeader2 guifg=#D79921
hi VimwikiHeader3 guifg=#458588
hi VimwikiHeader4 guifg=#B16286
hi VimwikiHeader5 guifg=#689D6A
hi VimwikiHeader6 guifg=#CC241D

autocmd TermOpen * setlocal norelativenumber nonumber
tnoremap <ESC>   <C-\><C-n>
map <leader>t :ToggleTerminal<CR>
autocmd bufenter * if (winnr("$") == 1 && bufwinnr(bufnr('term://')) != -1) | q | endif

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

function! s:init_fern() abort
    setlocal norelativenumber nonumber
    nmap <buffer> <C-l> <C-w>l
endfunction

augroup my-fern
    autocmd! *
    autocmd FileType fern call s:init_fern()
augroup END

let g:fern#renderer = "nerdfont"
