" ==============================
" vim-plug setup
" ==============================
call plug#begin('~/.vim/plugged')

""  Navigation
Plug 'scrooloose/nerdtree'

"" Theming
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"" Tooling
Plug 'ntpeters/vim-better-whitespace'

"" Autocomplete
Plug 'tpope/vim-endwise'

"" HashiCorp
Plug 'hashivim/vim-terraform', { 'for': 'hcl' }
Plug 'juliosueiras/vim-terraform-completion', { 'for': 'hcl' }
Plug 'fatih/vim-hclfmt'
Plug 'hashicorp/sentinel.vim'

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
set relativenumber
set wrap
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set modifiable
" silent! colorscheme "Tomorrow-Night"

" Behavior
let mapleader=','
set noerrorbells
set backspace=indent,eol,start
set incsearch
set hlsearch
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" NERDTree
let g:NERDTreeShowHidden=1
noremap <Leader>1 :NERDTreeToggle<CR>
noremap <leader>2 :NERDTreeFocus<CR>

" Airline
let g:airline_theme='minimalist'

" vim-better-whitespace
let g:better_whitespace_enabled=1

" Vagrantfile syntax highlighting the hard way
" https://github.com/hashicorp/vagrant/blob/master/contrib/vim/vagrantfile.vim
augroup vagrant
  au!
  au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END
