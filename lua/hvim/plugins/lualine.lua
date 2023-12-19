local colors = require('tokyonight.colors').night
local icons = require('hvim.ui.icons')
local pu = require('hvim.util.path')

local custom_sections = {
  mode = {
    'mode',
    icon = '',
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
}

return {
  options = {
    theme = 'tokyonight',
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
    lualine_c = { custom_sections.diff },
    lualine_x = { 'diagnostics', 'encoding', 'fileformat', 'filetype' },
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
