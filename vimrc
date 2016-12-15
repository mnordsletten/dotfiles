""" Vundle setup

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""" Vundle setup done

""" Plugins (Install with :PluginInstall in vim)
Plugin 'tmhedberg/SimpylFold'			" folding of code
Plugin 'vim-scripts/indentpython.vim'		" Indent smarter
Plugin 'scrooloose/syntastic'			" Check syntax every time you save
Plugin 'nvie/vim-flake8'			" Should do pep8 checks
Plugin 'jnurmine/Zenburn'			" Terminal mode colors
Plugin 'scrooloose/nerdtree'			" File tree
Plugin 'jistr/vim-nerdtree-tabs'		" Tabs in the file tree
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-fugitive'			" Adds git commands
Bundle "myusuf3/numbers.vim"
Bundle 'klen/python-mode'


" Allow mouse scrolling vim + iterm2
set mouse=a

" Use jj to act as <esc>
:imap jj <Esc>


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
" See docstrings for folded code
let g:SimpylFold_docstring_preview=1

" Indentation for python and bash scripts
au BufNewFile,BufRead *.py 
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix 

au BufNewFile,BufRead *.sh 
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=150 |

" Flag unnecessary whitespace
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" UTF-8 support
set encoding=utf-8

" flake8 settings
let g:syntastic_python_flake8_args='--ignore=E501'

" Syntax highlighting python
let python_highlight_all=1
syntax on

" Color schemes
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

" Hide .pyc files in file browser
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Line numbers
set nu

" Map ctrl+n to toggle NERDTree 
map <C-n> :NERDTreeToggle<cr> 
nnoremap <C-t> :call NumberToggle()<cr>

" Mapping for running python code using CTRL+m
"autocmd FileType python nnoremap <buffer> <C-m> :w<CR>:exec '!python' shellescape(@%, 1)<cr>
autocmd FileType python nnoremap <buffer> <C-m> :w<CR>:!python ./%<cr>

" Mapping for running shell code using CTRL+m
autocmd FileType sh nnoremap <buffer> <C-m> :w<CR>:!./%<cr>

" Automatically insert ipdb debug line
:map <C-i> oimport ipdb; ipdb.set_trace(context=10) <esc>

" Let terminal use 256 colors
let &t_Co=256

" Prevent documentation window from popping up
set completeopt=menu

" Toggles for line numbers
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

" Display powerline always
set laststatus=2

" Python-mode
" " Activate rope
" " Keys:
" " K             Show python docs
" " <Ctrl-Space>  Rope autocomplete
" " <Ctrl-c>g     Rope goto definition
" " <Ctrl-c>d     Rope show documentation
" " <Ctrl-c>f     Rope find occurrences
" " <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" " [[            Jump on previous class or function (normal, visual, operator
" modes)
" " ]]            Jump on next class or function (normal, visual, operator
" modes)
" " [M            Jump on previous class or method (normal, visual, operator
" modes)
" " ]M            Jump on next class or method (normal, visual, operator
" modes)

let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'

" Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1
let g:pymode_lint_ignore = "E501"

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
"let g:pymode_syntax = 1
"let g:pymode_syntax_all = 1
"let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 1
