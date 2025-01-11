local colors = require('tokyonight.colors').setup()

return {
   'mvllow/modes.nvim',
   tag = 'v0.2.1',
   opts = {
      colors = {
         copy = colors.teal,
         delete = colors.magenta,
         insert = colors.blue0,
         visual = colors.purple,
      },
   },
}
