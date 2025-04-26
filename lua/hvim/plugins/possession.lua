return {
   'gennaro-tedesco/nvim-possession',
   enabled = false,
   dependencies = {
      'ibhagwan/fzf-lua',
   },
   opts = {
      autoload = true, -- autoload session for cwd at startup (if exists)
      autosave = true, -- save session at exit, if we are in a session
   },
   config = true,
   build = function()
      -- default path, change if customized
      local sessions_path = vim.fn.stdpath('data') .. '/sessions'

      -- create session dir if not existing
      if vim.fn.isdirectory(sessions_path) == 0 then
         vim.uv.fs_mkdir(sessions_path, 511) -- 0777
      end
   end,
   init = function()
      local possession = require('nvim-possession')
      vim.keymap.set('n', '<leader>sl', function()
         possession.list()
      end)
      vim.keymap.set('n', '<leader>sn', function()
         possession.new()
      end)
      vim.keymap.set('n', '<leader>su', function()
         possession.update()
      end)
      vim.keymap.set('n', '<leader>sd', function()
         possession.delete()
      end)
   end,
}
