return {
   'lewis6991/gitsigns.nvim',
   event = { 'BufReadPre', 'BufNewFile' },
   opts = {
      signs = {
         add = { text = '│' },
         change = { text = '│' },
         delete = { text = '_' },
         topdelete = { text = '‾' },
         changedelete = { text = '~' },
      },
      signs_staged = {
         add = { text = '▎' },
         change = { text = '▎' },
         delete = { text = '' },
         topdelete = { text = '' },
         changedelete = { text = '▎' },
      },
      on_attach = function(buffer)
         local gs = package.loaded.gitsigns

         local function map(mode, l, r, desc)
            vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
         end
      end,
   },
}
