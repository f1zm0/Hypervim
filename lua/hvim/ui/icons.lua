local M = {}

M.diagnostics = {
   Error = '',
   Warn = ' ',
   Hint = ' ',
   Info = ' ',
   Other = '',
}

M.hints = {
   prefix = ' ',
}

M.completion = {
   Text = '  ',
   Method = '  ',
   Function = '  ',
   Constructor = '  ',
   Field = '  ',
   Variable = '  ',
   Class = '  ',
   Interface = '  ',
   Module = '  ',
   Property = '  ',
   Unit = '  ',
   Value = '  ',
   Enum = '  ',
   Keyword = '  ',
   Color = '  ',
   File = '  ',
   Reference = '  ',
   Folder = '  ',
   EnumMember = '  ',
   Constant = '  ',
   Struct = '  ',
   Event = '  ',
   Snippet = '  ',
   Operator = '  ',
   TypeParameter = '  ',
   Copilot = '  ',
}

M.diff = {
   add = '',
   modified = '',
   remove = '',
}

M.git = {
   branch = '',
   unstaged = '✗',
   staged = '✓',
   unmerged = '',
   renamed = '➜',
   untracked = '★',
   deleted = '',
   ignored = '◌',
}

M.kinds = {
   Array = ' ',
   Boolean = ' ',
   Class = ' ',
   Color = ' ',
   Constant = '󰏿 ',
   Constructor = ' ',
   Enum = '󰯷 ',
   EnumMember = ' ',
   Event = '󱩠 ',
   Field = '󰐣 ',
   File = ' ',
   Folder = ' ',
   Function = '󰘧 ',
   Interface = ' ',
   Key = ' ',
   Keyword = '󰰉 ',
   Method = ' ',
   Module = ' ',
   Namespace = ' ',
   Null = 'ﳠ ',
   Number = '󱌨 ',
   Object = ' ',
   Operator = '󱓉 ',
   Package = '󰠰 ',
   Property = '󰰘 ',
   Reference = '󰌹 ',
   Snippet = ' ',
   String = '󱌮 ',
   Struct = ' ',
   Text = ' ',
   TypeParameter = ' ',
   Unit = '󰰧 ',
   Value = '󰰪 ',
   Variable = '󰤷 ',
}

return M
