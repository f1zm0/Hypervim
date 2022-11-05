local status_ok, mason = pcall(require, 'mason')
if not status_ok then
  return
end

local mlspc_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mlspc_ok then
  return
end

local ensure_installed = {
  'bashls',
  'clangd',
  'cssls',
  'eslint',
  'golangci_lint_ls',
  'gopls',
  'jsonls',
  'ltex',
  'pyright',
  'rust_analyzer',
  'sumneko_lua',
  'tsserver',
  'yamlls',
}

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
  ensure_installed = ensure_installed,
  automatic_installation = true,
})
