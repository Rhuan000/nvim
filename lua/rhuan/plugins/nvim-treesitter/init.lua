return {
{
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "yaml",
        "lua",
        "vim",
        "vimdoc",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "html",
        "css",
        "java",
        "rust",
        "c",
        "cpp",
      },
      highlight = { enable = true },
      indent = { enable = true },
      auto_install = true,
    },
  }
}
