return {
   cmd = { 'lua-language-server' },
   filetypes = { 'lua' },
   root_markers = { '.luarc.json', '.luarc.jsonc' },
   settings = {
      Lua = {
         diagnostics = {
            enable = true,
            globals = {
               'vim',
            },
         },
         runtime = {
            version = 'LuaJIT',
         },
         -- workspace = {
         --    library = {
         --       [vim.fn.expand('$VIMRUNTIME/lua')] = true,
         --       [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
         --    },
         --    maxPreload = 100000,
         --    preloadFileSize = 10000,
         -- },
         telemetry = {
            enable = false,
         },
      },
   },
}
