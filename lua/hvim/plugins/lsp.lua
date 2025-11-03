return {
   "neovim/nvim-lspconfig",
   event = { 'BufReadPre', 'BufReadPost' },
   dependencies = {
      'saghen/blink.cmp',
   },
   config = function()
      local lsp_servers = require("hvim.defaults").lsp_servers
      local capabilities = require("hvim.lsp.capabilities").make_capabilities()

      -- config servers
      vim.lsp.config['lua_ls'] = require('hvim.lsp.servers.luals')
      vim.lsp.config['gopls'] = require('hvim.lsp.servers.gopls')

      -- set capabilities for all servers
      vim.lsp.config('*', {
         capabilities = capabilities,
         flags = {
            debounce_text_changes = 500,
         },
      })

      -- enable servers
      for _, server in ipairs(lsp_servers) do
         vim.lsp.enable(server)
      end

      -- setup autocmds
      vim.api.nvim_create_autocmd('LspAttach', {
         group = vim.api.nvim_create_augroup('UserLspConfig', {}),
         callback = function(args)
            vim.bo[args.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

            local bufopts = { buffer = args.buf }
            local client = vim.lsp.get_client_by_id(args.data.client_id)

            -- map key to toogle inlay hints if server supports it
            if client and client.server_capabilities.inlayHintProvider then
               vim.keymap.set('n', '<leader>ih', function()
                  -- vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                  local bufnr = vim.api.nvim_get_current_buf()
                  vim.lsp.inlay_hint.enable(bufnr, not vim.lsp.inlay_hint.is_enabled(bufnr))
               end, bufopts)
            end

            -- map the following keys after the lang server attaches to the current buffer
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
            vim.keymap.set('n', 'gd', function()
               require('fzf-lua').lsp_definitions()
            end, bufopts)
            vim.keymap.set('n', 'gt', function()
               require('fzf-lua').lsp_typedefs()
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
   end
}
