return {
   'kevinhwang91/nvim-ufo',
   dependencies = {
      { 'kevinhwang91/promise-async' },
   },
   config = function()
      -- Fold options
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
      vim.o.foldcolumn = '0' -- fold signs in col 0 -> don't show
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      require('ufo').setup()
   end,
}
