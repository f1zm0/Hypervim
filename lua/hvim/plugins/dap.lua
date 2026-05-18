return {
   'mfussenegger/nvim-dap',
   dependencies = {
      'theHamsta/nvim-dap-virtual-text',
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
   },
   config = function()
      local dap = require('dap')
      local dapui = require('dapui')
      local dap_virtual_text = require('nvim-dap-virtual-text')

      -- ui setup
      dapui.setup()
      dap_virtual_text.setup({
         commented = true,
      })

      -- servers setup
      require('hvim.dap').setup(dap)

      -- ui listeners
      dap.listeners.before.attach.dapui_config = function()
         dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
         dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
         dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
         dapui.close()
      end

      -- keymaps
      vim.api.nvim_set_keymap('n', '<F5>', '<cmd>lua require"dap".continue()<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<F10>', '<cmd>lua require"dap".step_over()<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<F11>', '<cmd>lua require"dap".step_into()<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<F12>', '<cmd>lua require"dap".step_out()<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap(
         'n',
         '<leader>bp',
         '<cmd>lua require"dap".toggle_breakpoint()<CR>',
         { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
         'n',
         '<leader>bP',
         '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
         { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
         'n',
         '<leader>bl',
         '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
         { noremap = true, silent = true }
      )
      vim.keymap.set('n', '<leader>dc', function()
         require('dapui').close()
         require('dap').close()
      end, { silent = true, noremap = true })

      -- ui tweaks
      vim.fn.sign_define('DapBreakpoint', {
         text = '⬤',
         texthl = 'Conditional',
         linehl = 'DapBreakpoint',
         numhl = 'DapBreakpoint',
      })
      vim.fn.sign_define(
         'DapBreakpointCondition',
         { text = '󱣿', texthl = 'VisualNOS', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' }
      )
      vim.fn.sign_define(
         'DapBreakpointRejected',
         { text = '', texthl = 'Number', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' }
      )
      vim.fn.sign_define(
         'DapStopped',
         { text = '󱞪', texthl = 'Character', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' }
      )
      vim.fn.sign_define('DapLogPoint', {
         text = '',
         texthl = 'Constant',
         linehl = 'DapBreakpoint',
         numhl = 'DapBreakpoint',
      })
   end,
}
