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
   init = function()
      vim.api.nvim_create_autocmd('FileType', {
         callback = function()
            -- Enable treesitter highlighting and disable regex syntax
            pcall(vim.treesitter.start)
            -- Enable treesitter-based indentation
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
         end,
      })
   end,
}
