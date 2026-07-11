return {
{
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = {
        "rust_analyzer",
        "ts_ls",
        "clangd",
        "jdtls",
        "solidity_ls",
        "yamlls",
      },
      automatic_enable = false,
    })

    vim.lsp.config("rust_analyzer", {
      settings = {
        ["rust-analyzer"] = {
          checkOnSave = {
            command = "clippy",
          },
          diagnostics = {
            enable = true,
            experimental = {
              enable = true,
            },
          },
        },
      },
    })

    vim.lsp.config("ts_ls", {})
    vim.lsp.config("clangd", {})
    vim.lsp.config("yamlls", {})

    vim.lsp.config("solidity_ls", {
      cmd = { "solidity-language-server", "--stdio" },
      filetypes = { "solidity" },
      root_dir = function(bufnr)
        return vim.fs.root(bufnr, {
          "truffle-config.js",
          "hardhat.config.js",
          ".git",
        })
      end,
    })

    vim.lsp.enable("rust_analyzer")
    vim.lsp.enable("ts_ls")
    vim.lsp.enable("clangd")
    vim.lsp.enable("yamlls")
    vim.lsp.enable("solidity_ls")
  end,
}
}
