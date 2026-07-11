vim.g.mapleader = " "

local map = vim.keymap.set
local silent = { noremap = true, silent = true }
map('n', '<CR>', "o<Esc>")
map('n', '<BS>', "O<Esc>")

-- Explorer and file navigation
map("n", "<leader>pv", vim.cmd.Ex, { desc = "Explore directory" })
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fe", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file tree" })
map("n", "<leader>ft", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fd", "<cmd>NvimTreeFindFile<CR>", { desc = "Find current file" })
map(
      "n",
      "<leader>fb",
      "<cmd>Telescope file_browser<CR>",
      { desc = "Abrir explorador de pastas" }
    )
-- Replace
map(
  "n",
  "<leader>r",
  ":%s/<C-r><C-w>/",
  { desc = "Replace current word" }
)

-- Move lines
map("n", "<A-k>", ":m .-2<CR>==", { silent = true })
map("n", "<A-j>", ":m .+1<CR>==", { silent = true })

map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { silent = true })
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { silent = true })

map("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true })


-- Buffers
map("n", "<M-1>", "<cmd>bprev<CR>",
  vim.tbl_extend("force", silent, { desc = "Previous buffer" }))

map("n", "<M-2>", "<cmd>bnext<CR>",
  vim.tbl_extend("force", silent, { desc = "Next buffer" }))

map("n", "<M-c>", "<cmd>previous | bdelete #<CR>",
  vim.tbl_extend("force", silent, { desc = "Close buffer" }))


-- Editing
map("n", "<leader>s", ":%s/", {
  noremap = true,
  silent = false,
  desc = "Substitute in file",
})

map({ "n", "v" }, "<leader>y", [["+y]],
  vim.tbl_extend("force", silent, { desc = "Yank clipboard" }))

map("n", "<leader>Y", [["+Y]],
  vim.tbl_extend("force", silent, { desc = "Yank line clipboard" }))


-- Harpoon
map("n", "<leader>ha",
  ':lua require("harpoon.mark").add_file()<CR>',
  vim.tbl_extend("force", silent, { desc = "Add harpoon mark" }))

map("n", "<leader>hh",
  ':lua require("harpoon.ui").toggle_quick_menu()<CR>',
  vim.tbl_extend("force", silent, { desc = "Harpoon menu" }))

map("n", "<leader>h1",
  ':lua require("harpoon.ui").nav_file(1)<CR>',
  vim.tbl_extend("force", silent, { desc = "Harpoon file 1" }))

map("n", "<leader>h2",
  ':lua require("harpoon.ui").nav_file(2)<CR>',
  vim.tbl_extend("force", silent, { desc = "Harpoon file 2" }))

map("n", "<leader>h3",
  ':lua require("harpoon.ui").nav_file(3)<CR>',
  vim.tbl_extend("force", silent, { desc = "Harpoon file 3" }))

map("n", "<leader>h4",
  ':lua require("harpoon.ui").nav_file(4)<CR>',
  vim.tbl_extend("force", silent, { desc = "Harpoon file 4" }))


-- Git
local gitsigns = require("gitsigns")

-- LazyGit UI
map("n", "<leader>gg",
  "<cmd>LazyGit<CR>",
  { desc = "Open LazyGit" })

-- blame
map("n", "<leader>gb", function()
  gitsigns.blame_line({ full = true })
end, { desc = "Git blame line" })

-- branches
map("n", "<leader>gB",
  "<cmd>Git branch<CR>",
  { desc = "Git branches" })

-- preview change
map("n", "<leader>gp", function()
  gitsigns.preview_hunk()
end, { desc = "Preview git hunk" })

-- stage
map("n", "<leader>ga", function()
  gitsigns.stage_hunk()
end, { desc = "Stage git hunk" })

-- stage all
map("n", "<leader>gA", function()
  gitsigns.stage_buffer()
end, { desc = "Stage buffer" })

-- reset
map("n", "<leader>gr", function()
  gitsigns.reset_hunk()
end, { desc = "Reset git hunk" })

-- next/previous changes
map("n", "<leader>gn", function()
  gitsigns.next_hunk()
end, { desc = "Next git hunk" })

map("n", "<leader>gN", function()
  gitsigns.prev_hunk()
end, { desc = "Previous git hunk" })

-- commit
map("n", "<leader>gc",
  "<cmd>Git commit<CR>",
  { desc = "Git commit" })


-- Diagnostics
map("n", "<leader>di", function()
  vim.diagnostic.open_float(nil, { focusable = false })
end, { desc = "Line diagnostics" })

map("n", "[d", vim.diagnostic.goto_prev,
  { desc = "Previous diagnostic" })

map("n", "]d", vim.diagnostic.goto_next,
  { desc = "Next diagnostic" })


-- Copilot Chat
map({ "n", "v" }, "<leader>cc",
  "<cmd>CopilotChatToggle<CR>",
  { desc = "Toggle AI chat" })

map({ "n", "v" }, "<leader>cq",
  "<cmd>CopilotChatQuarkusReview<CR>",
  { desc = "Quarkus review" })

map({ "n", "v" }, "<leader>cr",
  "<cmd>CopilotChatReview<CR>",
  { desc = "Review selection" })


-- LSP Navigation
map("n", "gd",
  vim.lsp.buf.definition,
  { desc = "Go to definition" })

map("n", "gD",
  vim.lsp.buf.declaration,
  { desc = "Go to declaration" })

map("n", "gi",
  vim.lsp.buf.implementation,
  { desc = "Go to implementation" })

map("n", "gr",
  vim.lsp.buf.references,
  { desc = "Go to references" })

map("n", "K",
  vim.lsp.buf.hover,
  { desc = "Hover documentation" })

map("n", "<leader>gs",
  require("telescope.builtin").lsp_document_symbols,
  { desc = "Document symbols" })

map("n", "<leader>ca",
  vim.lsp.buf.code_action,
  { desc = "Code Action" })


-- Debugging
map("n", "<F5>", function()
  local dap = require("dap")

  if vim.bo.filetype == "java" then
    local ok, jdtls = pcall(require, "jdtls")
    if ok and jdtls.dap and jdtls.dap.setup_dap_main_class_configs then
      pcall(jdtls.dap.setup_dap_main_class_configs)
    else
      vim.notify("jdtls nao esta pronto. Abra um arquivo Java e aguarde o LSP iniciar.", vim.log.levels.WARN)
    end
  end

  dap.continue()
end, { desc = "Debug continue" })

map("n", "<F10>", function() require("dap").step_over() end, { desc = "Debug step over" })
map("n", "<F11>", function() require("dap").step_into() end, { desc = "Debug step into" })
map("n", "<F12>", function() require("dap").step_out() end, { desc = "Debug step out" })


-- Terminal
--map("t", "<Esc>", [[<C-\><C-n>]], silent)
-- Terminal
map("t", "<C-x>", [[<C-\><C-n>]], {
  desc = "Exit terminal mode"
})

map("n", "<leader>tt",
  "<cmd>terminal<CR>",
  { desc = "Terminal" })

map("n", "<leader>tv",
  "<cmd>vsplit | terminal<CR>",
  { desc = "Terminal vertical" })

map("n", "<leader>th",
  "<cmd>split | terminal<CR>",
  { desc = "Terminal horizontal" })

-- Debugging
map("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Toggle breakpoint" })
map("n", "<leader>dB", function()
  require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Conditional breakpoint" })
map("n", "<leader>dr", function() require("dap").repl.open() end, { desc = "Open DAP REPL" })
map("n", "<leader>du", function() require("dapui").toggle() end, { desc = "Toggle DAP UI" })
map("n", "<leader>dl", function() require("dap").run_last() end, { desc = "Run last debug config" })

