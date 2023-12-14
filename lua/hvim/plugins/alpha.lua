local hvim_version = require('hvim.util.version').get_hvim_current_version()
local curr_time = require('hvim.util.datetime').get_current_time()
local plugins_count = require('hvim.util.plugins').get_installed_plugins()

local banner = {
  '',
  '⠀⠀⠀⠀⠀⢀⣤⣴⡦⠀⠀⠀⠀⠀⢀⣴⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
  '⠀⠀⠀⠀⠀⣼⣿⣿⠇⠀⠀⠀⠀⢀⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
  '⠀⠀⠀⠀⢀⣿⣿⡿⠀⠀⠀⠀⠀⣼⡿⠀⠀⠀⠀⠀⢀⣀⣠⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣦⠀⠀⠀⠀⠀⠀⣠⠞⠁⠀⠀⠀⠀⠀⠀⠀⢀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
  '⠀⠀⠀⠀⢘⣻⣻⠃⠀⠀⠀⠀⣸⣿⠃⠀⣴⣆⢀⣴⣿⡿⠁⣠⣴⣶⣶⣤⣤⣤⣤⣤⣴⡆⣠⣶⣶⣶⣶⣶⣶⣶⣶⡶⢆⣤⣶⣶⣶⣶⣶⣶⣶⣶⣌⢻⣿⣇⠀⠀⠀⣠⡾⠻⠿⠿⢿⣿⣿⣿⠟⠀⢸⣿⣿⣿⡀⠀⢀⣤⣶⠀⠀⠀⠀',
  '⠀⠀⠀⢠⣿⣽⣿⣶⣶⣶⣶⣶⣿⣿⣦⣄⠙⠛⣿⣿⠟⠀⣴⣿⣿⣥⣤⣶⣶⡾⠿⠛⢋⣼⣿⣿⣉⣉⣉⣡⣤⣄⠀⢀⣾⣿⣤⣤⣴⣶⠿⠟⠛⠉⠁⠈⣿⣿⡀⢠⣾⡿⠀⠀⠀⠀⢸⣿⠀⠀⠀⠀⣿⣿⠈⣿⣇⢠⣾⡿⣿⡆⠀⠀⠀',
  '⠀⠀⠀⣾⣿⡿⠁⠀⠀⠀⢸⣿⣿⠏⠁⠀⢀⣾⣿⠋⠀⣻⣿⡿⠛⠋⠉⠁⠀⠀⠀⣠⣬⣿⣿⠿⠛⠛⠛⠉⠉⠁⢀⣾⡿⠛⠿⢿⣿⣷⣶⣤⣤⣀⠀⠀⠸⣿⣷⣿⡾⠁⠀⠀⠀⠀⣼⡿⠀⠀⠀⢀⣿⡇⠀⢿⣿⣿⠛⠀⢿⣧⠀⠀⠀',
  '⠀⠀⣸⣿⣿⠁⠀⠀⠀⢀⣿⣿⠏⠀⠀⣠⣿⡿⠁⠀⣼⣿⠟⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣻⣥⣰⣶⣶⣾⡿⠿⠁⣼⡿⠁⠀⠀⠀⠀⠈⠉⠙⠛⠁⠀⠀⠀⢿⣿⡟⠁⠀⣠⣤⣤⣤⣿⣧⣤⡄⠀⣸⣿⠀⠀⢸⡿⠏⠀⠀⠸⣿⡀⠀⠀',
  '⠀⢀⣿⣿⠃⠀⠀⠀⠀⣸⣿⡟⠀⠀⣴⠟⠋⠀⢀⣾⡿⠋⠀⠀⠀⠀⠀⠀⠀⠘⠻⠿⠿⠛⠛⠋⠉⠁⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠋⠀⠀⠀⠘⠛⠛⠋⠉⠉⠉⠉⠀⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⢿⡇⠀⠀',
  '⠀⡼⠉⠀⠀⠀⠀⠀⠀⠈⠛⠁⠀⠞⠃⠀⠀⠠⠊⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⠀⠀',
  '⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠃⠀',
}

local sub_banner = {
  ' ' .. curr_time .. ' |  ' .. hvim_version .. ' |  ' .. plugins_count .. ' plugins ',
}

local function button(sc, txt, keybind, keybind_opts)
  local if_nil = vim.F.if_nil
  local shortcut = sc:gsub('%s', ''):gsub('LDR', '<leader>')
  local opts = {
    position = 'center',
    text = txt,
    shortcut = sc,
    cursor = 0,
    width = 52,
    align_shortcut = 'right',
    { type = 'padding', val = 2 },
    hl_shortcut = 'Function',
  }

  if keybind then
    keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
    opts.keymap = { 'n', shortcut, keybind, keybind_opts }
  end

  return {
    type = 'button',
    val = txt,
    on_press = function()
      local key = vim.api.nvim_replace_termcodes(shortcut, true, false, true)
      vim.api.nvim_feedkeys(key, 'normal', false)
    end,
    opts = opts,
  }
end

local section_header = {
  type = 'text',
  val = banner,
  opts = {
    position = 'center',
    hl = 'Hlargs',
  },
}

local section_header_sub = {
  type = 'text',
  val = sub_banner,
  opts = {
    position = 'center',
    hl = 'Comment',
  },
}

local section_buttons = {
  type = 'group',
  val = {
    button('LDR fs', '󰕮  sessions'),
    button('LDR fr', '  recent files'),
    button('LDR fg', '  fuzzy search'),
    button('LDR ft', '  todo notes'),
    button('LDR ei', '  edit config'),
    button('LDR ps', '  sync packages'),
  },
  opts = {
    spacing = 0,
  },
}

local section_footer = {
  type = 'group',
  val = {
    {
      type = 'text',
      val = '',
      opts = {
        hl = 'Comment',
        position = 'center',
      },
    },
  },
}

return {
  layout = {
    { type = 'padding', val = 2 },
    section_header,
    section_header_sub,
    { type = 'padding', val = 2 },
    section_buttons,
    { type = 'padding', val = 2 },
    section_footer,
  },
  opts = {
    margin = 2,
  },
}
