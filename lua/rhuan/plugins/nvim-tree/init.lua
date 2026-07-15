return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup({
                diagnostics = {
                    enable = true,
                    show_on_dirs = true,
                },
                view = { width = 30, side = "left" },
                git = { enable = false},
                actions = {
                    change_dir = {
                        enable = false,
                    },
                },
            })
        end,
    }
}
