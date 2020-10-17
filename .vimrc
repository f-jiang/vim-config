"
" vundle config - must be first
"
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"
" vundle-managed plugins
"

"
" enhanced statusline
"

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 0

" show buffer list
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='murmur'

" shows indentation guides for space-indented code
Plugin 'Yggdroot/indentLine'
set runtimepath+=~/.vim/bundle/indentLine/after
let g:indentLine_char = '│'
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'
autocmd BufWinEnter,WinEnter *\(.*\)\= IndentLinesEnable

" colorschemes
Plugin 'sickill/vim-monokai'

" enhanced commenting
Plugin 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCustomDelimiters = {
    \ 'arduino': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' }
\ }

set encoding=UTF-8

" fuzzy finder
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
let g:fzf_preview_window = 'right:60%'
nnoremap <C-P> :Files<cr>
nnoremap <C-H> :History<cr>
nnoremap <C-M> :Buffers<cr>

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"
" end vundle config
"
call vundle#end()
filetype plugin indent on

" indentation guides for tab chars
set list lcs=tab:\|\ " one space necessary

" incremental search
set hlsearch
set incsearch

" line numbers - hybrid
set number
set relativenumber

" indentation - general
set autoindent
set tabstop=4
set softtabstop=0 expandtab
set shiftwidth=4 smarttab

" syntax highlighting, colour scheme, and background transparency
syntax enable
colorscheme monokai

" folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" remember files' fold states
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview

" increase initial tab limit
set tabpagemax=100

" cmd line suggestions
set wildmenu

" current line caret
set cursorline

" show in-progress cmds
set showcmd

" line-width marker
set colorcolumn=100

" mouse support
set ttymouse=sgr
set mouse=a

" buffer command mappings
nnoremap gn :bn<cr>
nnoremap gp :bp<cr>

" filetype associations
autocmd BufRead,BufNewFile *.launch set filetype=xml
autocmd BufRead,BufNewFile *.urdf set filetype=xml
autocmd BufRead,BufNewFile *.xacro set filetype=xml
autocmd BufRead,BufNewFile *.ino set filetype=cpp
autocmd BufRead,BufNewFile *.cfg set filetype=python

" set web browser
let g:netrw_browsex_viewer='google-chrome'

" show trailing whitespace
set listchars=trail:-

