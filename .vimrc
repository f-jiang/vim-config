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

Plug 'scrooloose/nerdtree'                      " filetree browser
Plug 'majutsushi/tagbar'                        " code outline viewer
Plug 'vim-airline/vim-airline'                  " enhanced statusline
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'                     " tmux statusline
Plug 'Yggdroot/indentLine'                      " show indentation guides for space-indented code
Plug 'sickill/vim-monokai'                      " colorschemes
Plug 'junegunn/seoul256.vim'
Plug 'sainnhe/sonokai'
Plug 'leafgarland/typescript-vim'               " ts language support
Plug 'mhinz/vim-signify'                        " diff indicators
Plug 'scrooloose/nerdcommenter'                 " enhanced commenting
Plug 'tpope/vim-surround'                       " easily surround text objects with text
Plug 'ryanoasis/vim-devicons'                   " icons
Plug 'junegunn/fzf'                             " fuzzy finder
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'             " automatic tag generation and updating
Plug 'neoclide/coc.nvim', {'branch': 'release'} " code completion and linting

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

"
" coc config
"

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

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

