local color_overrides = function(colors)
   colors.green = '#b1e88d'
   colors.orange = '#f2a291'
end

local highlights_overrides = function(hl, colors)
   local util = require('tokyonight.util')
   hl.CursorLineNr = {
      fg = colors.green,
   }
   hl.BlinkCmpLabelDescription = {
      fg = colors.comment,
   }
   hl.MiniIndentscopeSymbol = {
      fg = util.brighten(colors.comment, 0.1),
   }
end

return {
   'folke/tokyonight.nvim',
   lazy = false,
   priority = 1000,
   opts = {
      on_colors = color_overrides,
      on_highlights = highlights_overrides,
   },
}
