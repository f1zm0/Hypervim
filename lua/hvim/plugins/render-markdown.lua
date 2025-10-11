return {
   'MeanderingProgrammer/render-markdown.nvim',
   dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons'
   },
   opts = {
      file_types = {
         'markdown',
         'copilot-chat',
      }
   },
   ft = {
      'markdown',
      'copilot-chat',
   },
}
