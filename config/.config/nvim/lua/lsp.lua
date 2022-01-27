local nvim_lsp = require('lspconfig')
local cmp = require('cmp')
local luasnip = require('luasnip')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  	--Enable completion triggered by <c-x><c-o>
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local opts = { noremap=true, silent=true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<C-K>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	buf_set_keymap('n', '<C-p>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', '<C-n>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
	buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
	buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- setup nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(),
    	['<C-n>'] = cmp.mapping.select_next_item(),
    	['<C-d>'] = cmp.mapping.scroll_docs(-4),
    	['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
    	['<CR>'] = cmp.mapping.confirm {
      		behavior = cmp.ConfirmBehavior.Replace,
      		select = true,
    	},
    	['<Tab>'] = function(fallback)
      		if cmp.visible() then
        		cmp.select_next_item()
      		elseif luasnip.expand_or_jumpable() then
        		luasnip.expand_or_jump()
      		else
        		fallback()
      		end
    	end,
    	['<S-Tab>'] = function(fallback)
      		if cmp.visible() then
        		cmp.select_prev_item()
      		elseif luasnip.jumpable(-1) then
        		luasnip.jump(-1)
      		else
        		fallback()
      		end
    	end,
  	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'path' },
	},
}

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "bashls", "jsonls" }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end

-- gopls
nvim_lsp.gopls.setup {
	cmd = { "gopls", "serve" },
	on_attach = on_attach,
	filetypes = { "go", "gomod" },
	root_dir = nvim_lsp.util.root_pattern("go.mod", ".git"),
	capabilities = capabilities,
}

-- terraform-ls
nvim_lsp.terraformls.setup {
	cmd = { "terraformls", "serve" },
	on_attach = on_attach,
	filetypes = { "terraform" },
	root_dir = nvim_lsp.util.root_pattern(".terraform", ".git"),
	capabilities = capabilities,
}

-- yaml-ls
nvim_lsp.yamlls.setup{
	filetypes = { "yaml" },
	capabilities = capabilities,
  	settings = {
		yaml = {
			format = {
				singleQuote = true
			},
		},
	},
}
