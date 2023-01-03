local M = {}

function M.get_currdir()
  local parts = vim.split(vim.fn.getcwd(), '/')
  return parts[#parts]
end

function M.diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

return M
