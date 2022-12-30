local status_ok, scrollbar = pcall(require, 'scrollbar')
if not status_ok then
  return
end

local colors = require('tokyonight.colors').neo

scrollbar.setup({
  show_in_active_only = true,
  excluded_filetypes = {
    'prompt',
    'TelescopePrompt',
    'noice',
    'Trouble',
    'NvimTree',
  },
  handle = {
    color = colors.fg_gutter,
  },
  marks = {
    Search = { color = colors.orange },
    Error = { color = colors.red },
    Warn = { color = colors.yellow },
    Info = { color = colors.blue },
    Hint = { color = colors.magenta },
    Misc = { color = colors.purple },
  },
})
