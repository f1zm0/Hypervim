local M = {}

M.keymaps = {
  leader = ',',
}

M.startup_tasks = {
  -- check if there is a new Hypervim release
  check_hvim_updates = false,
  -- run :PackerSync to update plugins (not recommended)
  sync_plugins = false,
}

M.lsp_servers = {
  ensure_installed = {
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
  },
}

M.treesitter = {
  ensure_installed = {
    'bash',
    'c',
    'comment',
    'cpp',
    'css',
    'dockerfile',
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
    name = 'tokyonight',
    style = 'neo',
  },
}

return M
