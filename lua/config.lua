-- Define o número de espaços ao pressionar a tecla Tab
vim.g.mapleader = " "
vim.opt.tabstop = 4        -- Número de espaços que um Tab representa
vim.opt.shiftwidth = 4     -- Número de espaços para auto-indentar
vim.opt.expandtab = true   -- Usa espaços ao invés de tabs

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
if vim.fn.has("win32") == 1 then
  vim.opt.shell = "powershell.exe"
end
