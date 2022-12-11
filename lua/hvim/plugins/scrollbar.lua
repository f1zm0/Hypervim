local status_ok, scrollbar = pcall(require, 'scrollbar')
if not status_ok then
  return
end

local colors = require('tokyonight.colors').setup()

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
    color = colors.bg_highlight,
  },
  marks = {
    Search = { color = colors.orange },
    Error = { color = colors.error },
    Warn = { color = colors.warning },
    Info = { color = colors.info },
    Hint = { color = colors.hint },
    Misc = { color = colors.purple },
  },
})
