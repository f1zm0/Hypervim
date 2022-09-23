local status_ok, tokyonight = pcall(require, 'tokyonight')
if not status_ok then
  return
end

tokyonight.setup({
  style = 'moon',
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    sidebars = 'dark', -- style for sidebars, see below
    floats = 'dark', -- style for floating windows
  },
  sidebars = { 'qf', 'help' },
  day_brightness = 0.3,
  hide_inactive_statusline = false,
  dim_inactive = false,
  lualine_bold = false,

  on_colors = function(colors)
    colors.green1 = '#15b3e9'
    colors.orange = '#96c5fa'
    colors.blue = '#72a4fd'
    colors.purple = '#c58efb'
    colors.fg = '#cadafe'
    -- colors.bg_float = '#202933'
    -- colors.bg_sidebar = '#242435'
    -- colors.border_highlight = '#2b2f43'
  end,

  on_highlights = function(highlights, c)
    highlights.NvimTreeFolderIcon = { bg = c.none, fg = c.orange }
  end,
})

vim.cmd([[colorscheme tokyonight]])
