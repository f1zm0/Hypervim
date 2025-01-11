return {
   'nvim-neo-tree/neo-tree.nvim',
   branch = 'v3.x',
   dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
   },
   keys = {
      { '<leader>e', '<cmd>Neotree<cr>' },
   },
   opts = {
      close_if_last_window = true,
      popup_border_style = 'rounded',
      window = {
         position = 'float',
      },
      filesystem = {
         filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = {
               '.DS_Store',
               'thumbs.db',
            },
            never_show = { '.git' },
         },
      },
   },
}
