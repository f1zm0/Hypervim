local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

telescope.setup({
  defaults = {
    -- ignore files in directories
    file_ignore_patterns = {
      'dist',
      'build',
      '__pycache__',
      'vendor',
      'node_modules',
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
  },
})

-- extensions
telescope.load_extension('notify')
telescope.load_extension('fzf')
