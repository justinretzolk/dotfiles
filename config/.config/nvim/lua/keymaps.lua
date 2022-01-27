-- make the config much less verbose
local map = vim.api.nvim_set_keymap
opts = { noremap = true }

-- disable direction keys in normal mode
map('n', '<Up>', '', opts)
map('n', '<Down>', '', opts)
map('n', '<Left>', '', opts)
map('n', '<Right>', '', opts)

-- easier splitting
map('n', '<Leader>h', ':<C-u>split<CR>', opts)
map('n', '<Leader>v', ':<C-u>vsplit<CR>', opts)

-- easier navigation between splits
map('', '<C-h>', '<C-w>h', opts)
map('', '<C-j>', '<C-w>j', opts)
map('', '<C-k>', '<C-w>k', opts)
map('', '<C-l>', '<C-w>l', opts)

-- NERDTree
map('n', '<Leader>n', ':NERDTreeToggle<CR>', opts)
map('n', '<Leader>nv', ':NERDTreeVCS<CR>', opts)
