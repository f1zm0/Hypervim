vim.opt.termguicolors = true
vim.opt.background = 'dark'

-- theme style
vim.g.tokyonight_style = 'night'

-- theme customcolors
vim.g.tokyonight_colors = {
  green = '#0487d8',
  green1 = '#cad4ed',
  orange = '#b4bdff',
  yellow = '#98c9ed',
  warning = '#dafd89',
  blue = '#91aacd',
  blue1 = '#4870c1',
  magenta = '#396a92 ',
  purple = '#8d82e8',
  -- bg = '#1b202a',
  bg_dark = '#232833',
  comment = '#4b525f',
}

vim.cmd([[colorscheme tokyonight]])
