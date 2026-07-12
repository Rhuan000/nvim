return {
    {
        "lewis6991/gitsigns.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("gitsigns").setup({
                sign_priority = 6,
                current_line_blame = false,
            })
        end,
    }
}
