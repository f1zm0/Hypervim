return {
  style = 'night',
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
  end,

  on_highlights = function(highlights, c)
    highlights.NvimTreeFolderIcon = { bg = c.none, fg = c.orange }
  end,
}
