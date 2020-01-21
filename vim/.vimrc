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

" Behavior
" ---

noremap <Up> <NOP>                  " disable up key in normal mode
noremap <Down> <NOP>                " disable down key in normal mode
noremap <Left> <NOP>                " disable left key in normal mode
noremap <Right> <NOP>               " disable right key in normal mode
noremap <Leader>h :<C-u>split<CR>   " easier horizontal splitting
noremap <Leader>v :<C-u>vsplit<CR>  " easier vertical splitting
map <C-h> <C-w>h                    " easier navigation between splits
map <C-j> <C-w>j                    " easier navigation between splits
map <C-k> <C-w>k                    " easier navigation between splits
map <C-l> <C-w>l                    " easier navigation between splits

" Plugin Configuration
" ---

" scrooloose/nerdtree
let g:NERDTreeShowHidden=1            " nerdtree closed on launch
noremap <Leader>1 :NERDTreeToggle<CR> " toggles nerdtree on/off
noremap <leader>2 :NERDTreeFocus<CR>  " toggles nerdtree focus

" vim-airline/vim-airline-theme
let g:airline_theme='minimalist'      " airline theme

" vim-better-whitespace
let g:better_whitespace_enabled=1     " enable better whitespace

" Vagrant syntax highlighting
augroup vagrant
  au!
  au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END

" hashivim/vim-terraform
let g:terraform_fmt_on_save = 1       " run `terraform fmt` on save
