local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

local servers = { "bashls", "gopls", "jsonls", "lua_ls", "terraformls", "yamlls" }

-- general
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup { on_attach = on_attach, capabilities = capabilities }
end

-- go
lspconfig.gopls.setup {
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = { unusedparams = true }
    }
  }
}

-- lua_ls
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = { version = "LuaJit" },
      diagnostics = { globals = { "vim" } },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false }
    }
  }
}

-- yamlls
lspconfig.yamlls.setup {
  settings = {
    yaml = {
      format = { enable = true, singleQuote = true, bracketSpacing = true },
      validate = true,
      completion = true,
      schemaStore = { enable = true },
      editor = { formatOnType = true }
    }
  }
}
