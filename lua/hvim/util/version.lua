local M = {}

local exec = require('hvim.util.jobs').exec

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

-- use the github API to retrieve the latest tag name
-- return the latest release version or nil
function M.get_latest_hvim_version()
  local ok, response = pcall(
    vim.fn.json_decode,
    vim.fn.system({
      'curl',
      '-s',
      '-H',
      'Accept: application/vnd.github.v3+json',
      'https://api.github.com/repos/f1zm0/Hypervim/releases/latest',
    })
  )
  local _, out, errors = exec('curl', {
    '-s',
    '-H',
    'Accept: application/vnd.github.v3+json',
    'https://api.github.com/repos/f1zm0/Hypervim/releases/latest',
  })
  response = vim.fn.json_decode(out)
  if not ok or response.tag_name == nil then
    return nil
  end
  return response.tag_name
end

-- get latest tag name or commit number
function M.get_hvim_current_version()
  -- use git_cmd function to run git command
  local _, out, err = exec('git', {
    args = { 'describe', '--tags', '--always' },
  })
  if err ~= '' then
    return 'dev'
  end
  return out[1]
end

return M
