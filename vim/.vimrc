" no vi-compatible
set nocompatible
set backspace=indent,eol,start
filetype off

"=====================================================
" Vundle settings
"=====================================================
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

"---------=== Code/project navigation ===-------------
" NERDTree - Project and file navigation
Bundle 'scrooloose/nerdtree'
" TagBar - Class/module browser
Bundle 'majutsushi/tagbar'

"------------------=== Other ===----------------------
" vim-airline
Bundle 'bling/vim-airline'
" Extension for buffers
Bundle 'fholgado/minibufexpl.vim'
" Pending tasks list
Bundle 'fisadev/FixedTaskList.vim'
" Consoles as buffers
Bundle 'rosenfeld/conque-term'
" Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML 
" tags, and more. The plugin provides mappings to easily delete, change and 
" add such surroundings in pairs.
Bundle 'tpope/vim-surround'
" Terminal at VIM
Bundle 'rosenfeld/conque-term'

"--------------=== Snippets support ===---------------
" Snippets manager (SnipMate), dependencies, and snippets repo
Bundle 'garbas/vim-snipmate'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'

"---------------=== Languages support ===-------------
" reStructuredText Syntax for Vim
Bundle 'mitsuhiko/vim-rst'

" --- Python ---
" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
Bundle 'klen/python-mode'
" Jedi-vim autocomplete plugin 
Bundle 'davidhalter/jedi-vim'
" Jinja for vim
Bundle 'mitsuhiko/vim-jinja'
" Combined Python 2/3 for Vim
Bundle 'mitsuhiko/vim-python-combined'

filetype on
filetype plugin on
filetype plugin indent on

"=====================================================
" General settings
"=====================================================
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

" Enable Syntax Colors
" in GUI mode we go with fruity and Monaco 13
" in CLI mode myterm looks better (fruity is GUI only)
syntax on
if has("gui_running")
" GUI? Then maximize windows and set custom color sheme
  set lines=80 columns=125
  colorscheme molokai
" automatically open at startup
" autocmd vimenter * TagbarToggle
" autocmd vimenter * NERDTree
" autocmd vimenter * if !argc() | NERDTree | endif

" special settings for vim
if has("mac")
  set guifont=Consolas:h13
  set fuoptions=maxvert,maxhorz
" does not work properly on os x
" au GUIEnter * set fullscreen
else
" set default font for GUI
  set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 10
endif
else
" Oh, its terminal... then what we do...
  colorscheme myterm
endif

tab sball
set switchbuf=useopen

" Don't bell and blink
set visualbell t_vb=    " turn off error beep/flash
set novisualbell        " turn off visual bell

" Utf-8 default encoding
set enc=utf-8

" Always show status bar
set ls=2

" Incremental search
set incsearch

" Highlighted search results
set hlsearch

" Line numbers
set nu

" Keep some more lines for scope
set scrolloff=5

" Disable swaps and backups
set nobackup " no backup files
set nowritebackup " only in case you don't want a backup file while editing
set noswapfile " no swap files

" Hide some panels
"set guioptions-=m "remove menu bar
set guioptions-=T "remove toolbar
"set guioptions-=r "remove right-hand scroll bar

" Tab Settings
set smarttab
set tabstop=8

" Highlight characters past column 80
augroup vimrc_autocmds
    autocmd!
    autocmd FileType ruby,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType ruby,python,javascript,c,cpp match Excess /\%80v.*/
    autocmd FileType ruby,python,javascript,c,cpp set nowrap
augroup END

" SnipMate settings
let g:snippets_dir = "~/.vim/vim-snippets/snippets"

" Vim-Airline settings
set laststatus=2
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1

" TagBar settings
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 0 " autofocus on Tagbar open

" NerdTree settings
map <F3> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']

" TaskList settings
map <F2> :TaskList<CR> " show pending tasks list

" MiniBufExplorer settings
map <C-q> :MBEbd<CR> " close current buffer
hi MBENormal               guifg=#808080 guibg=fg
hi MBEChanged              guifg=#CD5907 guibg=fg
hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
hi MBEVisibleChanged       guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg

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

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

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

"=====================================================
" Jedi-vim
"=====================================================
" Disable choose first function/method at autocomplete 
let g:jedi#popup_select_first = 0  

"=====================================================
" User hotkeys
"=====================================================

" Easier moving of code blocks
vnoremap < <gv " Shift+> keys
vnoremap > >gv " Shift+< keys

" Backspace in Visual mode deletes selection
vnoremap <BS> d

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>	"+gP
map <S-Insert>	"+gP
cmap <C-V>	<C-R>+
cmap <S-Insert>	<C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature. They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
imap <S-Insert>	<C-V>
vmap <S-Insert>	<C-V>

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
noremap <C-s>	:update<CR>
vnoremap <C-s>	<C-C>:update<CR>
inoremap <C-s>	<C-O>:update<CR>

" CTRL-O is Quickopen file
noremap <C-o> :browse confirm e<CR>
vnoremap <C-o> :browse confirm e<CR>
inoremap <C-o> :browse confirm e<CR>

" CTRL-O is Quicksave as.. file
noremap <C-S-s>	 :browse confirm saveas<CR>
vnoremap <C-S-s> :browse confirm saveas<CR>
inoremap <C-S-s> :browse confirm saveas<CR>

" Shift+Arrows to select block/lines
" Activate visual mode in normal mode
nmap <S-Up> V
nmap <S-Down> V
" These are mapped in visual mode
vmap <S-Up> k
vmap <S-Down> j

" Bind <Ctrl+Arrows> keys to move between the tabs
noremap <C-Right> :bn<CR>
noremap <C-Left> :bp<CR>

" ConqueTerm
" Run Python-scripts at <F5>
" let g:pymode_run_key = '<F5>'
nnoremap <F5> :ConqueTermSplit ipython<CR>
" and debug-mode for <F6>
nnoremap <F6> :exe "ConqueTermSplit ipython " . expand("%")<CR>
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_CloseOnEnd = 0
      
" Python code check on PEP8
autocmd FileType python map <buffer> <leader>8 :PyLint<CR>

" Activate autocomplete at <Ctrl+Space>
inoremap <C-space> <C-x><C-o>

" Generate and insert UUID4 into code by <F12> key
nnoremap <F12> :call InsertUUID4()<CR>

" Easy switching languages
nnoremap <leader>Th :set ft=htmljinja<CR>
nnoremap <leader>Tp :set ft=python<CR>
nnoremap <leader>Tj :set ft=javascript<CR>
nnoremap <leader>Tr :set ft=rst<CR>
nnoremap <leader>Tc :set ft=css<CR>
nnoremap <leader>Td :set ft=django<CR>

"=====================================================
" Languages support
"=====================================================

" --- C/C++/C# ---
let c_no_curly_error=1
autocmd FileType c setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType cs setlocal tabstop=8 softtabstop=4 shiftwidth=4 expandtab

" --- Python ---
autocmd FileType python set completeopt-=preview " its need for jedi-vim
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

" --- Ruby ---
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" --- JavaScript ---
let javascript_enable_domhtmlcss=1
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd BufNewFile,BufRead *.json setlocal ft=javascript

" --- HTML ---
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" --- template language support (SGML / XML too) ---
autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd bufnewfile,bufread *.rhtml setlocal ft=eruby
autocmd BufNewFile,BufRead *.mako setlocal ft=mako
autocmd BufNewFile,BufRead *.tmpl setlocal ft=htmljinja
autocmd BufNewFile,BufRead *.py_tmpl setlocal ft=python
autocmd BufNewFile,BufRead *.html,*.htm call s:SelectHTML()
let html_no_rendering=1
let g:closetag_default_xml=1
let g:sparkupNextMapping='<c-l>'
autocmd FileType html,htmldjango,htmljinja,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako source ~/.vim/scripts/closetag.vim

" --- CSS ---
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" --- VIM ---
autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2

" --- CMake ---
autocmd BufNewFile,BufRead CMakeLists.txt setlocal ft=cmake

" --- RST ---
autocmd BufNewFile,BufRead *.txt setlocal ft=rst
autocmd FileType rst setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
\ formatoptions+=nqt textwidth=74

"=====================================================
" User functions
"=====================================================
" Small helper that inserts a random uuid4
" ----------------------------------------
function! InsertUUID4()
python << endpython
if 1:
    import uuid, vim
    s = str(uuid.uuid4())
    cpos = vim.current.window.cursor
    cline = vim.current.line
    vim.current.line = cline[:cpos[1] + 1] + s + cline[cpos[1] + 1:]
    vim.current.window.cursor = (cpos[0], cpos[1] + len(s))
endpython
endfunction

" Define type of html template engine
" ----------------------------------------
fun! s:SelectHTML()
let n = 1
while n < 50 && n < line("$")
" check for jinja
  if getline(n) =~ '{%\s*\(extends\|block\|macro\|set\|if\|for\|include\|trans\)\>'
    set ft=htmljinja
    return
  endif
" check for mako
    if getline(n) =~ '<%\(def\|inherit\)'
      set ft=mako
      return
    endif
" check for genshi
    if getline(n) =~ 'xmlns:py\|py:\(match\|for\|if\|def\|strip\|xmlns\)'
      set ft=genshi
      return
    endif
    let n = n + 1
  endwhile
" go with html
  set ft=html
endfun
