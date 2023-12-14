-- compatibility check
require('hvim.util.version').check_nvim_version()

-- set global vars
local globals = require('hvim.defaults').core.globals
for k, v in pairs(globals) do
  vim.g[k] = v
end

-- set options
local options = require('hvim.defaults').core.options
for k, v in pairs(options) do
  vim.opt[k] = v
end

-- load keymaps
require('hvim.util.keymaps').load_keymaps(require('hvim.defaults').core.keymaps)

-- setup default diagnostics config
local diagnostics = require('hvim.defaults').diagnostics
vim.diagnostic.config(diagnostics)

require('hvim.lazy')
require('hvim.ui')
require('hvim.plugins')
require('hvim.hacks')

-- run startup tasks if enabled
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
