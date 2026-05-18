return {
   'nvim-lualine/lualine.nvim',
   dependencies = {
      'nvim-tree/nvim-web-devicons',
      'folke/tokyonight.nvim', -- colors for bar appearance
   },
   config = function()
      local lualine = require('lualine')
      local colors = require('tokyonight.colors').setup()

      local lualine_theme = {
         normal = {
            a = { fg = colors.bg_dark, bg = colors.blue, gui = 'bold' },
            b = { fg = colors.fg, bg = colors.bg_highlight },
            c = { fg = colors.fg, bg = colors.bg_dark },
         },
      }

      local opts = {
         options = {
            theme = lualine_theme,
            component_separators = '',
            section_separators = { left = '', right = '' },
            disabled_filetypes = {
               'alpha',
               'Trouble',
            },
            globalstatus = true,
         },
         sections = {
            lualine_a = {},
            lualine_b = {
               {
                  'buffers',
                  mode = 0, -- show only buffer name (ref: https://github.com/nvim-lualine/lualine.nvim?tab=readme-ov-file#buffers-component-options)
                  -- ref: https://github.com/nvim-lualine/lualine.nvim/blob/master/lua/lualine/components/buffers/init.lua#L8
                  show_filename_only = true, -- Shows shortened relative path when set to false.
                  hide_filename_extension = false, -- Hide filename extension when set to true.
                  show_modified_status = true, -- Shows indicator when the buffer is modified.
                  max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
                  use_mode_colors = false, -- nope, we'll handle this with modes.nvim
                  symbols = {
                     modified = ' ',
                     alternate_file = '',
                     directory = '',
                  },
               },
            },
            lualine_c = {},
            lualine_x = {},
            lualine_y = {
               { 'diagnostics' },
               { 'branch', color = { bg = colors.bg_dark, fg = colors.blue } },
               { 'diff' },
            },
            lualine_z = {
               { 'progress', color = { bg = colors.bg_dark, fg = colors.fg_gutter } },
               { 'location', color = { bg = colors.bg_dark, fg = colors.fg } },
            },
         },
         inactive_sections = {},
         tabline = {},
         extensions = {},
      }
      lualine.setup(opts)
   end,
}
