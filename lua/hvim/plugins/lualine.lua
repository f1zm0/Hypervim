local colors = require('tokyonight.colors').neo
local icons = require('hvim.ui.icons')
local pu = require('hvim.util.path')

-- variation of original tokyonight's lualine theme
local neotokyo = {
  normal = {
    a = { bg = colors.blue, fg = colors.black },
    b = { bg = colors.bg_highlight, fg = colors.fg_dark },
    c = { bg = colors.bg, fg = colors.fg_sidebar },
  },
  insert = {
    a = { bg = colors.green1, fg = colors.black },
    b = { bg = colors.bg_highlight, fg = colors.fg_dark },
  },
  command = {
    a = { bg = colors.red, fg = colors.black },
    b = { bg = colors.bg_highlight, fg = colors.fg_dark },
  },
  visual = {
    a = { bg = colors.magenta, fg = colors.black },
    b = { bg = colors.bg_highlight, fg = colors.fg_dark },
  },
  replace = {
    a = { bg = colors.red, fg = colors.black },
    b = { bg = colors.bg_highlight, fg = colors.fg_dark },
  },
  terminal = {
    a = { bg = colors.yellow1, fg = colors.black },
    b = { bg = colors.bg_highlight, fg = colors.fg_dark },
  },
  inactive = {
    a = { bg = colors.bg, fg = colors.blue },
    b = { bg = colors.bg, fg = colors.fg_gutter, gui = 'bold' },
    c = { bg = colors.bg, fg = colors.fg_gutter },
  },
}

local custom_sections = {
  mode = {
    'mode',
    icon = '',
  },
  diff = {
    'diff',
    source = pu.diff_source(),
    symbols = {
      added = icons.diff.add .. ' ',
      modified = icons.diff.modified .. ' ',
      removed = icons.diff.remove .. ' ',
    },
  },
  fname = {
    'filename',
    path = 1,
    symbols = {
      modified = icons.diff.modified,
    },
    icon = icons.file,
  },
  aerial = {
    function()
      local aerial = require('aerial')
      if aerial.is_active() then
        return aerial.get_current_function()
      end
    end,
  },
  branch_icon = {
    function()
      return icons.git.branch
    end,
    padding = { left = 2, right = 0 },
    color = { fg = colors.red },
  },
  branch = {
    'branch',
    padding = { left = 0, right = 1 },
    icon = '',
  },
}

return {
  options = {
    theme = neotokyo,
    component_separators = '',
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      'alpha',
      'NvimTree',
      'packer',
      'Trouble',
    },
    globalstatus = true,
  },
  sections = {
    lualine_a = { custom_sections.mode },
    lualine_b = { custom_sections.fname },
    lualine_c = { custom_sections.branch_icon, custom_sections.branch, custom_sections.diff },
    lualine_x = { 'diagnostics' },
    lualine_y = { 'location' },
    lualine_z = { 'progress' },
  },
  inactive_sections = {},
  tabline = {},
  winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      custom_sections.fname,
      'aerial',
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  inactive_winbar = {
    lualine_a = {},
    lualine_b = { custom_sections.fname },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = { 'nvim-tree', 'aerial' },
}
