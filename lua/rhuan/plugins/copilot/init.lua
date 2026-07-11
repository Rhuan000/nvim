return {
{
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,

          keymap = {
            accept = "<C-y>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-n>",
          },
        },

        panel = {
          enabled = false,
        },
      })

      vim.keymap.set("i", "<C-y>", function()
        local copilot = require("copilot.suggestion")

        if copilot.is_visible() then
          copilot.accept()
        else
          require("blink.cmp").accept()
        end
      end, {
      desc = "Accept Copilot or completion",
    })
  end,
}
}
