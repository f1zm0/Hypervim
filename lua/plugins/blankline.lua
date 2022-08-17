local status_ok, indent_blankline = pcall(require, 'indent_blankline')
if not status_ok then
  return
end

vim.opt.list = true

indent_blankline.setup({
  show_current_context = true,
  show_current_context_start = true,
  show_end_of_line = true,
  use_treesiter = true,
  filetype_exclude = {
    'alpha',
    'help',
    'lspinfo',
    'Neotree',
    'packer',
    'TelescopePrompt',
    'TelescopeResults',
    'terminal',
  },
  buftype_exclude = {
    'nofile',
    'terminal',
  },
})
