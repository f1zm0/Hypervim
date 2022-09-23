local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
  return
end

local path_ok, path = pcall(require, 'plenary.path')
if not path_ok then
  return
end

local kn_tag = 'v0.0.1'

local banner = {
  [[ ⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀]],
  [[ ⠀⠀⡼⢁⡴⠛⠉⠉⠛⢦⡈⢧⠀⠀⠀]],
  [[ ⡆⢸⡇⣼⠁⠀⠀⠀⠀⠈⣧⢸⡇⢰⠀]],
  [[ ⡇⢸⡇⠸⡄⠘⠂⠐⠃⢠⠇⢸⡇⢸⠀]],
  [[ ⢷⡘⠧⠴⠃⣸⠂⠐⣇⠘⠦⠼⢃⡾⠀]],
  [[ ⢈⠛⠶⠶⠚⣁⡼⢧⣈⠓⠶⠶⠛⡁⠀]],
  [[ ⠈⠙⠓⠚⠛⠉⠀⠀⠉⠛⠓⠚⠋⠁ ]],
}

local function button(sc, txt, keybind, keybind_opts)
  local if_nil = vim.F.if_nil
  local shortcut = sc:gsub('%s', ''):gsub('LDR', '<leader>')
  local opts = {
    position = 'center',
    text = txt,
    shortcut = sc,
    cursor = 0,
    width = 44,
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
    hl = 'Variable',
  },
}

local cdir = vim.fn.getcwd()

local function get_extension(fn)
  local match = fn:match('^.+(%..+)$')
  local ext = ''
  if match ~= nil then
    ext = match:sub(2)
  end
  return ext
end

local function icon(fn)
  local nwd = require('nvim-web-devicons')
  local ext = get_extension(fn)
  return nwd.get_icon(fn, ext, { default = true })
end

local function file_button(fn, sc, short_fn)
  short_fn = short_fn or fn
  local ico_txt
  local fb_hl = {}

  local ico, _ = icon(fn)
  ico_txt = ico .. '  '

  local file_button_el = button(sc, ico_txt .. short_fn, '<cmd>e ' .. fn .. ' <CR>')
  local fn_start = short_fn:match('.*/')
  if fn_start ~= nil then
    table.insert(fb_hl, { '', #ico_txt - 2, #fn_start + #ico_txt - 2 })
  end
  file_button_el.opts.hl = fb_hl
  return file_button_el
end

local default_mru_ignore = { 'gitcommit' }

local mru_opts = {
  ignore = function(fpath, ext)
    return (string.find(fpath, 'COMMIT_EDITMSG')) or (vim.tbl_contains(default_mru_ignore, ext))
  end,
}

local function mru(cwd, items_number, opts)
  opts = opts or mru_opts
  items_number = items_number or 9

  local oldfiles = {}
  for _, v in pairs(vim.v.oldfiles) do
    if #oldfiles == items_number then
      break
    end
    local cwd_cond
    if not cwd then
      cwd_cond = true
    else
      cwd_cond = vim.startswith(v, cwd)
    end
    local ignore = (opts.ignore and opts.ignore(v, get_extension(v))) or false
    if (vim.fn.filereadable(v) == 1) and cwd_cond and not ignore then
      oldfiles[#oldfiles + 1] = v
    end
  end

  local target_width = 25

  local tbl = {}
  for i, fn in ipairs(oldfiles) do
    local short_fn
    if cwd then
      short_fn = vim.fn.fnamemodify(fn, ':.')
    else
      short_fn = vim.fn.fnamemodify(fn, ':~')
    end

    if #short_fn > target_width then
      short_fn = path.new(short_fn):shorten(1, { -2, -1 })
      if #short_fn > target_width then
        short_fn = path.new(short_fn):shorten(1, { -1 })
      end
    end

    local file_button_el = file_button(fn, ' ' .. i, short_fn)
    tbl[i] = file_button_el
  end
  return {
    type = 'group',
    val = tbl,
    opts = {},
  }
end

local section_mru = {
  type = 'group',
  val = {
    {
      type = 'text',
      val = 'Recent files',
      opts = {
        hl = 'Operator',
        shrink_margin = false,
        position = 'center',
      },
    },
    { type = 'padding', val = 1 },
    {
      type = 'group',
      val = function()
        return { mru(cdir, 4) }
      end,
      opts = {
        shrink_margin = false,
      },
    },
  },
}

local section_buttons = {
  type = 'group',
  val = {
    { type = 'text', val = 'Quick actions', opts = { hl = 'Operator', position = 'center' } },
    { type = 'padding', val = 1 },
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
      val = 'KrakenVim ' .. kn_tag,
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
    -- section_footer_info,
    { type = 'padding', val = 2 },
    section_mru,
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
