local cs = require('hvim.defaults').ui.colorscheme

-- set colorscheme with style (if present)
if cs.style ~= '' then
   vim.cmd('colorscheme ' .. cs.name .. '-' .. cs.style)
else
   vim.cmd('colorscheme ' .. cs.name)
end
