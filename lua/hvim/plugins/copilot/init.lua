local M = {}

local defaults = require('hvim.defaults').copilot

-- setup function
M.options = {
  panel = {
    enabled = true,
    auto_refresh = false,
    keymap = defaults.panel_suggestions_keymaps,
  },
  suggestion = {
    enabled = true,
    auto_trigger = defaults.mode == 'default',
    debounce = 75,
    keymap = defaults.inline_suggestions_keymaps,
  },
  filetypes = defaults.filetypes,
  copilot_node_command = 'node',
  server_opts_overrides = {},
}

return M
