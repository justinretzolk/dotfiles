-- things that don't seem to have a native way to do it
vim.cmd([[colorscheme onedark]])

vim.cmd([[
	filetype plugin indent on
	syntax on
]])

-- native things
vim.g.airline_theme = 'onedark'
vim.g.airline_powerline_fonts = 1
vim.g.better_whitespace_enabled = 1
vim.g.mapleader = ','
vim.g.NERDTreeShowHidden = 1
vim.opt.autoindent = true
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.backup = false
vim.opt.clipboard = 'unnamed'
vim.opt.colorcolumn = { '81', '121' }
vim.opt.compatible = false
vim.opt.completeopt = { 'menuone', 'noselect' }
vim.opt.cursorline = true
vim.opt.errorbells = false
vim.opt.expandtab = false
vim.opt.foldenable = true
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.modifiable = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.showmode = false
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.wrap = true
vim.opt.writebackup = false
