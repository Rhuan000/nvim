local map = vim.keymap.set

local silent = { noremap = true, silent = true }
map('n', '<CR>', "o<Esc>")
map('n', '<BS>', "O<Esc>")
map("n", "<leader>tl",  function()
    vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = "Toggle relative line numbers" })

-- Explorer and file navigation
map("n", "<leader>pv", vim.cmd.Ex, { desc = "Explore directory" })
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
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

map("n", "<M-$>", "<cmd>bprevious | bdelete #<CR>",
vim.tbl_extend("force", silent, { desc = "Close buffer" }))


-- Window resizing. Alt stays under the left hand while the direction keys are
-- reached by the right hand on the Corne layout, without activating a layer.
map("n", "<M-h>", "<cmd>vertical resize -5<CR>",
{ desc = "Decrease split width" })

map("n", "<M-l>", "<cmd>vertical resize +5<CR>",
{ desc = "Increase split width" })

map("n", "<M-i>", "<cmd>resize +2<CR>",
{ desc = "Increase split height" })

map("n", "<M-m>", "<cmd>resize -2<CR>",
{ desc = "Decrease split height" })


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


-- CodeCompanion
map({ "n", "v" }, "<leader>cc",
"<cmd>CodeCompanionChat toggle<CR>",
{ desc = "Open CodeCompanion chat" })

map({ "n", "v" }, "<leader>cq",
"<cmd>CodeCompanionCLI agent=codex Review this Quarkus code for correctness, regressions, security risks, and missing tests.<CR>",
{ desc = "Quarkus review with Codex" })

map({ "n", "v" }, "<leader>cr",
"<cmd>CodeCompanionCodeReview<CR>",
{ desc = "Review agent changes" })

map({ "n", "v" }, "<leader>cl",
"<cmd>CodeCompanionCLI agent=codex<CR>",
{ desc = "Open Codex via CodeCompanion" })

-- In normal mode, select the current line before opening the inline assistant.
map("n", "<leader>ci", "V<cmd>CodeCompanion<CR>",
{ desc = "CodeCompanion inline on current line" })

map("v", "<leader>ci", "<cmd>CodeCompanion<CR>",
{ desc = "CodeCompanion inline on selection" })


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

map("n", "<leader>cA",
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
map({ "n", "v" }, "<leader>de", function()
    require("dapui").eval()
end, { desc = "Evaluate expression under cursor" })
map({ "n", "v" }, "<leader>dw", function()
    require("dapui").elements.watches.add()
end, { desc = "Add expression to DAP watches" })
map("n", "<leader>da", function()
    require("rhuan.plugins.nvim-dap.config").attach_quarkus()
end, { desc = "Attach debugger to Quarkus" })
map("n", "<leader>dq", function()
    require("rhuan.plugins.nvim-dap.config").start_quarkus()
end, { desc = "Start Quarkus and attach debugger" })
map("n", "<leader>dt", function() require("dap").terminate() end, { desc = "Terminate debug session" })
map("n", "<leader>fe", function() require("telescope.builtin").diagnostics({
    severity = vim.diagnostic.severity.ERROR,
})
end, { desc = "Show errors" })
map("n", "<leader>fw", function() require("telescope.builtin").diagnostics({
    severity = vim.diagnostic.severity.WARN,
})
end, { desc = "Show warnings" })
