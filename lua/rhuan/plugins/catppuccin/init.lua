return {
{
    "catppuccin/nvim",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        integrations = {
          dap = true,
          gitsigns = true,
          treesitter = true,
          telescope = true,
          nvimtree = true,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  }
}
