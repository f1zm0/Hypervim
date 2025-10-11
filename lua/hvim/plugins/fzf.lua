return {
   'ibhagwan/fzf-lua',
   keys = {
      { '<leader>ff', '<cmd>FzfLua files no_header_i=true<cr>', desc = 'Find files' },
      { '<leader>fg', '<cmd>FzfLua live_grep<cr>',              desc = 'Find (grep) in files' },
      -- { '<leader>fb', '<cmd>FzfLua buffers<cr>',                desc = 'Find buffers' },
      { '<leader>b',  '<cmd>FzfLua buffers<cr>',                desc = 'Find buffers' },
      { '<leader>fh', '<cmd>FzfLua help_tags<cr>',              desc = 'Find tags' },
      { '<leader>fr', '<cmd>FzfLua oldfiles<cr>',               desc = 'Find recent files' },
      { '<leader>x',  '<cmd>FzfLua diagnostics_document<cr>',   desc = 'Show document diagnostics' },
      { '<leader>X',  '<cmd>FzfLua diagnostics_workspace<cr>',  desc = 'Show workspace diagnostics' },
   },
   dependencies = { 'nvim-tree/nvim-web-devicons' },
   opts = {
      grep = {
         rg_opts = string.format(
            [[--color=never --no-heading --line-number --column --smart-case --hidden --follow --ignore-file=%s]],
            vim.fn.expand("$HOME/.config/ignore/vim-ignore")
         ),
      },
      files = {
         fd_opts = string.format(
            [[--color=never --type f --hidden --follow --ignore-file=%s]],
            vim.fn.expand("$HOME/.config/ignore/vim-ignore")
         ),
      },
      oldfiles = {
         cwd_only = true,
         include_current_session = true,
      },
      previewers = {
         builtin = {
            syntax_limit_b = 1024 * 100, -- disable preview if file size >=100KB to avoid performance issues
         },
      },
   },
}
