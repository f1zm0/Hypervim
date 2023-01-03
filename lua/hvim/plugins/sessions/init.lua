require('hvim.plugins.sessions.auto-session')
require('hvim.plugins.sessions.session-lens')

-- register default mappings
local keymaps = require('hvim.defaults').sessions.keymaps
require('hvim.util.keymaps').load_keymaps(keymaps)
