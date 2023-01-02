local list_mappings = {
  { key = { 'l', '<CR>', 'o' }, action = 'edit', mode = 'n' },
  { key = 'h', action = 'close_node', mode = 'n' },
}

return {
  sort_by = 'case_sensitive',
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  view = {
    adaptive_size = true,
    mappings = {
      list = list_mappings,
    },
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = '',
      info = '',
      warning = '',
      error = '',
    },
  },
  renderer = {
    group_empty = true,
    icons = {
      glyphs = {
        default = '',
        symlink = '',
        git = {
          unstaged = '',
          staged = '',
          unmerged = '',
          renamed = '',
          untracked = '',
          deleted = '✖',
          ignored = '',
        },
        folder = {
          default = '',
          open = '',
          empty = '',
          empty_open = '',
          symlink = '',
        },
      },
    },
  },
  filters = {
    dotfiles = false,
    custom = {
      '^.git$',
      '^__pycache__$',
      'node_modules',
    },
  },
}
