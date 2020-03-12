set nocompatible " be iMproved, required
filetype off     " required

"=====================================================
" Plugins 
"=====================================================
" set the runtime path to include Vundle and initialize
call plug#begin('~/.config/nvim/plugins')

"---------=== Code/project navigation ===-------------
Plug 'scrooloose/nerdtree'                    " A tree explorer plugin for vim
Plug 'Shougo/unite.vim'                       " Navigation between buffers and files

"------------------=== Other ===----------------------
Plug 'vim-airline/vim-airline'                " Lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline-themes'         " Themes for vim-airline
Plug 'rosenfeld/conque-term'                  " Consoles as buffers
Plug 'tpope/vim-surround'                     " Parentheses, brackets, quotes, XML tags, and more

"---------------=== Languages support ===-------------
Plug 'dense-analysis/ale'                     " Async syntax checker / files fix, with Language Server Protocol support
Plug 'Shougo/deoplete.nvim'                   " 

" --- Rust ---
Plug 'rust-lang/rust.vim'                     " Vim support for Rust file detection and syntax highlighting

call plug#end() " required
filetype on
filetype plugin on
filetype plugin indent on

"=====================================================
" General settings
"=====================================================
set backspace=indent,eol,start

" This must happen before the syntax system is enabled
aunmenu Help.
aunmenu Window.
let no_buffers_menu=1
set mousemodel=popup

" Activate a permanent ruler and add line highlightng as well as numbers.
" Also disable the sucking pydoc preview window for the omni completion
" and highlight current line and disable the blinking cursor.
set ruler
set completeopt-=preview
set gcr=a:blinkon0
" set cursorline
set ttyfast

syntax on
colorscheme nightly
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12

" Enable true color support if it possible (e.g. iTerm2 supports it)
if has("termguicolors")
    set termguicolors
endif

tab sball
set switchbuf=useopen

" Use system clipboard
set clipboard=unnamedplus

" Customize the wildmenu
set wildmenu
set wildignore+=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class,*/*.dSYM/*,*.dylib
set wildmode=list:full

" Don't bell and blink
set visualbell t_vb=    " turn off error beep/flash
set noerrorbells        " turn off sound bell
set enc=utf-8           " utf-8 default encoding
set ls=2                " always show status bar
set incsearch           " incremental search
set hlsearch            " highlighted search results
set nu                  " show line numbers
set scrolloff=5         " keep some more lines for scope
set showmatch           " show matching brackets/parenthesis
set matchtime=0         " don't blink when matching

" Swaps and backups
if has("win32") || has("win64")
    set dir=$TMP
    set backupdir=$TMP
else
    set dir=/tmp
    set backupdir=/tmp
endif

" Tab settings (default)
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" NERDTree
nmap <F1> <nop>                 " unmap <F1> with help
map <F1> :NERDTreeToggle<CR>    " browse the list of files in the current directory

" Unite settings
nnoremap <F2> :Unite buffer<CR> " browse a list of the currently opened buffers

" ConqueTerm
nnoremap <F5> :ConqueTermSplit ipython<CR>                      " run python-scripts at <F5>
nnoremap <F6> :exe "ConqueTermSplit ipython " . expand("%")<CR> " and debug-mode for <F6>
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_CloseOnEnd = 0

" Vim-Airline
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1

" Ale
let g:ale_fixers = {
      \   'rust': ['rustfmt'],
      \}

let g:ale_linters = {
      \'rust': ['rls'],
      \}

let g:ale_fix_on_save = 1
let g:ale_rust_rls_toolchain = 'nightly-2020-03-12'

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources = {'rust': ['ale', 'racer']}

"=====================================================
" User hotkeys
"=====================================================
" Easier moving of code blocks
vnoremap < <gv " Shift+> keys
vnoremap > >gv " Shift+< keys

" Backspace in Visual mode deletes selection
vnoremap <BS> d

" Split managment
noremap <silent> ß :split<CR>   " Split horizontal, ALT-s
noremap <silent> √ :vsplit<CR>  " Split vertical, ALV-v

" Moving between splits
noremap <silent> <C-h> <c-w>hhh  " move to the left subwindows, CTRL-h
noremap <silent> <C-l> <c-w>lhh  " move to the right subwindow, CTRL-l
noremap <silent> <C-k> <c-w>khh  " move to the upper subwindow, CTRL-k
noremap <silent> <C-j> <c-w>jhh  " move to the lower subwindow, CTRL-j

" Easier change size for splitted window
map <silent> ∆ <C-w>>       " Increase size of the vertical split, ALT-j
map <silent> ˆ <C-W>+       " Increase size of the horizontal split, ALT-i
map <silent> ˚ <C-W>-       " Decrease size of the horizontal split, ALT-k
map <silent> ¬ <C-w><       " Decrease size of the vertical split, ALT-l

" Activate autocomplete at <Ctrl+Space>
inoremap <C-space> <C-x><C-o>

"=====================================================
" Languages support
"=====================================================

