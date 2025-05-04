vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
-- Alternar para o NvimTree (explorador de arquivos)
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
-- Alternar entre o NvimTree e o arquivo
vim.api.nvim_set_keymap('n', '<Leader>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
-- alternar para mostrar o numero da linha sem ser relativa
vim.api.nvim_set_keymap('n', '<Leader>n', ':set norelativenumber<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>n', ':lua ToggleNumber()<CR>', { noremap = true, silent = true })

function ToggleNumber()
    if vim.wo.number then
        vim.wo.relativenumber = true
    else
        vim.wo.relativenumber = false
    end
end

-- trocar j por k
vim.keymap.set('', 'j', 'k', { noremap = true })
vim.keymap.set('', 'k', 'j', { noremap = true })

-- conseguir colar fora do terminal
vim.api.nvim_set_keymap('', '<C-y>', ':w !xclip -selection clipboard<CR>', { noremap = true, silent = true })
