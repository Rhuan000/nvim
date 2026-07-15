return {
    { 
        "mistweaverco/kulala.nvim",
        ft = {"http", "rest"},
        opts = {},
        keys = {
            { "<leader>krr",function()
                require("kulala").run()
            end
               , desc = "Run HTTP request" },
               { "<leader>kra",function()
                   require("kulala").run_all()
               end
               , desc = "Run all HTTP requests" }, 
        },
    }
}
