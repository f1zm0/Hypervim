-- base
require('core.options')
require('core.keybindings')

-- plugins config
require('plugins')
require('plugins.treesitter')
require('plugins.telescope')
require('plugins.cmp')
require('plugins.autopairs')
require('plugins.nvim-tree')
require('plugins.autosession')
require('plugins.blankline')
require('plugins.gitsigns')
require('plugins.comment')
require('plugins.todo')
require('plugins.keybindings')

-- LSP
require('lsp.config')
require('lsp.installer')
require('lsp.servers')
require('lsp.signature')
require('lsp.formatter')
require('lsp.trouble')
require('lsp.fidget')

-- UI and styling
require('ui.colors')
require('ui.bufferline')
require('ui.statusline')
require('ui.alpha')
require('ui.colorizer')
require('ui.windows')
