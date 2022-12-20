-- compatibility check
require('hvim.util.version').check_nvim_version()

require('impatient')

require('hvim.core.options')
require('hvim.core.keybindings')
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
