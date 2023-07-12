local null_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local format = null_ls.builtins.formatting

local opts = {
  sources = {
    format.fixjson,
    format.gofmt,
    format.goimports,
    format.markdown_toc,
    format.prettierd,
    format.terrafmt,
    format.terraform_fmt,
    format.trim_newlines,
    format.trim_whitespace,
    -- format.yamlfmt
    -- format.lua_format,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end
      })
    end
  end
}

return opts
