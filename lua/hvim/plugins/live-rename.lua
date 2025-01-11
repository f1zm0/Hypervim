return {
   'saecki/live-rename.nvim',
   keys = {
      {
         '<F2>',
         function()
            require('live-rename').rename({ text = '', insert = true })
         end,
         desc = 'rename current item',
      },
   },
   opts = {},
}
