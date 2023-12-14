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
  Copilot = '  ',
}

M.diff = {
  add = '',
  modified = '',
  remove = '',
}

M.git = {
  branch = '',
  unstaged = '✗',
  staged = '✓',
  unmerged = '',
  renamed = '➜',
  untracked = '★',
  deleted = '',
  ignored = '◌',
}

return M
