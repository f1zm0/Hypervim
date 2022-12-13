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

local winbar_cfg = {
  lualine_c = {},
}
local inactive_winbar_cfg = {}
local inactive_sections_cfg = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = {},
  lualine_x = {},
  lualine_y = {},
  lualine_z = {},
}

-- use custom colors as the default theme (oxocarbon.nvim)
-- doesn't expose the color palette yet
-- ref: https://github.com/nyoom-engineering/oxocarbon.nvim/issues/10
local colors = {
  bg = '#222222',
  bg_alt = '#343434',
  fg = '#dedede',
  fg_alt = '#545454',
  yellow = '#e0af68',
  cyan = '#7dcfff',
  blue = '#1b6a73',
  green = '#8bcd5b',
  orange = '#dd9046',
  purple = '#c75ae8',
  magenta = '#bb9af7',
  red = '#f65866',
}

local config = {
  options = {
    -- Disable sections and component separators
    disabled_filetypes = {
      'alpha',
      'NvimTree',
      'packer',
      'Trouble',
    },
    component_separators = '',
    section_separators = '',
    theme = {
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg_alt, bg = colors.bg } },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- these will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = inactive_sections_cfg,
  winbar = winbar_cfg,
  inactive_winbar = inactive_winbar_cfg,
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

--
-- Inactive modules
--
inactive_ins_left({
  'filename',
  cond = conditions.buffer_not_empty,
})

inactive_ins_right({
  'location',
})

--
-- Active modules
--

ins_left({
  -- mode component
  function()
    return ' '
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.fg,
      i = colors.cyan,
      v = colors.red,
      [''] = colors.purple,
      V = colors.purple,
      c = colors.green,
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
  padding = { left = 1, right = 1 },
})

ins_left({
  'filename',
  cond = conditions.buffer_not_empty,
})

ins_left({
  'aerial',
  depth = 3,
  padding = { right = 2, left = 2 },
})

ins_left({
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  -- diagnostics_color = {
  --   color_error = { fg = colors.red },
  --   color_warn = { fg = colors.yellow },
  --   color_info = { fg = colors.cyan },
  -- },
})

ins_right({
  function()
    return ' '
  end,
  cond = conditions.check_git_workspace,
  color = {
    fg = colors.red,
    gui = 'bold',
  },
  padding = { right = 0, left = 0 },
})

ins_right({
  'branch',
  icon = 'branch:',
  padding = { right = 1 },
})

-- ins_right({
--   function()
--     return ' '
--   end,
--   color = {
--     fg = colors.cyan,
--     gui = 'bold',
--   },
--   padding = { right = 0, left = 1 },
-- })

-- ins_right({
--   function()
--     local msg = 'No Active Lsp'
--     local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
--     local clients = vim.lsp.get_active_clients()
--     if next(clients) == nil then
--       return msg
--     end
--     for _, client in ipairs(clients) do
--       local filetypes = client.config.filetypes
--       if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
--         return client.name
--       end
--     end
--     return msg
--   end,
--   color = { fg = colors.fg },
-- })

-- Add components to right sections
ins_right({
  'o:encoding', -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
})

ins_right({
  'fileformat',
  fmt = string.upper,
  icons_enabled = false,
})

ins_right({
  'diff',
  symbols = { added = ' ', modified = '柳 ', removed = ' ' },
  cond = conditions.hide_in_width,
})

ins_right({
  'location',
  color = {
    fg = colors.fg_alt,
  },
  padding = { right = 1 },
})

-- Now don't forget to initialize lualine
lualine.setup(config)
