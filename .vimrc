" vundle config - must be first
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" vundle-managed plugins
Plugin 'scrooloose/nerdtree'
nmap <C-n> :NERDTreeToggle<CR>

Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>
let g:tagbar_sort = 0
let g:tagbar_type_typescript = {
  \ 'ctagsbin' : 'tstags',
  \ 'ctagsargs' : '-f-',
  \ 'kinds': [
    \ 'e:enums:0:1',
    \ 'f:function:0:1',
    \ 't:typealias:0:1',
    \ 'M:Module:0:1',
    \ 'I:import:0:1',
    \ 'i:interface:0:1',
    \ 'C:class:0:1',
    \ 'm:method:0:1',
    \ 'p:property:0:1',
    \ 'v:variable:0:1',
    \ 'c:const:0:1',
  \ ],
  \ 'sort' : 0
\ }

Plugin 'Yggdroot/indentLine'
let g:indentLine_char = '|'
let g:indentLine_color_term = 239 
let g:indentLine_color_gui = '#A4E57E'

Plugin 'sickill/vim-monokai'

Plugin 'leafgarland/typescript-vim'

" indentLine config
set runtimepath+=~/.vim/bundle/indentLine/after
" end vundle config
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
hi Normal ctermbg=none
hi NonText ctermbg=none

" folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" remember files' fold states
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" increase initial tab limit
set tabpagemax=100

" cmd line suggestions
set wildmenu

" current line caret
set cursorline

" show in-progress cmds
set showcmd

