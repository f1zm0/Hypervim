return {
   'neovim/nvim-lspconfig',
   event = { 'BufReadPre', 'BufReadPost' }, -- LazyFile
   dependencies = { 'saghen/blink.cmp' },
   opts = {
      servers = require('hvim.defaults').lang_servers,
   },
   config = function(_, opts)
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local lspconfig = require('lspconfig')

      -- custom servers settings
      if opts.servers.lua_ls then
         opts.servers.lua_ls = vim.tbl_extend('force', opts.servers.lua_ls, require('hvim.servers.luals'))
      end
      if opts.servers.gopls then
         opts.servers.gopls = vim.tbl_extend('force', opts.servers.gopls, require('hvim.servers.gopls'))
      end

      -- extend server configs
      local extended_servers = {}
      for server, server_cfg in pairs(opts.servers) do
         extended_servers[server] = vim.tbl_extend('force', server_cfg, { capabilities = capabilities })
      end

      -- setup all servers
      for server, server_cfg in pairs(extended_servers) do
         lspconfig[server].setup(server_cfg)
      end

      vim.api.nvim_create_autocmd('LspAttach', {
         group = vim.api.nvim_create_augroup('UserLspConfig', {}),
         callback = function(args)
            vim.bo[args.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

            local bufopts = { buffer = args.buf }
            local client = vim.lsp.get_client_by_id(args.data.client_id)

            -- map key to toogle inlay hints if server supports it
            if client and client.server_capabilities.inlayHintProvider then
               vim.keymap.set('n', '<leader>ih', function()
                  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
               end, bufopts)
            end

            -- map the following keys after the lang server attaches to the current buffer
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
            vim.keymap.set('n', 'gd', function()
               require('fzf-lua').lsp_definitions()
            end, bufopts)
            vim.keymap.set('n', 'gr', function()
               require('fzf-lua').lsp_references()
            end, bufopts)
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', function()
               require('fzf-lua').lsp_code_actions()
            end, bufopts)
            vim.keymap.set('n', 'gx', function()
               vim.diagnostic.goto_next()
            end, bufopts)
            vim.keymap.set('n', 'gX', function()
               vim.diagnostic.goto_prev()
            end, bufopts)
            vim.keymap.set('n', 'X', function()
               vim.diagnostic.open_float()
            end, bufopts)
         end,
      }) -- autocmd end --
   end,
}
