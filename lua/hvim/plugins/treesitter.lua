return {
   'nvim-treesitter/nvim-treesitter',
   lazy = false,
   dependencies = {
      {
         'nvim-treesitter/nvim-treesitter-context',
         opts = {
            max_lines = 3,
            multiline_threshold = 1,
            min_window_height = 20, -- disable when the window is too small
         },
         keys = {
            {
               '[c',
               function()
                  -- jump to previous change when in diffview
                  if vim.wo.diff then
                     return '[c'
                  else
                     vim.schedule(function()
                        require('treesitter-context').go_to_context()
                     end)
                     return '<Ignore>'
                  end
               end,
               desc = 'Jump to upper context',
               expr = true,
            },
         },
      },
   },
   build = ':TSUpdate',
   config = function(_, opts)
      local parsers = require('hvim.defaults').lang_parsers

      -- setup treesitter and ensure all default language parsers are installed
      require('nvim-treesitter').setup(
         vim.tbl_extend('force', opts, { ensure_installed = parsers })
      )
   end,
}
