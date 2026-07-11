-- Define o número de espaços ao pressionar a tecla Tab
vim.opt.tabstop = 4        -- Número de espaços que um Tab representa
vim.opt.shiftwidth = 4     -- Número de espaços para auto-indentar
vim.opt.expandtab = true   -- Usa espaços ao invés de tabs
if vim.fn.has("win32") == 1 then
  vim.opt.shell = "powershell.exe"
end
