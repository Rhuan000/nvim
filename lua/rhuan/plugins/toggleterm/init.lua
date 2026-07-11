return {
{
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 10,
      open_mapping = [[<c-\>]],
      direction = "horizontal",
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      persist_size = true,
    })
  end,
}
}
