local mason_ok, mason = pcall(require, 'mason')
if not mason_ok then
  return
end

local mlspc_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mlspc_ok then
  return
end

mason.setup({
  ui = {
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗',
    },
  },
})

mason_lspconfig.setup({
  ensure_installed = require('hvim.defaults').lsp_servers.ensure_installed,
  automatic_installation = true,
})
