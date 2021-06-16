" ---
"  vim-plug
" ---

call plug#begin("~/.config/nvim/plugged")
  " lsp and syntax
  Plug 'neovim/nvim-lspconfig'                                " NeoVIM native LSP
  Plug 'hashicorp/sentinel.vim'                               " sentinel syntax highlighting
  Plug 'hashivim/vim-terraform'                               " terraform syntax highlighting
  Plug 'hrsh7th/nvim-compe'                                   " NeoVIM autocomplete
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " tree-sitter
  " utilities
  Plug 'preservim/nerdtree'              " tree style directory navigation
  Plug 'ntpeters/vim-better-whitespace'  " highlight whitespace
  " theming
  Plug 'vim-airline/vim-airline'         " status line
  Plug 'vim-airline/vim-airline-themes'  " themes for status line
  Plug 'ryanoasis/vim-devicons'          " pretty icons and shit
  Plug 'joshdick/onedark.vim'            " onedark theme
call plug#end()

" ---
"  basic settings
" ---
let mapleader=','                 " remap leader
set backspace=indent,eol,start    " allow real backspacing
set nocompatible                  " make it viM
set nobackup                      " don't use a backup file
set nowritebackup                 " again, no backup
set autoindent                    " indent based on the previous line
set smartindent                   " indent based on syntax
set wrap                          " wrap lines by default
set softtabstop=2                 " number of spaces tab uses
set shiftwidth=2                  " number of spaces to use for indent
set expandtab                     " use spaces instead of tabs
set modifiable                    " allow modifying a ro file (for NERDTree)
set clipboard=unnamed             " yank to macOS clipboard
set noerrorbells                  " don't yell at me
set incsearch                     " show searches while typing
set hlsearch                      " highlight searches
set ignorecase                    " ignore cases
set smartcase                     " override ignorecase when searching with a caps
set completeopt=menuone,noselect  " required for nvim-compe

" visual
set relativenumber                " use relative line numbers
set number                        " show the line number of current line
set cursorline                    " underline the current line
set colorcolumn=81,121            " highlight columns
set termguicolors                 " set up colors
colorscheme onedark

" ---
"  behavior
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
"  plugin configuration
" ---

source ~/.config/nvim/plug-config/airline.vim
source ~/.config/nvim/plug-config/better-whitespace.vim
source ~/.config/nvim/plug-config/lsp-config.vim
source ~/.config/nvim/plug-config/nerdtree.vim
source ~/.config/nvim/plug-config/nvim-compe.vim
luafile ~/.config/nvim/plug-config/nvim-compe.lua
