return {
    {
  "ThePrimeagen/harpoon",
  config = function()
    require("harpoon").setup({
      global_settings = {
        save_on_toggle = true,
        enter_on_send = false,
        mark_branch = true,
      },
    })
  end,
}
}
