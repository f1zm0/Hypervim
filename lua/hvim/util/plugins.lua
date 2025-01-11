local M = {}

-- retrieve and return the number of installed plugins
function M.get_installed_plugins()
   local lazy_dirpath = vim.fn.stdpath('data') .. '/lazy'
   local num_items = vim.fn.globpath(lazy_dirpath, '*', false, 1)
   return vim.fn.len(num_items)
end

return M
