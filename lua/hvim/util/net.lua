local M = {}

-- check if the ip is private by comparing it against private ranges
-- return true if it's private, false otherwise;
function M.is_private_ip(ip)
  local octets = vim.split(ip, '%.')
  local first_octet = tonumber(octets[1])
  local second_octet = tonumber(octets[2])
  if first_octet == 10 then
    return true
  elseif first_octet == 172 and second_octet >= 16 and second_octet <= 31 then
    return true
  elseif first_octet == 192 and second_octet == 168 then
    return true
  elseif first_octet == 100 and second_octet >= 64 and second_octet <= 127 then
    return true
  end
  return false
end

return M
