local M = {}

M.mason = {
  ensure_installed = {
    "bash-language-server",
    "gopls",
    "json-lsp",
    "lua-language-server",
    "terraform-ls",
    "yaml-language-server",
  },
}

M.nvimtree = {
  git = {
    enable = true,
    ignore = false,
  },
  renderer = {
    highlight_git = true,
    highlight_modified = "icon",
    highlight_opened_files = "icon",
    indent_markers = {
      enable = true,
    },
    icons = {
      show = {
        git = true,
        modified = true,
      },
    },
  },
  modified = {
    enable = true,
  },
  filters = {
    dotfiles = true,
    custom = {
      ".git",
    },
  },
}

M.treesitter = {
  ensure_installed = {
    "bash",
    "dockerfile",
    "git_config",
    "gitignore",
    "go",
    "gomod",
    "gosum",
    "gowork",
    "hcl",
    "json",
    "lua",
    "markdown",
    "terraform",
    "yaml",
  },
}

return M
