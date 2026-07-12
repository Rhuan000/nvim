
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
