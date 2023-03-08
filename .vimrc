if !1 | finish | endif

" VIM Juanmi Taboada:
" Version: 20230308
" Author: Juanmi Taboada <juanmi@juanmitaboada.com> - http://www.juanmitaboada.com
"
" === CHEATSHEET ===
"
" *                 Search forward word under the cursor    [ vim ]
" n                 Search next word using same criteria    [ vim ]
" <Shift>+n         Search previous word using same criteria[ vim ]
" #                 Search backward word under the cursor   [ vim ]
" K                 Search for the word inside the help     [ vim ]
" gd                Go to first definition                  [ vim ]
" <F3>              Tagbar panel (on/off)                   [ tagbar ]
" <F4>              NERD Tree (on/off)                      [ nerdtree ]
" <F8>              Save current session on current folder  [ vim ]
" <Alt>+<up>        Show all buffers                        [ BufferExplorer ]
" <Alt>+<down>      Close current buffer                    [ vim ]
" <Alt>+<left>      Move to previous buffer                 [ vim ]
" <Alt>+<right>     Move to next buffer                     [ vim ]
" <Ctrl>+<up>       Move current line/block up              [ vim ]
" <Ctrl>+<down>     Move current line/block down            [ vim ]
" <Ctrl>+<right>    Indent current line/block one level     [ vim ]
" <Ctrl>+<left>     Unindent current line/block one level   [ vim ]
" <Enter>           Go to function definition               [ vim ]
" <Backspace>       Go back from function definion          [ vim ]
"
" Ultisnips:
" :help ultisnips
" <Control+b> to move to next element
" <Control+z> to move to the previous element
" You write a tag and hit <F2>, possible tags are:
" if        if without else
" ife       if $1 else $2
" eif       else if ($1) { .. }
" el        else ..
" wh        while (cond) ...
" class     class ...
" def       def ...
"
" Comentary:
" To comment from line 7 to 17 both included, use:
" :7,17Commentary
"
" ACK:
" To search everywhere for the word "colors" use:
" :Ack colors
"
" CtrlP:
" To search for files with the word "colors" use:
" <Ctrl+P> colors

" Initialization
execute pathogen#infect()

filetype plugin indent on
syntax on
" colorscheme ron

set bs=2                            " allow backspacing over everything in insert mode
set completeopt=menuone
set tabstop=4
set tw=0                            " Don't wrap lines at 80 columns (or use 79)
set linebreak                       " Don't wrap words by default
set textwidth=0                     " Don't wrap lines by default (or use 79)
set viminfo='20,\"50                " Read/write a .viminfo file, don't store more than
set history=100                     " Keep 100 lines of command line history
set ruler                           " Show the cursor position all the time
set showcmd                         " Show (partial) command in status line.
set showmatch                       " Show matching brackets.
set incsearch                       " Incremental search
set nu                              " Number of lines
set shiftwidth=4
set hlsearch
set hidden
set mouse=a                         " Enable mouse usage (all modes)
set autowrite                       " Automatic writing
set autoread                        " Reload file if changed
set laststatus=2
set ignorecase                      " Do case insensitive matching

" set colorcolumn=80                " Set red column at 80 characters

" Show tabs and end of line
set softtabstop=4
set hardtabs=4
set expandtab
set list
set lcs=extends:$,tab:/.,eol:$
set showmatch
set encoding=utf-8
ab usetab :set noet ci pi sts=0 sw=4 ts=4 " Show tab character

" Remember last position
if has("autocmd")
    autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal `\"" | endif
endif

let g:black_linelength = 79

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:deoplete#enable_at_startup = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#ale#enabled = 1

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
" let g:javascript_plugin_flow = 1

" default folding settings
" set foldmethod=marker   " Using markers: {{{1  ...  }}}1
set foldmethod=indent   " Just perfect for Python
set foldnestmax=10
set nofoldenable
set foldlevel=1

" Clear screen on exist (it will avoid putting colors from vim on your screen)
au VimLeave * :!clear

" Tagbar and NERDTree Toggle
nmap <F3> :TagbarToggle<CR>
imap <F3> <Esc>:TagbarToggle<CR>
map <F4> :NERDTreeToggle<CR>
imap <F4> <Esc>:NERDTreeToggle<CR>

" Ultisnipts controls
let g:UltiSnipsExpandTrigger="<F2>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" ctags controls
" for ctags to work you must make a 'tags' file inside some of your projects
" folder from the list of vim-tags plugin: ['.git', '.hg', '.svn', '.bzr', '_darcs', 'CSV']
" let g:vim_tags_auto_generate = 1
let g:vim_tags_use_language_field = 1
map <cr> <c-]>
map <bs> <c-t>

" Buffer management management
map  <A-Up> :BufExplorer<CR>
map! <A-Up> <Esc>:BufExplorer<CR>
map  <A-Right> :bnext<CR>
map! <A-Right> <Esc>:bnext<CR>
map  <A-Left> :bprevious<CR>
map! <A-Left> <Esc>:bprevious<CR>
map  <A-Down> :bd<CR>
map! <A-Down> <Esc>:bd<CR>

" move lines up and down from grendel-arsenal.googlecode.com
nnoremap <C-Down> :m+<CR>==
nnoremap <C-Up> :m-2<CR>==
inoremap <C-Down> <Esc>:m+<CR>==gi
inoremap <C-Up> <Esc>:m-2<CR>==gi
vnoremap <C-Down> :m'>+<CR>gv=gv
vnoremap <C-Up> :m-2<CR>gv=gv
" move lines right and left several times
nnoremap <C-Left> v<<Esc>
nnoremap <C-Right> v><Esc>
inoremap <C-Left> <Esc>v<<Esc>gi
inoremap <C-Right> <Esc>v><Esc>gi
vnoremap <C-Left> <gv
vnoremap <C-Right> >gv
vnoremap < <gv
vnoremap > >gv

" Save session
nmap <F8> :mks! .session.vim<CR>

" === LINTERS === ==========================================

" SH
" E003: Indent not multiple of 4
" E006: Line too long
" E042: local declaration hides errors

" PYTHON
" E203: Whitespace before ':'
" E501: Line too long
" E503: Line break occurred before a binary operator

" ALE configuration (Asynchronous Linter Engine)
let g:ale_sign_column_always = 1
let g:ale_python_pycodestyle_options = '--ignore=E203,W503'
let g:ale_python_flake8_options = '--ignore=E203,W503'
let g:ale_sh_bashate_options = '--ignore "E003,E006"'
" let g:ale_python_pylint_executable = 'pylint'
" let g:ale_python_pylint_options = '--rcfile ~/.pylintrc'
" let g:ale_linters = { 'python': ['pyflakes3', 'pycodestyle'] , }
" let g:ale_linters = { 'python': ['pyflakes3', 'pycodestyle', 'pylint', 'mypy', 'flake8'] , }
let g:ale_linters = { 'python': ['pyflakes3', 'pycodestyle', 'flake8', 'pep8'] , 'sh': ['bashate', 'shellcheck']}

" Syntactic
" let g:syntastic_python_flake8_args='--ignore=F821,E302'
" let g:syntastic_python_flake8_args='--ignore=E203'
let g:syntastic_python_flake8_args='--ignore=E203,W503'
let g:syntastic_sh_checkers = ['bashate', 'shellcheck']
let g:syntastic_sh_bashate_args = '--ignore "E003,E006"'

let g:pymode_lint_ignore='--ignore=E203,W503'

" ==========================================================


nmap <silent> <C-S-Left> <Plug>(ale_previous_wrap)
nmap <silent> <C-S-Right> <Plug>(ale_next_wrap)

" Show messages in a different manner
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Add support for prospector
autocmd FileType python setlocal makeprg=prospector\ -8\ -o\ pylint\ % errorformat=%f:%l:\ %m
let g:makejob_hide_preview_window = 1
map  <C-x> :MakeJob<CR>:copen<CR><C-w><Up>
map! <C-x> <Esc>:MakeJob<CR>:copen<CR><C-w><Up>

" Add to .vimrc to enable project-specific vimrc
set exrc
set secure
" exrc allows loading local executing local rc files.
" secure disallows the use of :autocmd, shell and write commands in local .vimrc files.

" Vim diff special configuration
if &diff
    set cursorline
    map ] ]c
    map [ [c
    " hi DiffAdd    ctermfg=233 ctermbg=LightGreen guifg=#003300 guibg=#DDFFDD gui=none cterm=none
    " hi DiffChange ctermbg=white  guibg=#ececec gui=none   cterm=none
    " hi DiffText   ctermfg=233  ctermbg=yellow  guifg=#000033 guibg=#DDDDFF gui=none cterm=none
    " hi DiffAdd      gui=none    guifg=NONE          guibg=#bada9f
    " hi DiffChange   gui=none    guifg=NONE          guibg=#e5d5ac
    " hi DiffDelete   gui=bold    guifg=#ff8080       guibg=#ffb0b0
    " hi DiffText     gui=none    guifg=NONE          guibg=#8cbee2
endif

" Black support
augroup black_on_save
 autocmd!
 autocmd BufWritePre *.py Black
augroup end
nnoremap <F9> :Black<CR>

" ISort
" nnoremap <F10> :Isort<CR>

" JSON Format
nnoremap <C-j> :%!python -m json.tool<CR>

let g:radon_always_on=1
