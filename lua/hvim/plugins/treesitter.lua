return {
   'nvim-treesitter/nvim-treesitter',
   version = false,
   lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file
   event = { 'BufReadPre', 'BufNewFile' },
   init = function(plugin)
      require('lazy.core.loader').add_to_rtp(plugin)
      require('nvim-treesitter.query_predicates')
   end,
   opts = {
      ensure_intalled = require('hvim.defaults').lang_parsers,
      highlight = { enable = true },
      indent = { enable = true },
   },
}
