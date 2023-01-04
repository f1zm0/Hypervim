-- load and setup core plugins
require('hvim.plugins.treesitter')
require('hvim.plugins.cmp')
require('hvim.plugins.lsp')

-- load and setup optional plugins
local plugins_defaults = require('hvim.defaults').plugins

for plugin_name, plugin_config in pairs(plugins_defaults) do
  local plugin_ok, plugin = pcall(require, plugin_name)
  if plugin_ok then
    if plugin.setup then
      local opts_ok, opts = pcall(require, 'hvim.plugins.' .. plugin_name)
      if not opts_ok then
        plugin.setup()
      else
        plugin.setup(opts)
      end
      -- load plugin-specific keymaps if any
      if plugin_config.keymaps and not vim.tbl_isempty(plugin_config.keymaps) then
        require('hvim.util.keymaps').load_keymaps(plugin_config.keymaps)
      end
      -- load plugin-specific extensions if any
      if plugin_config.extensions and not vim.tbl_isempty(plugin_config.extensions) then
        for _, extension in pairs(plugin_config.extensions) do
          plugin.load_extension(extension)
        end
      end
    end
  end
end

require('hvim.plugins.sessions')
