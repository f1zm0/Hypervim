local opt = vim.opt
local g = vim.g

-- Search
opt.ignorecase = true
opt.hlsearch = true -- highlight search

-- Code navigation
opt.ruler = false
opt.number = true
opt.relativenumber = true
opt.showmatch = true

-- Buffers
opt.hidden = true

-- File navigation
opt.cursorline = true

-- Indentation
opt.expandtab = true
opt.smartindent = true
opt.shiftwidth = 4
opt.tabstop = 4

-- Swapfiles
g.noswapfile = true
g.nobackup = true
g.nowritebackup = true
g.nowb = true

-- Clipboard
opt.clipboard = 'unnamedplus' -- share clipboard with system

-- Transparent cmp window background
opt.pumblend = 5

-- Diagnostics
vim.diagnostic.config({
  virtual_text = false, -- disable inline diagnostics
})
vim.o.updatetime = 300

-- disable builtin plugins
local disabled_built_ins = {
  '2html_plugin',
  'bugreport',
  'compiler',
  'getscript',
  'getscriptPlugin',
  'gzip',
  'logipat',
  'matchit',
  'netrw',
  'netrwFileHandlers',
  'netrwPlugin',
  'netrwSettings',
  'optwin',
  'rplugin',
  'rrhelper',
  'spellfile_plugin',
  'synmenu',
  'tar',
  'tarPlugin',
  'tutor',
  'vimball',
  'vimballPlugin',
  'zip',
  'zipPlugin',
}

for _, p in pairs(disabled_built_ins) do
  g['loaded_' .. p] = 1
end
