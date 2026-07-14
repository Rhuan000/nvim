return {
    {
        "mfussenegger/nvim-jdtls",
        ft = {"java"},
        config = function()
            local jdtls = require("jdtls")

            jdtls.setup_dap({
                hotcodereplace = "auto",
            })

            jdtls.setup.add_commands()
        end,
    }
}
