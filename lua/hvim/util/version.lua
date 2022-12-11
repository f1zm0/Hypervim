local M = {}

-- check if current neovim version is greater or equal v0.7.0
-- return true if it is, false otherwise
function M.check_nvim_version()
  local current_version = vim.api.nvim_command_output(':version'):match('(%d+%.%d+%.%d+)')
  local major, minor, patch = current_version:match('(%d+)%.(%d+)%.(%d+)')
  major, minor, patch = tonumber(major), tonumber(minor), tonumber(patch)
  if major < 0 or minor < 7 then
    print('Hypervim requires Neovim v0.7.0 or higher, please update your Neovim version')
    return false
  end
  return true
end

-- use the github API to retrieve the latest release version of the repository
-- at github.com/f1zm0/Hpervim. If response status code is 404 return 'dev'
function M.get_latest_hvim_version()
  local response = vim.fn.system({
    'curl',
    '-s',
    '-H',
    'Accept: application/vnd.github.v3+json',
    'https://api.github.com/repos/f1zm0/Hypervim/releases/latest',
  })
  -- check if response status code is 404
  if response:find('Not Found') then
    return 'dev'
  end

  -- extract tag name
  local tag_name = vim.fn.json_decode(response).tag_name
  if tag_name == nil then
    return 'dev'
  end
  return tag_name
end

function M.get_hvim_current_version()
  -- HACK: find a way to retrieve the current version in use
  return M.get_latest_hvim_version()
end

return M
