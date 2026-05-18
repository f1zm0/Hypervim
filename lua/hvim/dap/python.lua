local M = {}

function M.setup(dap)
   -- https://codeberg.org/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#python
   dap.adapters.python = function(cb, config)
      if config.request == 'attach' then
         ---@diagnostic disable-next-line: undefined-field
         local port = (config.connect or config).port
         ---@diagnostic disable-next-line: undefined-field
         local host = (config.connect or config).host or '127.0.0.1'
         cb({
            type = 'server',
            port = assert(port, '`connect.port` is required for a python `attach` configuration'),
            host = host,
            options = {
               source_filetype = 'python',
            },
         })
      else
         cb({
            type = 'executable',
            command = '.venv/bin/python',
            args = { '-m', 'debugpy.adapter' },
            options = {
               source_filetype = 'python',
            },
         })
      end
   end

   dap.configurations.python = {
      {
         -- The first three options are required by nvim-dap
         type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
         request = 'launch',
         name = 'Launch file',
         program = '${file}',
         pythonPath = function()
            local cwd = vim.fn.getcwd()
            -- Look for python executable in .venv first, then fallback to system python
            if vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
               return cwd .. '/.venv/bin/python'
            else
               return '/usr/bin/python'
            end
         end,
      },
   }
end

return M
