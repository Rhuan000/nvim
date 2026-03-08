vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
-- Alternar para o NvimTree (explorador de arquivos)
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
-- Alternar entre o NvimTree e o arquivo
vim.api.nvim_set_keymap('n', '<Leader>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
-- alternar para mostrar o numero da linha sem ser relativa
function ToggleNumber()
  vim.wo.number = true
  vim.wo.relativenumber = not vim.wo.relativenumber
end
vim.api.nvim_set_keymap('n', '<Leader>n', ':lua ToggleNumber()<CR>', { noremap = true, silent = true })

--Para controlar os arquivos em buffers/tab
vim.keymap.set('n', '<M-2>', ':bnext<CR>', { noremap = true, silent = true, desc = "Next buffer" })
vim.keymap.set('n', '<M-1>', ':bprev<CR>', { noremap = true, silent = true, desc = "Previous buffer" })
vim.keymap.set('n', '<M-c>', ':bdelete<CR>', { noremap = true, silent = true, desc = "Delete this buffer panel"})

-- trocar j por k
--vim.keymap.set('', 'j', 'k', { noremap = true })
--vim.keymap.set('', 'k', 'j', { noremap = true })
-- replace comand
vim.keymap.set('n', '<leader>r', ':%s/', {noremap = true, silent = false, desc = "replace string"})
-- conseguir colar fora do terminal
vim.api.nvim_set_keymap('', '<C-y>', ':w !xclip -selection clipboard<CR>', { noremap = true, silent = true })
-- Harpoon keymap
vim.api.nvim_set_keymap('n', '<Leader>m', ':lua require("harpoon.mark").add_file()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>1', ':lua require("harpoon.ui").nav_file(1)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>2', ':lua require("harpoon.ui").nav_file(2)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>3', ':lua require("harpoon.ui").nav_file(3)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>4', ':lua require("harpoon.ui").nav_file(4)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>h', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true })        --
--mostrar o Erro do LSP
vim.keymap.set("n", "<leader>i", function()
  vim.diagnostic.open_float(nil, { focusable = false })
end, { desc = "LSP diagnostic description" })
-- Error do diagnostic mover o cursor pro local exato
vim.keymap.set('n', '[d', vim.diagnostic.goto_next, { desc = "Next LSP description" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, { desc = "Previous LSP description" })

-- terminal
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true, desc= "Go to normal in terminal mode"})
vim.keymap.set("n", "<leader>tt", ":terminal<CR>", { noremap = true, silent = true, desc = "Open terminal" })
vim.keymap.set("n", "<leader>tv", ":vsplit | terminal<CR>", { noremap = true, silent = true, desc = "Open terminal vertical" })
vim.keymap.set("n", "<leader>th", ":split | terminal<CR>", { noremap = true, silent = true, desc = "Open terminal horizontal" })

-- Atalhos de Navegação LSP (Rhuan Setup)
vim.keymap.set('n', '<leader>gdf', vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Go to definition" })
vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, { noremap = true, silent = true, desc = "Go to references" })
vim.keymap.set('n', '<leader>gdc', vim.lsp.buf.declaration, { noremap = true, silent = true, desc = "Go to declaration" })
vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, { noremap = true, silent = true, desc = "Go to implementation" })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').lsp_document_symbols, { desc = "Listar símbolos/funções" })




