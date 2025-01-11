return {
   'stevearc/conform.nvim',
   event = { 'BufWritePre' },
   opts = {
      formatters_by_ft = {
         css = { 'prettierd' },
         go = { 'goimports', 'gofumpt' },
         graphql = { 'prettierd' },
         html = { 'prettierd' },
         javascript = { 'prettierd' },
         javascriptreact = { 'prettierd' },
         jsonc = { 'prettierd' },
         json = { 'prettierd' },
         lua = { 'stylua' },
         markdown = { 'prettierd' },
         python = { 'black' },
         rust = { 'rustfmt', lsp_format = 'fallback' },
         scss = { 'prettierd' },
         typescript = { 'prettierd' },
         typescriptreact = { 'prettierd' },
         vue = { 'prettierd' },
         yaml = { 'prettierd' },
      },
      format_on_save = {
         -- These options will be passed to conform.format()
         timeout_ms = 500,
         lsp_fallback = true,
      },
   },
}
