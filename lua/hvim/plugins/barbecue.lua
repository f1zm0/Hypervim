return {
   'utilyre/barbecue.nvim',
   name = 'barbecue',
   version = '1.*',
   event = { 'BufReadPre', 'BufNewFile' },
   dependencies = {
      'SmiteshP/nvim-navic',
      'nvim-tree/nvim-web-devicons',
   },
   opts = {},
   config = function()
      require('barbecue').setup({
         create_autocmd = false,
      })

      vim.api.nvim_create_autocmd({
         'WinResized', -- or WinScrolled for  nvim<v0.9
         'BufWinEnter',
         'CursorHold',
         'InsertLeave',
         -- "BufModifiedSet", -- if you have set `show_modified` to `true`
      }, {
         group = vim.api.nvim_create_augroup('barbecue.updater', {}),
         callback = function()
            require('barbecue.ui').update()
         end,
      })
   end,
}
