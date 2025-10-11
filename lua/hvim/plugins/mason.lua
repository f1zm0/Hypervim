return {
   'williamboman/mason.nvim',
   dependencies = {
      'williamboman/mason-lspconfig.nvim',
   },
   config = function()
      require('mason').setup({
         ui = {
            icons = {
               package_installed = '✓',
               package_pending = '➜',
               package_uninstalled = '✗',
            },
         },
      })

      local servers_and_tools = {}

      local lsp_servers = require('hvim.defaults').lsp_servers
      local lang_tools = require('hvim.defaults').lang_tools

      -- merge servers and tools into one table
      for _, server_name in pairs(lsp_servers) do
         servers_and_tools[server_name] = {}
      end
      for _, tool in ipairs(lang_tools) do
         servers_and_tools[tool] = {}
      end

      require('mason-lspconfig').setup({
         automatic_installation = true,
         ensure_installed = servers_and_tools,
      })
   end,
}
