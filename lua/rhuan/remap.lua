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


-- trocar j por k
vim.keymap.set('', 'j', 'k', { noremap = true })
vim.keymap.set('', 'k', 'j', { noremap = true })

-- conseguir colar fora do terminal
vim.api.nvim_set_keymap('', '<C-y>', ':w !xclip -selection clipboard<CR>', { noremap = true, silent = true })
