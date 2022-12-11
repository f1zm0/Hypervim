local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
  return
end

bufferline.setup({
  options = {
    mode = 'buffers',
    numbers = 'ordinal',
    show_close_icon = false,
    diagnostics = true,
  },
})
