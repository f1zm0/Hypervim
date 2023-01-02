local M = {}

function M.exec(cmd, opts)
  local plenary_ok, Job = pcall(require, 'plenary.job')
  if not plenary_ok then
    return 1, '', 'plenary not found'
  end

  opts = opts or {}
  opts.cwd = opts.cwd or vim.fn.stdpath('config')

  local errors = {}
  local out, ret = Job:new({
    command = cmd,
    args = opts.args,
    cwd = opts.cwd,
    on_stderr = function(_, data)
      table.insert(errors, data)
    end,
  }):sync()

  -- check errors
  if vim.tbl_isempty(errors) then
    return 1, '', errors
  end

  return ret, out, errors
end

return M
