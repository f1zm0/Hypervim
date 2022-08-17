local opt = vim.opt
local g = vim.g

-- Search
opt.ignorecase = true
opt.hlsearch = true -- highlight search

-- Code navigation
opt.ruler = false
opt.number = true
opt.relativenumber = true

-- Buffers
opt.hidden = true

-- Indentation
opt.expandtab = true
opt.smartindent = true

-- Swapfiles
g.noswapfile = true
g.nobackup = true
g.nowritebackup = true
g.nowb = true

-- Clipboard
opt.clipboard = 'unnamedplus' -- share clipboard with system

-- Transparent cmp window background
opt.pumblend = 25

-- Diagnostics
vim.diagnostic.config({
  virtual_text = false, -- disable inline diagnostics
})

-- show diagnostics on hover in a floating window
vim.o.updatetime = 300
vim.cmd('autocmd CursorHold * lua vim.diagnostic.open_float({scope="line"})')
