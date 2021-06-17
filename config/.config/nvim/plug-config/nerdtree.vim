" most configuration options used here may be found at:
" https://github.com/preservim/nerdtree

" ---
"  keymappings
" ---

" focus on nerdtree
noremap <leader>1 :NERDTreeFocus<CR>
" toggle nerdtree open/closed
noremap <Leader>2 :NERDTreeToggle<CR>
" set nerdtree to the vcs root dir
noremap <Leader>3 :NERDTreeVCS<CR>

" ---
"  behavior
" ---

" show hidden files
let g:NERDTreeShowHidden=1

" start nerdtree on launch and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" exit vim if nerdtree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" if another buffer tries to replace nerdtree, put it in the other window, and bring back nerdtree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
