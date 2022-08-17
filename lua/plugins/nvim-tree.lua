local status_ok, tree = pcall(require, 'nvim-tree')
if not status_ok then
  return
end

local keybindings = {
  { key = { 'l', '<CR>', 'o' }, action = 'edit', mode = 'n' },
  { key = 'h', action = 'close_node', mode = 'n' },
}

tree.setup({
  sort_by = 'case_sensitive',
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  view = {
    adaptive_size = true,
    mappings = {
      list = keybindings,
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
})
