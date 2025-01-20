return {
   'ibhagwan/fzf-lua',
   keys = {
      { '<leader>ff', '<cmd>FzfLua files no_header_i=true<cr>', desc = 'Find files' },
      { '<leader>fg', '<cmd>FzfLua live_grep<cr>', desc = 'Find (grep) in files' },
      { '<leader>fb', '<cmd>FzfLua buffers<cr>', desc = 'Find buffers' },
      { '<leader>fh', '<cmd>FzfLua help_tags<cr>', desc = 'Find tags' },
      { '<leader>fr', '<cmd>FzfLua oldfiles<cr>', desc = 'Find recent files' },
      { '<leader>x', '<cmd>FzfLua diagnostics_document<cr>', desc = 'Show document diagnostics' },
      { '<leader>X', '<cmd>FzfLua diagnostics_workspace<cr>', desc = 'Show workspace diagnostics' },
   },
   dependencies = { 'nvim-tree/nvim-web-devicons' },
   opts = {
      files = {
         rg_opts = "--files --hidden --column --line-number --no-heading --color=never --smart-case --follow -g '!.git/' --ignore-file=.gitignore",
         fd_opts = "--color=never --type f --hidden --follow --exclude .git --ignore-file .gitignore",
      },
      oldfiles = {
         cwd_only = true,
         include_current_session = true,
      },
      previewers = {
         builtin = {
            syntax_limit_b = 1024 * 100, -- disable preview if >=100KB, just to be safe
         },
      },
   },
}
