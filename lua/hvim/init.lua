-- compatibility check
require('hvim.util.version').check_nvim_version()
local hvim_version = require('hvim.util.version').get_latest_hvim_version()
print(vim.inspect(hvim_version))

require('hvim.core.options')
require('hvim.core.keybindings')
require('hvim.packer')
require('hvim.hacks')
require('hvim.ui')
require('hvim.lsp')
require('hvim.plugins')
