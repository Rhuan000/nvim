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


vim.api.nvim_set_keymap('n', '<Leader>n', ':lua ToggleNumber()<CR>', { noremap = true, silent = true })

--Para controlar os arquivos em buffers/tab
vim.keymap.set('n', '<Tab>', ':bnext<CR>')
vim.keymap.set('n', '<S-Tab>', ':bprev<CR>')
vim.keymap.set('n', '<leader>c', ':bdelete<CR>', { noremap = true, silent = true })

-- trocar j por k
vim.keymap.set('', 'j', 'k', { noremap = true })
vim.keymap.set('', 'k', 'j', { noremap = true })

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
end, { desc = "Mostrar erro LSP flutuante" })
-- Error do diagnostic mover o cursor pro local exato
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Próximo erro/aviso" })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Erro/aviso anterior" })
-- terminal
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })

