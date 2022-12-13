local M = {}

M.lsp_servers = {
  'bashls',
  'clangd',
  'cssls',
  'eslint',
  'golangci_lint_ls',
  'gopls',
  'jsonls',
  'pyright',
  'rust_analyzer',
  'sumneko_lua',
  'tsserver',
  'yamlls',
}

M.treesitter = {
  ensure_installed = {
    'bash',
    'c',
    'comment',
    'cpp',
    'css',
    'go',
    'gomod',
    'graphql',
    'html',
    'javascript',
    'json',
    'lua',
    'markdown',
    'python',
    'regex',
    'rust',
    'toml',
    'tsx',
    'typescript',
    'yaml',
  },
}

M.markdown_preview = {
  ip = '0.0.0.0',
  port = 4000,
}

M.copilot = {
  enabled = true,
}

M.ui = {
  colorscheme = {
    name = 'oxocarbon',
    style = '',
  },
}

return M
