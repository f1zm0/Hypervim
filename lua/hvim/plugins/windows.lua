local status_ok, windows = pcall(require, 'windows')
if not status_ok then
  return
end

windows.setup({
  autowidth = {
    enable = false,
  },
  ignore = {
    buftype = { 'quickfix' },
    filetype = {
      'NvimTree',
      'trouble',
    },
  },
  animation = {
    enable = false,
  },
})
