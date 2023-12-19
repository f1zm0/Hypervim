return {
  style = 'night',
  transparent = false,
  terminal_colors = true,
  day_brightness = 0.3,
  hide_inactive_statusline = false,
  dim_inactive = true,
  lualine_bold = false,
  sidebars = {
    'qf',
    'help',
  },
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    sidebars = 'dark', -- style for sidebars
    floats = 'dark', -- style for floating windows
  },
  -- customize colors
  on_colors = function(colors)
    colors.bg = '#1f202b'
    colors.bg_dark = '#1b1c24'
    colors.fg = '#cadafe'
    colors.green = '#82dba1'
    colors.green1 = '#00bcd4'
    colors.orange = '#96c5fa'
    colors.yellow = '#bacd89'
    colors.cyan = '#6796ff'
    colors.blue1 = '#76acff'
    colors.purple = '#c58efb'
    colors.purple2 = '#3f41a5'
    colors.teal = '#03a9f4'
  end,

  on_highlights = function(hl, c)
    -- slightly darker background to visually separate telescope
    -- results prompt from standard background
    local bg_alt = '#19191c'

    -- color for nvim-tree win separator
    local win_sep = '#2b2c3b'

    hl.NvimTreeFolderIcon = {
      bg = c.none,
      fg = c.fg_dark,
    }
    hl.NvimTreeNormal = {
      bg = c.bg,
      fg = c.fg,
    }
    hl.NvimTreeNormalNC = {
      bg = c.bg,
      fg = c.fg,
    }
    hl.NvimTreeWinSeparator = {
      bg = c.bg,
      fg = win_sep,
    }

    -- Visual fix for statusline bottom left part
    -- that remains white for both active and inactive windows
    hl.StatusLineNC = {
      fg = c.bg_dark,
    }
    -- Telescope highlights
    hl.TelescopePromptBorder = {
      fg = c.bg_dark,
      bg = c.bg_dark,
    }
    hl.TelescopePromptNormal = {
      fg = c.fg,
      bg = c.bg_dark,
    }
    hl.TelescopePromptTitle = {
      fg = c.fg,
      bg = c.bg_highlight,
    }
    hl.TelescopePromptCounter = {
      fg = c.yellow,
      bg = c.bg_dark,
    }
    hl.TelescopePromptPrefix = {
      fg = c.fg_dark,
      bg = c.bg_dark,
    }
    hl.TelescopeResultsBorder = {
      fg = bg_alt,
      bg = bg_alt,
    }
    hl.TelescopeResultsNormal = {
      fg = c.fg,
      bg = bg_alt,
    }
    hl.TelescopeResultsTitle = {
      fg = bg_alt,
      bg = bg_alt,
    }
    hl.TelescopePreviewBorder = {
      fg = c.bg_dark,
      bg = c.bg_dark,
    }
    hl.TelescopePreviewNormal = {
      fg = c.fg,
      bg = c.bg_dark,
    }
    hl.TelescopePreviewTitle = {
      fg = c.fg,
      bg = c.purple2,
    }
    hl.CmpItemKindColor = {
      fg = c.bg_dark,
      bg = c.yellow,
    }
    hl.CmpItemKindTypeParameter = {
      bg = c.bg_dark,
      fg = c.blue2,
    }
    hl.CmpItemKindEnum = {
      bg = c.bg_dark,
      fg = c.blue,
    }
    hl.CmpItemKindVariable = {
      bg = c.bg_dark,
      fg = c.magenta,
    }
    hl.CmpItemKindInterface = {
      bg = c.bg_dark,
      fg = c.green,
    }
    hl.CmpItemKindFunction = {
      bg = c.bg_dark,
      fg = c.purple,
    }
    hl.CmpItemKindMethod = {
      bg = c.bg_dark,
      fg = c.cyan,
    }
    hl.CmpItemKindConstructor = {
      bg = c.bg_dark,
      fg = c.blue3,
    }
    hl.CmpItemKindField = {
      bg = c.bg_dark,
      fg = c.yellow1,
    }
    hl.CmpItemKindModule = {
      bg = c.bg_dark,
      fg = c.green2,
    }
    hl.CmpItemKindMenu = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.CmpItemKindStruct = {
      bg = c.bg_dark,
      fg = c.red,
    }
    hl.CmpItemKindCopilot = {
      bg = c.bg_dark,
      fg = c.teal,
    }
    hl.CmpItemKindSnippet = {
      bg = c.bg_dark,
      fg = c.blue4,
    }
    hl.CmpItemKindClass = {
      bg = c.bg_dark,
      fg = c.yellow,
    }
    hl.CmpItemKindUnit = {
      bg = c.bg_dark,
      fg = c.magenta2,
    }
    hl.CmpItemKindValue = {
      bg = c.bg_dark,
      fg = c.orange1,
    }
    hl.CmpItemKindAbbr = {
      bg = c.bg_dark,
      fg = c.yellow2,
    }
    hl.CmpItemKindAbbrMatch = {
      bg = c.bg_dark,
      fg = c.yellow2,
    }
    hl.CmpItemKindAbbrMatchFuzzy = {
      bg = c.bg_dark,
      fg = c.yellow2,
    }
    hl.CmpItemKindKeyword = {
      bg = c.bg_dark,
      fg = c.purple,
    }
    hl.CmpItemKindText = {
      bg = c.bg_dark,
      fg = c.fg,
    }
  end,
}
