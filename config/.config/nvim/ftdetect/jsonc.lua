--json with comments
vim.cmd([[
	autocmd BufNewFile,BufRead tsconfig.json setlocal filetype=jsonc
]])
