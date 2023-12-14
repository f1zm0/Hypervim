local M = {}

-- retrieve and return the number of plugins installed with packer
function M.get_installed_plugins()
  local ln = vim.fn.len
  local gl = vim.fn.globpath
  local pt = '~/.local/share/nvim/lazy'
  return ln(gl(pt, '*', 0, 1))
end

return M
