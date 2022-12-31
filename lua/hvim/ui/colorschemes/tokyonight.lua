return {
  style = 'neo',
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

  on_highlights = function(hl, c)
    local colors = require('tokyonight.colors').neo
    local util = require('tokyonight.util')

    -- slightly darker background to visually separate telescope
    -- results prompt from standard background
    local bg_alt = util.blend(colors.bg, '#000000', 0.92)

    hl.NvimTreeFolderIcon = {
      bg = c.none,
      fg = c.fg_dark,
    }
    -- Visual fix for statusline bottom left part
    -- that remains white for both active and inactive windows
    hl.StatusLineNC = {
      fg = colors.bg_dark,
      bg = colors.bg_dark,
    }
    -- Telescope highlights
    hl.TelescopePromptBorder = {
      fg = colors.bg_dark,
      bg = colors.bg_dark,
    }
    hl.TelescopePromptNormal = {
      fg = colors.fg,
      bg = colors.bg_dark,
    }
    hl.TelescopePromptTitle = {
      fg = colors.fg,
      bg = colors.bg_highlight,
    }
    hl.TelescopePromptCounter = {
      fg = colors.yellow,
      bg = colors.bg_dark,
    }
    hl.TelescopePromptPrefix = {
      fg = colors.fg_dark,
      bg = colors.bg_dark,
    }
    hl.TelescopeResultsBorder = {
      fg = bg_alt,
      bg = bg_alt,
    }
    hl.TelescopeResultsNormal = {
      fg = colors.fg,
      bg = bg_alt,
    }
    hl.TelescopeResultsTitle = {
      fg = bg_alt,
      bg = bg_alt,
    }
    hl.TelescopePreviewBorder = {
      fg = colors.bg_dark,
      bg = colors.bg_dark,
    }
    hl.TelescopePreviewNormal = {
      fg = colors.fg,
      bg = colors.bg_dark,
    }
    hl.TelescopePreviewTitle = {
      fg = colors.fg,
      bg = colors.purple2,
    }
    hl.CmpItemKindColor = {
      fg = colors.bg_dark,
      bg = colors.yellow,
    }
    hl.CmpItemKindTypeParameter = {
      bg = colors.bg_dark,
      fg = colors.blue2,
    }
    hl.CmpItemKindEnum = {
      bg = colors.bg_dark,
      fg = colors.blue,
    }
    hl.CmpItemKindVariable = {
      bg = colors.bg_dark,
      fg = colors.magenta,
    }
    hl.CmpItemKindInterface = {
      bg = colors.bg_dark,
      fg = colors.green,
    }
    hl.CmpItemKindFunction = {
      bg = colors.bg_dark,
      fg = colors.purple,
    }
    hl.CmpItemKindMethod = {
      bg = colors.bg_dark,
      fg = colors.cyan,
    }
    hl.CmpItemKindConstructor = {
      bg = colors.bg_dark,
      fg = colors.blue3,
    }
    hl.CmpItemKindField = {
      bg = colors.bg_dark,
      fg = colors.yellow1,
    }
    hl.CmpItemKindModule = {
      bg = colors.bg_dark,
      fg = colors.green2,
    }
    hl.CmpItemKindMenu = {
      bg = colors.bg_dark,
      fg = colors.bg_dark,
    }
    hl.CmpItemKindStruct = {
      bg = colors.bg_dark,
      fg = colors.red,
    }
    hl.CmpItemKindCopilot = {
      bg = colors.bg_dark,
      fg = colors.teal,
    }
    hl.CmpItemKindSnippet = {
      bg = colors.bg_dark,
      fg = colors.blue4,
    }
    hl.CmpItemKindClass = {
      bg = colors.bg_dark,
      fg = colors.yellow,
    }
    hl.CmpItemKindUnit = {
      bg = colors.bg_dark,
      fg = colors.magenta2,
    }
    hl.CmpItemKindValue = {
      bg = colors.bg_dark,
      fg = colors.orange1,
    }
    hl.CmpItemKindAbbr = {
      bg = colors.bg_dark,
      fg = colors.yellow2,
    }
    hl.CmpItemKindAbbrMatch = {
      bg = colors.bg_dark,
      fg = colors.yellow2,
    }
    hl.CmpItemKindAbbrMatchFuzzy = {
      bg = colors.bg_dark,
      fg = colors.yellow2,
    }
    hl.CmpItemKindKeyword = {
      bg = colors.bg_dark,
      fg = colors.purple,
    }
    hl.CmpItemKindText = {
      bg = colors.bg_dark,
      fg = colors.fg,
    }
  end,
}
