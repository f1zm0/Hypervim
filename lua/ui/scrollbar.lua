local status_ok, scrollbar = pcall(require, 'scrollbar')
if not status_ok then
  return
end

scrollbar.setup()
