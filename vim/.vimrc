" ==============================
" vim-plug setup
" ==============================
call plug#begin('~/.vim/plugged')

""  Navigation
Plug 'scrooloose/nerdtree'

"" Theming
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"" Tooling
Plug 'ntpeters/vim-better-whitespace'

"" Autocomplete
Plug 'tpope/vim-endwise'
Plug 'ervandew/supertab'

"" HashiCorp
Plug 'hashivim/vim-terraform', { 'for': 'hcl' }
Plug 'juliosueiras/vim-terraform-completion', { 'for': 'hcl' }
Plug 'fatih/vim-hclfmt'

"" Python
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'nvie/vim-flake8', { 'for': 'python' }

call plug#end()

" ==============================
" Settings
" ==============================

set nocompatible
set noshowmode

" Visual
syntax enable
filetype plugin indent on
set ruler
set number
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set background=dark
silent! colorscheme solarized

" Behavior
let mapleader=','
set noerrorbells                            " please shut up
set backspace=indent,eol,start              " make backspace useful
set incsearch
set hlsearch

" NERDTree
let g:NERDTreeShowHidden=1
noremap <Leader>3 :NERDTreeToggle<CR> 

" Airline
let g:AirlineTheme='solarized'
let g:airline_solarized_bg='dark'

" vim-better-whitespace
let g:better_whitespace_enabled=1

" Python
let python_highlight_all=1
