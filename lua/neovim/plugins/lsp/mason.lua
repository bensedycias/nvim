return {
  "williamboman/mason.nvim",
  lazy = false, priority = 1000,
  dependencies = {
        "mason-org/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "neovim/nvim-lspconfig",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      automatic_enable = false,
      ensure_installed = {
        "tailwindcss", "marksman",
        "emmet_ls", "lua_ls", "gopls",
        "ts_ls", "cssls", "html",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "isort", "pylint", "clangd",
        "stylua", "denols",
      },
    })
  end,
}
