vim.g.mapleader = " "

local map = vim.keymap.set
local silent = { noremap = true, silent = true }

-- Explorer and file navigation
map("n", "<leader>pv", vim.cmd.Ex, { desc = "Explore directory" })
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fe", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file tree" })
map("n", "<leader>ft", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fd", "<cmd>NvimTreeFindFile<CR>")

vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { silent = true })
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { silent = true })

vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { silent = true })
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { silent = true })

vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true })

-- Layout helpers
map("n", "<leader>wn", function()
  vim.wo.number = true
  vim.wo.relativenumber = not vim.wo.relativenumber
end, { desc = "Toggle relative numbers" })

-- Buffers
map("n", "<M-1>", "<cmd>bprev<CR>", vim.tbl_extend("force", silent, { desc = "Previous buffer" }))
map("n", "<M-2>", "<cmd>bnext<CR>", vim.tbl_extend("force", silent, { desc = "Next buffer" }))
map("n", "<M-c>", "<cmd>bdelete<CR>", vim.tbl_extend("force", silent, { desc = "Close buffer" }))

-- Editing
map("n", "<leader>s", ":%s/", { noremap = true, silent = false, desc = "Substitute in file" })
map({ "n", "v" }, "<leader>y", [=["+y]=], vim.tbl_extend("force", silent, { desc = "Yank to clipboard" }))
map("n", "<leader>Y", [=["+Y]=], vim.tbl_extend("force", silent, { desc = "Yank line to clipboard" }))

-- Harpoon
map("n", "<leader>ha", ':lua require("harpoon.mark").add_file()<CR>', vim.tbl_extend("force", silent, { desc = "Add harpoon mark" }))
map("n", "<leader>hh", ':lua require("harpoon.ui").toggle_quick_menu()<CR>', vim.tbl_extend("force", silent, { desc = "Harpoon menu" }))
map("n", "<leader>h1", ':lua require("harpoon.ui").nav_file(1)<CR>', vim.tbl_extend("force", silent, { desc = "Harpoon file 1" }))
map("n", "<leader>h2", ':lua require("harpoon.ui").nav_file(2)<CR>', vim.tbl_extend("force", silent, { desc = "Harpoon file 2" }))
map("n", "<leader>h3", ':lua require("harpoon.ui").nav_file(3)<CR>', vim.tbl_extend("force", silent, { desc = "Harpoon file 3" }))
map("n", "<leader>h4", ':lua require("harpoon.ui").nav_file(4)<CR>', vim.tbl_extend("force", silent, { desc = "Harpoon file 4" }))

-- Git
map("n", "<leader>gb", function()
  require("gitsigns").blame_line({ full = true })
end, { desc = "Git blame line" })
map("n", "<leader>gp", function()
  require("gitsigns").preview_hunk()
end, { desc = "Preview git hunk" })
map("n", "<leader>gh", function()
  require("gitsigns").stage_hunk()
end, { desc = "Stage git hunk" })
map("n", "<leader>gH", function()
  require("gitsigns").reset_hunk()
end, { desc = "Reset git hunk" })
map("n", "<leader>gn", function()
  require("gitsigns").next_hunk()
end, { desc = "Next git hunk" })
map("n", "<leader>gN", function()
  require("gitsigns").prev_hunk()
end, { desc = "Previous git hunk" })

-- Diagnostics
map("n", "<leader>di", function()
  vim.diagnostic.open_float(nil, { focusable = false })
end, { desc = "Line diagnostics" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

-- Chat / AI
map({ "n", "v" }, "<leader>ca", "<cmd>CopilotChatToggle<CR>", { desc = "Toggle AI chat" })
map({ "n", "v" }, "<leader>cq", "<cmd>CopilotChatQuarkusReview<CR>", { desc = "Quarkus review" })
map({ "n", "v" }, "<leader>cr", "<cmd>CopilotChatReview<CR>", { desc = "Review selection" })
map("i", "<C-s>", function()
  require("copilot.suggestion").trigger()
end, { desc = "Trigger Copilot suggestion" })

-- Debugging
map("n", "<F5>", function() require("dap").continue() end, { desc = "Debug continue" })
map("n", "<F10>", function() require("dap").step_over() end, { desc = "Debug step over" })
map("n", "<F11>", function() require("dap").step_into() end, { desc = "Debug step into" })
map("n", "<F12>", function() require("dap").step_out() end, { desc = "Debug step out" })
map("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Toggle breakpoint" })
map("n", "<leader>dB", function()
  require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Conditional breakpoint" })
map("n", "<leader>dr", function() require("dap").repl.open() end, { desc = "Open DAP REPL" })
map("n", "<leader>du", function() require("dapui").toggle() end, { desc = "Toggle DAP UI" })
map("n", "<leader>dl", function() require("dap").run_last() end, { desc = "Run last debug config" })

-- Terminal
map("t", "<Esc>", [[<C-\><C-n>]], silent)
map("n", "<leader>tt", "<cmd>terminal<CR>", { desc = "Terminal" })
map("n", "<leader>tv", "<cmd>vsplit | terminal<CR>", { desc = "Terminal vertical" })
map("n", "<leader>th", "<cmd>split | terminal<CR>", { desc = "Terminal horizontal" })

-- LSP navigation
map("n", "<leader>gD", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "<leader>gR", vim.lsp.buf.references, { desc = "Go to references" })
map("n", "<leader>gd", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
map("n", "<leader>gs", require("telescope.builtin").lsp_document_symbols, { desc = "Document symbols" })
map("n", "<leader>ch", function()
  vim.ui.select({ "incoming calls", "outgoing calls" }, {
    prompt = "Call hierarchy",
  }, function(choice)
    if choice == "incoming calls" then
      if vim.lsp.buf.incoming_calls then
        vim.lsp.buf.incoming_calls()
      else
        vim.notify("Call hierarchy is not available in this Neovim version", vim.log.levels.WARN)
      end
    elseif choice == "outgoing calls" then
      if vim.lsp.buf.outgoing_calls then
        vim.lsp.buf.outgoing_calls()
      else
        vim.notify("Call hierarchy is not available in this Neovim version", vim.log.levels.WARN)
      end
    end
  end)
end, { desc = "Call hierarchy" })
