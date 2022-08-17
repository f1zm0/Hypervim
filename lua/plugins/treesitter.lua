local status_ok, _ = pcall(require, 'nvim-treesitter')
if not status_ok then
  return
end

require('nvim-treesitter.configs').setup({

  -- A list of parser names, or "all"
  ensure_installed = {
    'bash',
    'c',
    'cpp',
    'css',
    'go',
    'html',
    'javascript',
    'json',
    'lua',
    'markdown',
    'python',
    'rust',
    'toml',
    'typescript',
    'yaml',
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
