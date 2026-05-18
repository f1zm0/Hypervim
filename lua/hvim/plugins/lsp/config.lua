return {
   'neovim/nvim-lspconfig',
   event = { 'BufReadPre', 'BufReadPost' },
   dependencies = {
      'saghen/blink.cmp',
   },
   config = function()
      -- setup autocmds
      vim.api.nvim_create_autocmd('LspAttach', {
         group = vim.api.nvim_create_augroup('UserLspConfig', {}),
         callback = function(args)
            vim.bo[args.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

            -- disable inlay hints by default, since they can be quite noisy
            vim.lsp.inlay_hint.enable(false)

            -- add autocommand to toggle inlay hints with <leader>ih
            vim.api.nvim_create_autocmd('LspAttach', {
               callback = function(attach_args)
                  local client = vim.lsp.get_client_by_id(attach_args.data.client_id)
                  if client and client.server_capabilities and client.server_capabilities.inlayHintProvider then
                     local bufnr = args.buf
                     vim.keymap.set('n', '<leader>ih', function()
                        local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
                        vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
                     end, { buffer = bufnr, desc = 'Toggle inlay hints' })
                  end
               end,
            })

            -- map the following keys after the lang server attaches to the current buffer
            local bufopts = { buffer = args.buf }

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
               vim.diagnostic.get_next()
            end, bufopts)
            vim.keymap.set('n', 'gX', function()
               vim.diagnostic.get_prev()
            end, bufopts)
            vim.keymap.set('n', 'X', function()
               vim.diagnostic.open_float()
            end, bufopts)
         end,
      }) -- autocmd end --
   end,
}
