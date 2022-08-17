-- plugin guard
local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
  return
end

-- diagnostic symbols
local signs = {
  Error = '',
  Warn = ' ',
  Hint = ' ',
  Info = ' ',
  Other = '',
}

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, {
    text = icon,
    texthl = hl,
    numhl = '',
  })
end
