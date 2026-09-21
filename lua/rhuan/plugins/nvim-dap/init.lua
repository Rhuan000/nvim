return {
{
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    vim.api.nvim_set_hl(0, "DapBreakpoint", { link = "DiagnosticError", default = true })
    vim.api.nvim_set_hl(0, "DapBreakpointCondition", { link = "DiagnosticWarn", default = true })
    vim.api.nvim_set_hl(0, "DapLogPoint", { link = "DiagnosticInfo", default = true })
    vim.api.nvim_set_hl(0, "DapStopped", { link = "DiagnosticOk", default = true })
    vim.api.nvim_set_hl(0, "DapStoppedLine", { link = "Visual", default = true })

    vim.fn.sign_define("DapBreakpoint", {
      text = "●",
      texthl = "DapBreakpoint",
      numhl = "DapBreakpoint",
    })
    vim.fn.sign_define("DapBreakpointCondition", {
      text = "◆",
      texthl = "DapBreakpointCondition",
      numhl = "DapBreakpointCondition",
    })
    vim.fn.sign_define("DapLogPoint", {
      text = "◉",
      texthl = "DapLogPoint",
      numhl = "DapLogPoint",
    })
    vim.fn.sign_define("DapBreakpointRejected", {
      text = "×",
      texthl = "DapBreakpoint",
      numhl = "DapBreakpoint",
    })
    vim.fn.sign_define("DapStopped", {
      text = "▶",
      texthl = "DapStopped",
      linehl = "DapStoppedLine",
      numhl = "DapStopped",
    })

    dapui.setup({
      floating = {
        border = "rounded",
      },
    })

    require("nvim-dap-virtual-text").setup({})

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
}
}
