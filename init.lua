require("config")
vim.opt.rtp:prepend("~/.config/nvim/lazy/lazy.nvim")
vim.opt.number = true  -- Enable absolute line numbers
vim.opt.relativenumber = true  -- Enable relative line numbers




require("lazy").setup(require("plugins"))
require("rhuan")


