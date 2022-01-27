-- things that don't seem to have a native way to do it
local cmd = vim.cmd
cmd 'colorscheme onedark'
cmd 'filetype plugin indent on'
cmd 'syntax on'

-- native globals
local g = vim.g
g.airline_theme = 'onedark'
g.airline_powerline_fonts = 1
g.better_whitespace_enabled = 1
g.mapleader = ','
g.NERDTreeShowHidden = 1

-- local opts
local opt = vim.opt
opt.autoindent = true
opt.backspace = { 'indent', 'eol', 'start' }
opt.backup = false
opt.clipboard = 'unnamed'
opt.colorcolumn = { '81', '121' }
opt.compatible = false
opt.completeopt = { 'menuone', 'noselect' }
opt.cursorline = true
opt.errorbells = false
opt.expandtab = false
opt.foldenable = true
opt.hidden = true
opt.hlsearch = true
opt.ignorecase = true
opt.incsearch = true
opt.modifiable = true
opt.number = true
opt.relativenumber = true
opt.shiftwidth = 4
opt.showmode = false
opt.smartcase = true
opt.smartindent = true
opt.tabstop = 4
opt.termguicolors = true
opt.wrap = true
opt.writebackup = false
