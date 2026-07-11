require("config")
vim.opt.number = true -- Enable absolute line numbers
vim.opt.relativenumber = true -- Enable relative line numbers

-- Keep diagnostics readable without duplicating the virtual_text setting.
vim.diagnostic.config({
  virtual_text = {
    prefix = "󰈸",
    spacing = 0,
    format = function()
      return ""
    end,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "⚡",
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
    },
    numhl = {
      [vim.diagnostic.severity.WARN] = "WarningMsg",
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.HINT] = "DiagnosticHint",
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
require("lazy").setup(require("rhuan.plugins"))
require("rhuan")

-- Safe load: prevents errors if nvim-dap is not installed yet
local status_ok, dap = pcall(require, "dap")
if status_ok then
  dap.configurations.java = {
    {
      type = 'java',
      request = 'launch',
      name = "Launch Java Program",
      mainClass = function()
        return vim.fn.input('Main class: ', '', 'file')
      end,
    },
    {
      type = 'java',
      request = 'attach',
      name = "Attach to Remote JDK",
      hostName = "127.0.0.1",
      port = 5005,
    },
  }
end

