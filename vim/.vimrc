set nocompatible " be iMproved, required
filetype off     " required

"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'                      " let Vundle manage Vundle, required
"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree'                    " A tree explorer plugin for vim
Plugin 'Shougo/unite.vim'                       " Navigation between buffers and files

"------------------=== Other ===----------------------
Plugin 'vim-airline/vim-airline'                " Lean & mean status/tabline for vim that's light as air
Plugin 'vim-airline/vim-airline-themes'         " Themes for vim-airline
Plugin 'rosenfeld/conque-term'                  " Consoles as buffers
Plugin 'tpope/vim-surround'                     " Parentheses, brackets, quotes, XML tags, and more

"--------------=== Snippets support ===---------------
Plugin 'garbas/vim-snipmate'                    " Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'           " Dependencies #1
Plugin 'tomtom/tlib_vim'                        " Dependencies #2
Plugin 'honza/vim-snippets'                     " Snippets repo

"---------------=== Languages support ===-------------
Plugin 'scrooloose/syntastic'                   " Syntax checking plugin for Vim
Plugin 'tpope/vim-commentary'                   " Comment stuff out
Plugin 'mitsuhiko/vim-sparkup'                  " Sparkup (XML/jinja/htlm-django/etc.) support

" --- Erlang ---
Plugin 'jimenezrick/vimerl'                     " The Erlang plugin for Vim

" --- Elixir ---
Plugin 'slashmili/alchemist.vim'                " Elixir support for vim

" --- CSS ---
Plugin 'JulesWang/css.vim'                      " CSS syntax file
Plugin 'groenewege/vim-less'                    " Vim syntax for LESS (dynamic CSS)

" --- JavaScript ---
Plugin 'pangloss/vim-javascript'                " Vastly improved Javascript indentation and syntax support in Vim

" --- HTML ---
Plugin 'othree/html5.vim'                       " HTML5 omnicomplete and sytnax
Plugin 'idanarye/breeze.vim'                    " Html navigation like vim-easymotion, tag matching, tag highlighting and DOM navigation

" --- Python ---
Plugin 'davidhalter/jedi-vim'                   " Awesome Python autocompletion with VIM
Plugin 'klen/python-mode'                       " Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box
Plugin 'mitsuhiko/vim-jinja'                    " Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'          " Combined Python 2/3 for Vim
Plugin 'hynek/vim-python-pep8-indent'           " PEP8 indent
Plugin 'jmcantrell/vim-virtualenv'              " Virtualenv support in VIM

" --- Rust ---
Plugin 'rust-lang/rust.vim'                     " Vim support for Rust file detection and syntax highlighting
Plugin 'racer-rust/vim-racer'                   " Rust code completion in vim via racer

" --- Terraform ---
Plugin 'hashivim/vim-terraform'                 " Terraform syntax highlight
Plugin 'juliosueiras/vim-terraform-completion'  " Terraform auto-completion

call vundle#end() " required
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
if has("gui_running")
    set cursorline
endif
set ttyfast

colorscheme nightly
" set guifont=Consolas:h13
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12

" Enable Syntax Colors
" in GUI mode we go with fruity and Monaco 13
" in CLI mode myterm looks better (fruity is GUI only)
syntax on
if has("gui_running")
    set macmeta " comment this line if you're not using Mac OS
    set lines=50 columns=125
endif
" special settings for vim
if has("mac")
    let macvim_hig_shift_movement = 1
endif

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
"set noerrorbells        " turn off sound bell
set novisualbell        " turn off visual bell
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

" Hide some panels
"set guioptions-=m  " remove menu bar
set guioptions-=T   " remove toolbar
"set guioptions-=r  " remove right-hand scroll bar

" Tab Settings
set smarttab
set tabstop=4

" Highlight characters past column 100
augroup vimrc_autocmds
    autocmd!
    autocmd FileType ruby,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=#c12a0f
    autocmd FileType ruby,python,javascript,c,cpp match Excess /\%100v.*/
    autocmd FileType ruby,python,javascript,c,cpp set nowrap
augroup END

" SnipMate settings
let g:snippets_dir = "~/.vim/vim-snippets/snippets"

" NERDTree
nmap <F1> <nop>                 " unmap <F1> with help
map <F1> :NERDTreeToggle<CR>    " browse the list of files in the current directory

" Unite settings
nnoremap <F2> :Unite buffer<CR> " browse a list of the currently opened buffers

" ConqueTerm
nnoremap <F5> :ConqueTermSplit ipython<CR> " run python-scripts at <F5>
nnoremap <F6> :exe "ConqueTermSplit ipython " . expand("%")<CR> " and debug-mode for <F6>
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_CloseOnEnd = 0

" Jedi-vim
let g:jedi#show_call_signatures = 1 " show call signatures
let g:jedi#popup_on_dot = 1         " enable autocomplete on dot
let g:jedi#popup_select_first = 0   " disable first select from auto-complete

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
noremap <f7> :w<CR>:SyntasticCheck<CR>

" Better :sign interface symbols
let g:syntastic_error_symbol = 'X'
let g:syntastic_style_error_symbol = 'X'
let g:syntastic_warning_symbol = 'x'
let g:syntastic_style_warning_symbol = 'x'

" Vim-Airline
let g:airline_theme='powerlineish'

"=====================================================
" Python-mode settings
"=====================================================
" Python-mode
" Activate rope
" Keys:
" K Show python docs
" <Ctrl-Space> Rope autocomplete
" <Ctrl-c>g Rope goto definition
" <Ctrl-c>d Rope show documentation
" <Ctrl-c>f Rope find occurrences
" <Leader>b Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[ Jump on previous class or function (normal, visual, operator modes)
" ]] Jump on next class or function (normal, visual, operator modes)
" [M Jump on previous class or method (normal, visual, operator modes)
" ]M Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'
" Linting
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pylint', 'pep8']
let g:pymode_lint_cwindow = 1
let g:pymode_lint_ignore="E501,W601,C0110,C0111"
let g:pymode_lint_write = 0

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" Syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Get possibility to run Python code
let g:pymode_run = 0

" Other options
let g:pymode_options_colorcolumn = 0
if has("gui_running")
    let g:airline_powerline_fonts = 1
else
    let g:airline_powerline_fonts = 0
endif

"=====================================================
" User hotkeys
"=====================================================
" Easier moving of code blocks
vnoremap < <gv " Shift+> keys
vnoremap > >gv " Shift+< keys

" Backspace in Visual mode deletes selection
vnoremap <BS> d

" CTRL-Z is Undo
noremap <C-z> u
inoremap <C-z> <C-O>u

" CTRL-Y is Redo
noremap <C-y> <C-R> 
inoremap <C-y> <C-O><C-R>

" CTRL-A is Select all
noremap <C-a> gggH<C-O>G
inoremap <C-a> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-a> <C-C>gggH<C-O>G
onoremap <C-a> <C-C>gggH<C-O>G
snoremap <C-a> <C-C>gggH<C-O>G
xnoremap <C-a> <C-C>ggVG

" CTRL-S is Quicksave command
noremap <C-s> :update<CR>
vnoremap <C-s> <C-C>:update<CR>
inoremap <C-s> <C-O>:update<CR>

" Settings for buffers
map <C-q> :bd!<CR>          " close current buffer, CTRL-q
noremap <C-Right> :bn<CR>  " move to next buffer, CTRL-Right
noremap <C-Left> :bp<CR>   " move to previous buffer, CTRL-Left

" Easier split navigations
nnoremap <silent> <C-j> <c-w>h  " move to the right subwindows, CTRL-j
nnoremap <silent> <C-l> <c-w>l  " move to the upper subwindow, CTRL-i
nnoremap <silent> <C-i> <c-w>k  " move to the lower subwindow, CTRL-k
nnoremap <silent> <C-k> <c-w>j  " move to the left subwindow, CTRL-l

" Split managment
map <silent> <A-s> :split<CR>   " Split horizontal, ALT-s
map <silent> <A-v> :vsplit<CR>  " Split vertical, ALV-v

" Easier change size for splitted window
map <silent> <A-j> <C-w>>  " Increase size of the vertical split, ALT-j
map <silent> <A-i> <C-W>+  " Increase size of the horizontal split, ALT-i
map <silent> <A-k> <C-W>-  " Decrease size of the horizontal split, ALT-k
map <silent> <A-l> <C-w><  " Decrease size of the vertical split, ALT-l

" Activate autocomplete at <Ctrl+Space>
inoremap <C-space> <C-x><C-o>

" Python code check on PEP8
autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>

"=====================================================
" Languages support
"=====================================================
" --- C/C++/C# ---
autocmd FileType c setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType cs setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType c setlocal commentstring=/*\ %s\ */
autocmd FileType cpp,cs setlocal commentstring=//\ %s
let c_no_curly_error=1
let g:syntastic_cpp_include_dirs = ['include', '../include']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_c_include_dirs = ['include', '../include']
let g:syntastic_c_compiler = 'clang'

" --- CSS ---
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType css setlocal commentstring=/*\ %s\ */

" --- Erlang ---
autocmd Filetype erlang setlocal omnifunc=erlang_complete#Complete

" --- Elixir ---
autocmd Filetype erlang setlocal omnifunc=erlang_complete#Complete

" --- JavaScript ---
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd BufNewFile,BufRead *.json setlocal ft=javascript
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal commentstring=//\ %s
autocmd FileType javascript let b:javascript_fold = 0
let javascript_enable_domhtmlcss=1
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_jshint_args='--config ~/.vim/extern-cfg/jshint.json'

" --- HTML ---
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType html setlocal commentstring=<!--\ %s\ -->

" --- Python ---
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
let python_slow_sync=1
autocmd FileType python setlocal completeopt-=preview
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
let g:syntastic_python_checkers = ['flake8', 'python']
let g:syntastic_python_flake8_args='--ignore=E121,E128,E711,E301,E261,E241,E124,E126,E721
\ --max-line-length=80'

" --- Rust ---
set hidden
let g:racer_cmd = "~/.cargo/bin/racer"
autocmd BufRead,BufNewFile *.rs set filetype=rust
autocmd FileType rust setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4
autocmd FileType rust setlocal commentstring=//\ %s

" --- Terraform ---
let g:syntastic_terraform_tffilter_plan = 1
let g:terraform_completion_keys = 0
let g:terraform_registry_module_completion = 0

" --- Vim ---
autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2
