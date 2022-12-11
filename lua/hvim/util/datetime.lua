local M = {}

-- return the current date and time in the format: YYYY-MM-DD HH:MM:SS
function M.get_current_datetime()
  return os.date('%d-%m-%Y %H:%M')
end

-- return current time in format %H:%M
function M.get_current_time()
  return os.date('%H:%M')
end

return M
