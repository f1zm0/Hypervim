local status_ok, galaxyline = pcall(require, 'galaxyline')
if not status_ok then
  return
end

local colors = require('galaxyline.theme').default
local condition = require('galaxyline.condition')
local gls = galaxyline.section

galaxyline.exclude_filetypes = {
  'alpha',
  'dbui',
  'nvim-tree',
  'NvimTree',
  'packer',
  'vista',
}

gls.left[1] = {
  RainbowBlue = {
    provider = function()
      return '  '
    end,
    highlight = { colors.blue, colors.bg },
  },
}

gls.left[2] = {
  ViMode = {
    provider = function()
      -- auto change alias according to vim mode
      local alias = {
        n = 'NORMAL',
        i = 'INSERT',
        c = 'COMMAND',
        V = 'VISUAL',
        [''] = 'VISUAL',
        v = 'VISUAL',
        ['r?'] = ':CONFIRM',
        rm = '--MORE',
        R = 'REPLACE',
        Rv = 'VIRTUAL',
        s = 'SELECT',
        S = 'SELECT',
        ['r'] = 'HIT-ENTER',
        [''] = 'SELECT',
        t = 'TERMINAL',
        ['!'] = 'SHELL',
      }
      -- auto change color according the vim mode
      local mode_color = {
        ['!'] = colors.red,
        [''] = colors.magenta,
        [''] = colors.orange,
        ['r?'] = colors.cyan,
        c = colors.red,
        ce = colors.red,
        cv = colors.red,
        i = colors.green,
        ic = colors.yellow,
        n = colors.blue,
        no = colors.red,
        r = colors.cyan,
        R = colors.violet,
        rm = colors.cyan,
        Rv = colors.violet,
        s = colors.orange,
        S = colors.orange,
        t = colors.red,
        v = colors.magenta,
        V = colors.magenta,
      }
      local vim_mode = vim.fn.mode()
      vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color[vim_mode])
      return alias[vim_mode] .. '   '
    end,
    highlight = { colors.blue, colors.bg },
  },
}

gls.left[3] = {
  FileIcon = {
    condition = condition.buffer_not_empty,
    highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, colors.bg },
    provider = 'FileIcon',
  },
}

gls.left[4] = {
  FileName = {
    condition = condition.buffer_not_empty,
    highlight = { colors.fg, colors.bg, 'bold' },
    provider = 'FileName',
    separator = ' ',
    separator_highlight = { 'NONE', colors.bg },
  },
}

gls.left[6] = {
  GitIcon = {
    provider = function()
      return '  '
    end,
    condition = condition.check_git_workspace,
    highlight = { colors.red, colors.bg, 'bold' },
  },
}

gls.left[7] = {
  GitBranch = {
    condition = condition.check_git_workspace,
    highlight = { colors.fg, colors.bg, 'bold' },
    provider = 'GitBranch',
  },
}

gls.left[8] = {
  Separator = {
    highlight = { colors.fg, colors.bg, 'bold' },
    provider = function()
      return ' '
    end,
  },
}

gls.left[9] = {
  DiffAdd = {
    condition = condition.hide_in_width,
    highlight = { colors.green, colors.bg },
    icon = '   ',
    provider = 'DiffAdd',
  },
}

gls.left[10] = {
  DiffModified = {
    condition = condition.hide_in_width,
    highlight = { colors.orange, colors.bg },
    icon = ' 柳',
    provider = 'DiffModified',
  },
}

gls.left[11] = {
  DiffRemove = {
    condition = condition.hide_in_width,
    highlight = { colors.red, colors.bg },
    icon = '  ',
    provider = 'DiffRemove',
  },
}

gls.right[1] = {
  DiagnosticError = {
    highlight = { colors.red, colors.bg },
    icon = '  ',
    provider = 'DiagnosticError',
  },
}

gls.right[2] = {
  DiagnosticWarn = {
    highlight = { colors.yellow, colors.bg },
    icon = '  ',
    provider = 'DiagnosticWarn',
  },
}

gls.right[3] = {
  DiagnosticHint = {
    highlight = { colors.cyan, colors.bg },
    icon = '  ',
    provider = 'DiagnosticHint',
  },
}

gls.right[4] = {
  DiagnosticInfo = {
    highlight = { colors.blue, colors.bg },
    icon = '  ',
    provider = 'DiagnosticInfo',
  },
}

gls.right[5] = {
  ShowLspClient = {
    condition = function()
      local tbl = { ['dashboard'] = true, [''] = true }
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    highlight = { colors.fg, colors.bg, 'bold' },
    icon = ' ﮧ ',
    separator = ' ',
    separator_highlight = { 'NONE', colors.bg },
    provider = 'GetLspClient',
  },
}

gls.right[6] = {
  FileEncode = {
    condition = condition.hide_in_width,
    highlight = { colors.fg, colors.bg },
    provider = 'FileEncode',
    separator = ' ',
    separator_highlight = { 'NONE', colors.bg },
  },
}

gls.right[7] = {
  FileFormat = {
    condition = condition.hide_in_width,
    highlight = { colors.fg, colors.bg },
    provider = 'FileFormat',
    separator = ' ',
    separator_highlight = { 'NONE', colors.bg },
  },
}

gls.right[8] = {
  RainbowBlue = {
    provider = function()
      return '  '
    end,
    highlight = { colors.blue, colors.bg },
  },
}

gls.right[7] = {
  LineInfo = {
    highlight = { colors.fg, colors.bg },
    provider = 'LineColumn',
    separator = ' ',
    separator_highlight = { 'NONE', colors.bg },
  },
}

gls.short_line_left[1] = {
  BufferType = {
    highlight = { colors.blue, colors.bg, 'bold' },
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = { 'NONE', colors.bg },
  },
}

gls.short_line_left[2] = {
  SFileName = {
    condition = condition.buffer_not_empty,
    highlight = { colors.fg, colors.bg, 'bold' },
    separator = ' ',
    provider = 'SFileName',
  },
}
