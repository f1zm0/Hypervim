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
      local lang_servers = require('hvim.defaults').lang_servers
      local lang_tools = require('hvim.defaults').lang_tools

      -- merge servers and tools into one table
      for server, _ in pairs(lang_servers) do
         servers_and_tools[server] = {}
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
