local status_ok, formatter = pcall(require, 'formatter')
if not status_ok then
  return
end

formatter.setup({
  filetype = {
    go = {
      require('formatter.filetypes.go').gofumpt,
      require('formatter.filetypes.go').goimports,
      require('formatter.filetypes.go').golines,
    },
    python = {
      require('formatter.filetypes.python').black,
    },
    javascript = {
      require('formatter.filetypes.javascript').prettier,
    },
    lua = {
      require('formatter.filetypes.lua').stylua,
    },
    markdown = {
      require('formatter.filetypes.markdown').prettier,
    },
    yaml = {
      require('formatter.filetypes.yaml').prettier,
    },
    json = {
      require('formatter.filetypes.json').prettier,
    },
  },
})

-- format on save
vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]],
  true
)
