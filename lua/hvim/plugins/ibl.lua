-- indent-blankline

return {
  indent = {
    char = '│',
    --highlight = 'Ibl1',
  },
  scope = {
    enabled = true,
    show_start = false,
    show_end = false,
    char = '│',
    highlight = 'Comment',
  },
  exclude = {
    filetypes = {
      'alpha',
      'help',
      'lspinfo',
      'NvimTree',
      'TelescopePrompt',
      'TelescopeResults',
      'terminal',
    },
  },
}
