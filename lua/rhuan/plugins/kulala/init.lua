return {
    { 
        "mistweaverco/kulala.nvim",
        ft = {"http", "rest"},
        opts = {},
        keys = {
            { "<leader>rr", "<cmd>KulalaRun<cr>", desc = "Run HTTP request" },
            { "<leader>ra", "<cmd>KulalaRunAll<cr>", desc = "Run all HTTP requests" }, 
        },
    }
}
