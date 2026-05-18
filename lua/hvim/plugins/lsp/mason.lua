return {
   'mason-org/mason-lspconfig.nvim',
   enabled = require('hvim.defaults').mason_auto_install_config,
   opts = {
      -- list of servers that must be installed
      ensure_installed = require('hvim.defaults').lsp_servers or {},
   },
   dependencies = {
      -- make sure mason and lspconfig are loaded before mason-lspconfig
      {
         'mason-org/mason.nvim',
         enabled = require('hvim.defaults').mason_auto_install_config,
         opts = {
            ui = {
               icons = {
                  package_installed = '✓',
                  package_pending = '➜',
                  package_uninstalled = '✗',
               },
            },
         },
      },
      {
         'neovim/nvim-lspconfig',
      },
      {
         'WhoIsSethDaniel/mason-tool-installer.nvim',
         enabled = require('hvim.defaults').mason_auto_install_config,
         opts = {
            ensure_installed = require('hvim.defaults').lang_tools or {},
         },
         dependencies = {
            'mason-org/mason.nvim',
         },
      },
   },
}
