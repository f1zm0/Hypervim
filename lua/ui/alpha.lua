local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
  return
end

local kn_tag = 'v0.0.1'
local plugins_count = vim.fn.len(vim.fn.globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1))

local banner = {
  [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
  [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⣭⣭⣭⣙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
  [[ ⣿⣿⣿⣿⣿⣿⣿⣿⡏⣰⣿⣿⣿⣿⣿⣧⢹⣿⣿⣿⣿⣿⣿⣿⣿ ]],
  [[ ⣿⣿⣿⣿⣿⣿⣿⣿⡇⢻⡟⢿⣿⡿⢻⡿⢸⣿⣿⣿⣿⣿⣿⣿⣿ ]],
  [[ ⣿⣿⣿⣿⣿⢹⣟⢻⣿⠞⣿⢸⣿⡇⢿⠻⣿⡟⣻⡏⣿⣿⣿⣿⣿ ]],
  [[ ⣿⣿⣿⣿⣿⣦⡙⠷⠶⠞⣡⡞⣉⠻⣌⠳⠶⠶⢛⣴⣿⣿⣿⣿⣿ ]],
  [[ ⣿⣿⣿⣿⣿⣦⣍⣛⣛⣋⣥⣾⣿⣷⣬⣙⣛⣛⣩⣴⣿⣿⣿⣿⣿ ]],
  [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
  [[ ]],
  [[         KrakenVim         ]],
}

local sub_banner = {
  [[ ~(neo)vim with tentacles~ ]],
}

local function button(sc, txt, keybind, keybind_opts)
  local if_nil = vim.F.if_nil
  local shortcut = sc:gsub('%s', ''):gsub('LDR', '<leader>')
  local opts = {
    position = 'center',
    text = txt,
    shortcut = sc,
    cursor = 0,
    width = 32,
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
    hl = 'Number',
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
    button('LDR fs', '缾 sessions'),
    button('LDR fr', '  recent files'),
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
      val = '~[  ' .. kn_tag .. ' ][  ' .. plugins_count .. ' plugins ]~',
      opts = {
        hl = 'Comment',
        position = 'center',
      },
    },
  },
}

local opts = {
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

alpha.setup(opts)
