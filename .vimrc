"
" vim-plug config
"

" auto-install
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugin list
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'scrooloose/nerdtree'            " filetree browser
Plug 'majutsushi/tagbar'              " code outline viewer
Plug 'vim-airline/vim-airline'        " enhanced statusline
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'           " tmux statusline
Plug 'Yggdroot/indentLine'            " show indentation guides for space-indented code
Plug 'sickill/vim-monokai'            " colorschemes
Plug 'junegunn/seoul256.vim'
Plug 'sainnhe/sonokai'
Plug 'leafgarland/typescript-vim'     " ts language support
Plug 'mhinz/vim-signify'              " diff indicators
Plug 'scrooloose/nerdcommenter'       " enhanced commenting
Plug 'tpope/vim-surround'             " easily surround text objects with text
Plug 'ryanoasis/vim-devicons'         " icons
Plug 'junegunn/fzf'                   " fuzzy finder
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'   " automatic tag generation and updating

call plug#end()

" nerdtree config
nnoremap <F7> :NERDTreeToggle<CR>

" tagbar config
nnoremap <F8> :TagbarToggle<CR>
let g:tagbar_sort = 0
let g:tagbar_iconchars = ['▸', '▾']
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

"
" vim-airline config
"

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" show buffer list
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" indentLine config
set runtimepath+=~/.vim/bundle/indentLine/after
let g:indentLine_char = '│'
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'
autocmd BufWinEnter,WinEnter *\(.*\)\= IndentLinesEnable

" vim-signify config
let g:signify_vcs_list = ['git', 'svn']
let g:signify_realtime = 1

" nerdcommenter config
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCustomDelimiters = {
    \ 'arduino': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' }
\ }

" vim-devicons config
set encoding=UTF-8

" fzf config
let g:fzf_preview_window = ['right:60%', 'ctrl-/']
nnoremap <C-P> :Files<cr>
nnoremap <C-H> :History<cr>
nnoremap <C-J> :Buffers<cr>

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
set shiftround

" syntax highlighting, colour scheme, and background transparency
syntax enable

" colorscheme
if has('termguicolors')
    set termguicolors
endif

let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 0
let g:sonokai_disable_italic_comment = 1
let g:sonokai_show_eob = 1
let g:sonokai_better_performance = 1

colo sonokai

" folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" remember files' fold states
if v:version >= 800
    set viewoptions-=curdir
endif

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
set listchars=trail:~

