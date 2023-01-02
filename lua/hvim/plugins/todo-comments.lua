return {
  signs = true,
  sign_priority = 8,
  keywords = {
    FIX = {
      icon = ' ',
      color = 'error',
      alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' },
    },
    TODO = { icon = ' ', color = 'info' },
    HACK = { icon = ' ', color = 'warning' },
    WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
    PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
    NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
  },
}
