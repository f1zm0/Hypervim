vim.opt.termguicolors = true
vim.opt.background = 'dark'

-- theme style
vim.g.material_style = 'deep ocean'

-- -- theme setup
require('material').setup({
  contrast = {
    sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
    floating_windows = false, -- Enable contrast for floating windows
    line_numbers = false, -- Enable contrast background for line numbers
    sign_column = true, -- Enable contrast background for the sign column
    cursor_line = false, -- Enable darker background for the cursor line
    non_current_windows = true, -- Enable darker background for non-current windows
    popup_menu = false, -- Enable lighter background for the popup menu
  },
})

vim.cmd([[colorscheme material]])
