local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ','

-- quicker exit
keymap('n', '<leader>q', ':qall<cr>', opts)
keymap('n', '<leader>wq', ':wqall<cr>', opts)

-- buffer navigation
keymap('n', '<Tab>', ':bnext<cr>', opts)
keymap('n', '<S-Tab>', ':bprev<cr>', opts)
keymap('n', '<leader>d', ':bd<cr>', opts)

-- window navigation
keymap('n', '<c-h>', '<C-w>h', opts)
keymap('n', '<c-j>', '<C-w>j', opts)
keymap('n', '<c-k>', '<C-w>k', opts)
keymap('n', '<c-l>', '<C-w>l', opts)
keymap('n', '<leader>c', '<C-w>c', opts)

-- window resizing
keymap('n', '<c-Left>', ':vertical resize -2<cr>', opts)
keymap('n', '<c-Down>', ':resize +2<cr>', opts)
keymap('n', '<c-Up>', ':resize -2<cr>', opts)
keymap('n', '<c-Right>', ':vertical resize +2<cr>', opts)

-- better indentation in visual mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- config
keymap('n', '<leader>rc', ':e ' .. os.getenv('MYVIMRC') .. '<cr>', opts)
