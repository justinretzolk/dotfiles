local overrides = require "custom.configs.overrides"

-- see lazy.nvim docs
-- https://github.com/folke/lazy.nvim

local plugins = {

  -- mason
  -- https://github.com/williamboman/mason.nvim
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  -- mason-null-ls
  -- https://github.com/jay-babu/mason-null-ls.nvim
  {
    "jay-babu/mason-null-ls.nvim",
    event = {
      "BufReadPre",
      "BufNewFile"
    },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim"
    },
    opts = {
      automatic_installation = true
    }
  },

  -- nvim-tree
  -- https://github.com/nvim-tree/nvim-tree.lua
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree
  },

  -- nvim-treesitter
  -- https://github.com/nvim-treesitter/nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter
  },

  -- nvim-lspconfig
  -- https://github.com/neovim/nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    -- dependencies = {
    -- "jose-elias-alvarez/null-ls.nvim",
    -- },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },

  -- null-ls
  -- https://github.com/jose-elias-alvarez/null-ls.nvim
  {
    "jose-elias-alvarez/null-ls.nvim",
    --ft = "go",
    opts = function()
      return require "custom.configs.null-ls"
    end
  },

  -- gopher
  -- https://github.com/olexsmir/gopher.nvim
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end
  }
}

return plugins
