-- plugin guard
local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
  return
end

local signs_icons = require('hvim.ui.icons').diagnostics

for type, icon in pairs(signs_icons) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, {
    text = icon,
    texthl = hl,
    numhl = '',
  })
end
