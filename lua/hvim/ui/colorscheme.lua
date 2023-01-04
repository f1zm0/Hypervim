local cs = require('hvim.defaults').ui.colorscheme

-- import colorschemes config
local conf_ok, cs_conf = pcall(require, 'hvim.ui.colorschemes.' .. cs.name)
if conf_ok then
  local status_ok, colorscheme = pcall(require, cs.name)
  if not status_ok then
    return
  end
  -- calling setup with custom config
  colorscheme.setup(cs_conf)
end

if cs.style ~= '' then
  vim.cmd('colorscheme ' .. cs.name .. '-' .. cs.style)
else
  vim.cmd('colorscheme ' .. cs.name)
end
