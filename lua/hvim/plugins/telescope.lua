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
})
