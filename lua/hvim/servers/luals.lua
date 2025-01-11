return {
   settings = {
      Lua = {
         runtime = {
            version = 'LuaJIT',
         },
         diagnostics = {
            globals = {
               'vim',
            },
         },
         workspace = {
            library = {
               [vim.fn.expand('$VIMRUNTIME/lua')] = true,
               [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
            },
            maxPreload = 100000,
            preloadFileSize = 10000,
         },
         telemetry = {
            enable = false,
         },
      },
   },
}
