local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  return
end

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- use custom colors
local colors = {
  bg = '#141424',
  bg_alt = '#545c7e',
  fg = '#a9b1d6',
  yellow = '#e0af68',
  cyan = '#7dcfff',
  darkblue = '#1b6a73',
  green = '#8bcd5b',
  orange = '#dd9046',
  purple = '#c75ae8',
  magenta = '#bb9af7',
  blue = '#7aa2f7',
  red = '#f65866',
}

local config = {
  options = {
    -- Disable sections and component separators
    disabled_filetypes = {
      statusline = {
        'alpha',
        'NvimTree',
        'packer',
        'Trouble',
      },
      winbar = {
        'alpha',
        'nvim-tree',
        'packer',
        'Trouble',
      },
    },
    component_separators = '',
    section_separators = '',
    theme = {
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

-- Inserts a component in lualine_c at left section for inactive windows
local function inactive_ins_left(component)
  table.insert(config.inactive_sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section for inactive windows
local function inactive_ins_right(component)
  table.insert(config.inactive_sections.lualine_x, component)
end

inactive_ins_left({
  'filename',
  cond = conditions.buffer_not_empty,
  color = {
    fg = colors.bg_alt,
  },
})

inactive_ins_right({
  'location',
  color = {
    fg = colors.bg_alt,
  },
})

ins_left({
  function()
    return '▊'
  end,
  color = { fg = colors.blue }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
})

ins_left({
  -- mode component
  function()
    return ' '
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.blue,
      i = colors.green,
      v = colors.red,
      [''] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { right = 1 },
})

ins_left({
  'filename',
  cond = conditions.buffer_not_empty,
  color = {
    fg = '#ffffff',
  },
})

ins_left({ 'location' })

ins_left({
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
})

ins_left({
  function()
    return ' '
  end,
  cond = conditions.check_git_workspace,
  color = {
    fg = colors.red,
    gui = 'bold',
  },
  padding = { right = 0, left = 2 },
})

ins_left({
  'branch',
  icon = 'branch:',
  color = {
    fg = colors.fg,
  },
  padding = { left = 0 },
})

ins_right({
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' ',
  color = { fg = colors.cyan },
})

-- Add components to right sections
ins_right({
  'o:encoding', -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = { fg = colors.fg },
})

ins_right({
  'fileformat',
  fmt = string.upper,
  icons_enabled = false,
  color = { fg = colors.fg },
})

ins_right({
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = { added = ' ', modified = '柳 ', removed = ' ' },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
})

ins_right({
  function()
    return '▊'
  end,
  color = { fg = colors.blue },
  padding = { left = 1 },
})

-- Now don't forget to initialize lualine
lualine.setup(config)
