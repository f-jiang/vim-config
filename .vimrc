" filetype detection, filetype-specific scripts and indent scripts
filetype plugin indent on

" tagbar config
set runtimepath+=~/.vim/bundle/tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_sort = 0

" indentLine config
set runtimepath+=~/.vim/bundle/indentLine/after
let g:indentLine_char = '|'
let g:indentLine_color_term = 239 
let g:indentLine_color_gui = '#A4E57E'

" indentation guides for tab chars
set list lcs=tab:\|\ " one space necessary

" incremental search
set hlsearch
set incsearch

" line numbers
set number

" indentation - general
set tabstop=4
set softtabstop=0 expandtab
set shiftwidth=4 smarttab

" indentation by filetype
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" syntax highlighting
syntax enable
colorscheme monokai

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
