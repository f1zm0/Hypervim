local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- leader key
vim.g.mapleader = ','

-- quicker exit
keymap('n', '<leader>q', '<cmd>qall<cr>', opts)
keymap('n', '<leader>wq', '<cmd>wqall<cr>', opts)

-- buffer navigation and management
keymap('n', '<Tab>', '<cmd>bnext<cr>', opts)
keymap('n', '<S-Tab>', '<cmd>bprev<cr>', opts)
keymap('n', '<leader>d', '<cmd>bp | bd #<cr>', opts)

-- window navigation
keymap('n', '<c-h>', '<C-w>h', opts)
keymap('n', '<c-j>', '<C-w>j', opts)
keymap('n', '<c-k>', '<C-w>k', opts)
keymap('n', '<c-l>', '<C-w>l', opts)

-- window resizing
keymap('n', '<c-Left>', '<cmd>vertical resize -2<cr>', opts)
keymap('n', '<c-Down>', '<cmd>resize +2<cr>', opts)
keymap('n', '<c-Up>', '<cmd>resize -2<cr>', opts)
keymap('n', '<c-Right>', '<cmd>vertical resize +2<cr>', opts)

-- window close
keymap('n', '<leader>c', '<C-w>c', opts)

-- better indentation in visual mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- faster splits
keymap('n', '\\', '<cmd>split<cr>', opts)
keymap('n', '|', '<cmd>vsplit<cr>', opts)

-- open config entrypoint file
keymap('n', '<leader>rc', '<cmd>e ' .. os.getenv('MYVIMRC') .. '<cr>', opts)

-- show diagnostic in a float pane
keymap('n', 'T', '<cmd>lua vim.diagnostic.open_float({scope="line"})<cr>', opts)

-- packer shortcuts
keymap('n', '<leader>ps', '<cmd>PackerSync<cr>', opts)
keymap('n', '<leader>pc', '<cmd>PackerClean<cr>', opts)
