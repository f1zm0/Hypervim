local status_ok, lens = pcall(require, 'session-lens')
if not status_ok then
  return
end

lens.setup({
  theme = 'dropdown',
  theme_conf = {
    layout_config = {
      width = 0.85,
      height = 0.6,
    },
    borderchars = require('telescope.config').values.borderchars,
    layout_strategy = 'flex',
  },
  previewer = false,
})
