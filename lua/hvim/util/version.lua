local M = {}

local exec = require('hvim.util.jobs').exec
local min_required_version = {
  major = 0,
  minor = 8,
  patch = 0,
}

-- check current neovim version
-- @return boolean: true if version is greater or equal min_required_version
function M.check_nvim_version()
  local current_version = vim.api.nvim_command_output(':version'):match('(%d+%.%d+%.%d+)')
  local major, minor, patch = current_version:match('(%d+)%.(%d+)%.(%d+)')
  major, minor, patch = tonumber(major), tonumber(minor), tonumber(patch)

  if major < min_required_version.major or minor < min_required_version.minor then
    local min_version = table.concat(min_required_version, '.')
    print('Hypervim requires Neovim' .. min_version .. 'or higher, please upgrade your Neovim version')
    return false
  end

  return true
end

-- use the github API to retrieve the latest tag name
-- @return string: latest tag name
function M.get_latest_hvim_version()
  local _, out, errors = exec('curl', {
    '-s',
    '-H',
    'Accept: application/vnd.github.v3+json',
    'https://api.github.com/repos/f1zm0/Hypervim/releases/latest',
  })
  local response = vim.fn.json_decode(out)
  if not vim.tbl_isempty(errors) or response.tag_name == nil then
    return nil
  end
  return response.tag_name
end

-- get latest tag name or commit number
-- @return string: latest tag name or commit number
function M.get_hvim_current_version()
  local _, out, errors = exec('git', {
    args = { 'describe', '--tags', '--always' },
  })
  if not vim.tbl_isempty(errors) then
    return 'dev'
  end

  return out[1]
end

return M
