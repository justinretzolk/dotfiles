-- gitignore file type detection
vim.cmd([[
	autocmd BufNewFile,BufRead */.config/git/* set filetype=gitconfig
]])
