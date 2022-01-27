-- Install Packer plugin.
local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
	packer_bootstrapped = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', packer_path})
end

-- Compile Packer plugin when this plugins.lua is updated.
vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerCompile
	augroup end
]])

-- Install Vim plugins.
return require('packer').startup(function(use)
	-- package manager
	use 'wbthomason/packer.nvim' -- packer itself
	-- lsp and completion
	use 'neovim/nvim-lspconfig' 	-- nvim native lsp
	use 'hrsh7th/nvim-cmp' 			-- autocomplete plugin
	use 'L3MON4D3/LuaSnip' 			-- snippets plugin
	use 'hrsh7th/cmp-nvim-lsp' 		-- nvim-cmp source for nvim's lsp
	use 'hrsh7th/cmp-path' 			-- nvim-cmp source for filesystem paths
	use 'saadparwaiz1/cmp_luasnip' 	-- nvim-cmp source for snippets
	-- utilities
	use 'preservim/nerdtree' 				-- tree style directory navigation
	use 'ntpeters/vim-better-whitespace' 	-- highlight whitespace
	-- theming
	use 'vim-airline/vim-airline' 			-- status line
	use 'vim-airline/vim-airline-themes' 	-- status line themes
	use 'ryanoasis/vim-devicons' 			-- pretty icons
	use 'joshdick/onedark.vim' 				-- onedark theme

	-- Execute PackerSync if the Packer plugin was just installed.
	if packer_bootstrapped then
		require('packer').sync()
	end
end)
