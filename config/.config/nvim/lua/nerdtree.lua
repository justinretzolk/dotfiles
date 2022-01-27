-- start nerdtree on launch and put the cursor back in the other window.
vim.cmd([[
	autocmd VimEnter * NERDTree | wincmd p
]])

-- exit vim if nerdtree is the only window left.
vim.cmd([[
	autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
]])

-- if another buffer tries to replace nerdtree, put it in the other window, and bring back nerdtree.
vim.cmd([[
	autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
]])
