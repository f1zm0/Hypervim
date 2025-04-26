return {
   'stevearc/conform.nvim',
   event = { 'BufWritePre' },
   opts = {
      formatters_by_ft = {
         css = { 'prettier' },
         go = { 'goimports', 'gofumpt' },
         graphql = { 'prettier' },
         html = { 'prettier' },
         javascript = { 'prettier' },
         javascriptreact = { 'prettier' },
         jsonc = { 'prettier' },
         json = { 'prettier' },
         lua = { 'stylua' },
         markdown = { 'prettier' },
         python = { 'black' },
         rust = { 'rustfmt', lsp_format = 'fallback' },
         scss = { 'prettier' },
         typescript = { 'prettier' },
         typescriptreact = { 'prettier' },
         vue = { 'prettier' },
         yaml = { 'prettier' },
      },
      format_on_save = {
         -- These options will be passed to conform.format()
         timeout_ms = 500,
         lsp_fallback = true,
      },
   },
}
