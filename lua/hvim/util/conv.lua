local M = {}

-- converts a boolean value to 0 or 1
-- returns 1 if true, false otherwise
function M.bool2int(b)
  return b and 1 or 0
end

return M
