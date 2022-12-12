local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Telescope
local telescope_status_ok, _ = pcall(require, 'telescope')
if telescope_status_ok then
  keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
  keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
  keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
  keymap('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', opts)
  keymap('n', '<leader>fn', '<cmd>Telescope notify<cr>', opts)
end

local bufline_status_ok, _ = pcall(require, 'bufferline')
if bufline_status_ok then
  keymap('n', '<leader><Tab>', '<cmd>BufferLineMoveNext<cr>', opts)
  keymap('n', '<leader><S-Tab>', '<cmd>BufferLineMovePrev<cr>', opts)
  for i = 1, 9 do
    keymap('n', '<leader>' .. tostring(i), '<cmd>BufferLineGoToBuffer ' .. i .. '<cr>', opts)
  end
end

-- Nvim-tree
local nvim_tree_status_ok, _ = pcall(require, 'nvim-tree')
if nvim_tree_status_ok then
  keymap('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', opts)
end

-- Trouble
local trouble_status_ok, _ = pcall(require, 'trouble')
if trouble_status_ok then
  keymap('n', '<leader>tt', '<cmd>TroubleToggle<cr>', opts)
  keymap('n', '<leader>tw', '<cmd>Trouble workspace_diagnostics<cr>', opts)
  keymap('n', '<leader>td', '<cmd>Trouble document_diagnostics<cr>', opts)
  keymap('n', '<leader>tq', '<cmd>Trouble quickfix<cr>', opts)
end

-- Todos
local todo_status_ok, _ = pcall(require, 'todo-comments')
if todo_status_ok then
  keymap('n', '<leader>ft', '<cmd>TodoTrouble<cr>', opts)
end

-- Sessions
local autosession_status_ok, _ = pcall(require, 'auto-session')
if autosession_status_ok then
  keymap('n', '<c-s>', '<cmd>SaveSession<cr>', opts)
end

local sessionlens_status_ok, _ = pcall(require, 'session-lens')
if sessionlens_status_ok then
  keymap('n', '<leader>fs', '<cmd>SearchSession<cr>', opts)
end

local windows_status_ok, _ = pcall(require, 'windows')
if windows_status_ok then
  keymap('n', '<leader>z', '<cmd>WindowsMaximize<cr>', opts)
end
