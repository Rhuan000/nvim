require("config")
vim.opt.rtp:prepend("~/.config/nvim/lazy/lazy.nvim")
vim.opt.number = true  -- Enable absolute line numbers
vim.opt.relativenumber = true  -- Enable relative line numbers



-- enabling dianostics in files
vim.diagnostic.config({
  virtual_text = {
    prefix = "󰈸", -- só o símbolo, sem mensagem
    spacing =0,
     format = function(diag)
      return ""  -- retorna string vazia para não mostrar mensagem
    end,
  },
  virtual_text = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.HINT] = '⚡',
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
    },
    numhl = {
      [vim.diagnostic.severity.WARN] = 'WarningMsg',
      [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
      [vim.diagnostic.severity.HINT] = 'DiagnosticHint',
    },
  },
  underline = true,
  severity_sort = true,
    severity = {
    min = vim.diagnostic.severity.HINT,
  },
  update_in_insert = true,
})


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup(require("plugins"))
require("rhuan")


