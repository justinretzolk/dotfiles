" Plugins
" ---

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'                                      " tree style directory navigation
Plug 'vim-airline/vim-airline'                                  " status line
Plug 'vim-airline/vim-airline-themes'                           " themes for status line
Plug 'ntpeters/vim-better-whitespace'                           " highlight whitespace
Plug 'tpope/vim-endwise'                                        " autocompletion of endings
Plug 'hashivim/vim-terraform', { 'for': 'hcl' }                 " syntax hightlighting for terraform
Plug 'juliosueiras/vim-terraform-completion', { 'for': 'hcl' }  " autocompletion for terraform
Plug 'hashicorp/sentinel.vim'                                   " syntax highlighting for sentinel
Plug 'elzr/vim-json'                                            " syntax highlighting for json
call plug#end()

" ---
" Settings
" ---

let mapleader=','                     " remap leader
set backspace=indent,eol,start        " allow real backspacing
set nocompatible                      " make it viM
set nobackup                          " don't use a backup file
set colorcolumn=81,121                " highlight columns
set cursorline                        " underline the current line
set autoindent                        " indent based on the previous line
set smartindent                       " indent based on syntax
set relativenumber                    " use relative line numbers
set number                            " show the line number of current line
set wrap                              " wrap lines by default
set softtabstop=2                     " number of spaces tab uses
set shiftwidth=2                      " number of spaces to use for indent
set expandtab                         " use spaces instead of tabs
set modifiable                        " allow modifying a ro file (for NERDTree)
set mouse=a                           " allow mouse selection via visual mode
set clipboard=unnamed                 " yank to macOS clipboard
set noerrorbells                      " don't yell at me
set incsearch                         " show searches while typing
set hlsearch                          " highlight searches
set ignorecase                        " ignore cases
set smartcase                         " override ignorecase when searching with a caps
silent! colorscheme "Tomorrow-Night"  " colorscheme

" ---
" Behavior
" ---

" disable direction keys in normal mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" easier splitting
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" easier navigation between splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Vagrant syntax highlighting
augroup vagrant
  au!
  au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END

" ---
" Plugin Configuration
" ---

" scrooloose/nerdtree
" nerdtree closed on launch
let g:NERDTreeShowHidden=1
" toggle and focus mapping
noremap <Leader>1 :NERDTreeToggle<CR>
noremap <leader>2 :NERDTreeFocus<CR>

" vim-airline/vim-airline-theme
" ---
" airline theme
let g:airline_theme='minimalist'

" vim-better-whitespace
" ---
" enable better whitespace
let g:better_whitespace_enabled=1
