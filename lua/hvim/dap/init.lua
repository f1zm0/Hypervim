local M = {}

function M.setup(dap)
   require('hvim.dap.python').setup(dap)
   require('hvim.dap.go').setup(dap)
end

return M
