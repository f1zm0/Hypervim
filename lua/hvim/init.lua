-- compatibility check
require('hvim.util.version').check_nvim_version()

-- set global vars
local globals = require('hvim.defaults').globals
for k, v in pairs(globals) do
  vim.g[k] = v
end

-- set options
local options = require('hvim.defaults').options
for k, v in pairs(options) do
  vim.opt[k] = v
end

-- load default keymaps
require('hvim.util.keymaps').load_keymaps(require('hvim.defaults').keymaps)

-- setup default diagnostics config
local diagnostics = require('hvim.defaults').diagnostics
vim.diagnostic.config(diagnostics)

-- disable built-in plugins for optimization
for _, p in pairs(require('hvim.defaults').disabled_built_ins) do
  vim.g['loaded_' .. p] = 1
end

require('impatient')
require('hvim.packer')
require('hvim.hacks')
require('hvim.ui')
require('hvim.lsp')
require('hvim.plugins')

-- Startup tasks
if require('hvim.defaults').startup_tasks.check_hvim_updates then
  local latest_hvim_version = require('hvim.util.version').get_latest_hvim_version()
  if latest_hvim_version ~= 'dev' then
    local current_hvim_version = require('hvim.util.version').get_hvim_current_version()
    if current_hvim_version ~= latest_hvim_version then
      require('notify')('New version of Hypervim available (' .. latest_hvim_version .. ').', 'info', {
        title = 'Release update',
      })
    end
  end
end
