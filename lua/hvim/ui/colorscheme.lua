local cs_name = require('hvim.defaults').ui.colorscheme

-- guard to check if colorscheme is installed
local status_ok, colorscheme = pcall(require, cs_name)
if not status_ok then
  print(cs_name .. ' colorscheme not installed. Please install it first.')
  return
end

-- import colorschemes config
local conf_ok, cs_conf = pcall(require, 'hvim.ui.colorschemes.' .. cs_name)
if not conf_ok then
  -- calling setup with default config
  colorscheme.setup()
  return
else
  -- calling setup with custom config
  colorscheme.setup(cs_conf)
end

-- set theme
vim.cmd('colorscheme ' .. cs_name)
