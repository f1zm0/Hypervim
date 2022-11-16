local mason_ok, mason = pcall(require, 'mason')
if not mason_ok then
  return
end

local mlspc_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mlspc_ok then
  return
end

local lsp_servers = {
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
  ensure_installed = lsp_servers,
  automatic_installation = true,
})
