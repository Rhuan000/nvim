return {
{
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "main",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
  cmd = { "CopilotChat", "CopilotChatToggle", "CopilotChatOpen", "CopilotChatClose" },
  config = function()
    require("CopilotChat").setup({
      model = "auto",
      auto_insert_mode = true,
      show_help = false,
      window = {
        layout = "float",
        width = 0.75,
        height = 0.8,
        border = "rounded",
        title = "AI Assistant",
      },
      mappings = {
        close = { normal = "q", insert = "<C-c>" },
        reset = { normal = "<C-l>", insert = "<C-l>" },
        submit_prompt = { normal = "<CR>", insert = "<C-s>" },
      },
      prompts = {
        QuarkusReview = {
          prompt = "Review this Quarkus/Java code for correctness, readability, and maintainability.",
          system_prompt = "You are reviewing a Java Quarkus project. Focus on practical fixes, not broad theory.",
          mapping = "<leader>cq",
          description = "Review Quarkus code",
        },
      },
    })
    vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>CopilotChatToggle<CR>", { desc = "Open AI chat" })
    vim.keymap.set({ "n", "v" }, "<leader>cr", "<cmd>CopilotChatReview<CR>", { desc = "Review selection" })
    vim.keymap.set({ "n", "v" }, "<leader>cq", "<cmd>CopilotChatQuarkusReview<CR>", { desc = "Review Quarkus code" })
  end,
}
}
