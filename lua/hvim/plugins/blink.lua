local function show_nocmdline_nosearch(ctx)
   -- disable auto-show in cmdline mode
   -- if ctx.mode == 'cmdline' then
   --    return false
   -- end

   -- disable auto-show when searching
   if vim.tbl_contains({ '/', '?' }, vim.fn.getcmdtype()) then
      return false
   end

   return true
end

return {
   'saghen/blink.cmp',
   version = '1.*',
   dependencies = {
      -- additional sources
   },
   opts = {
      keymap = {
         ['<C-e>'] = { 'hide', 'fallback' },
         ['<C-y>'] = { 'accept', 'fallback' },
         ['<C-n>'] = { 'select_next', 'show' },
         ['<C-p>'] = { 'select_prev' },
         ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
         ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
         ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
      },
      appearance = {
         kind_icons = require('hvim.ui.icons').completion,
         use_nvim_cmp_as_default = true,
         nerd_font_variant = 'mono',
      },
      fuzzy = { implementation = 'lua' },
      sources = {
         default = { 'lsp', 'path', 'buffer' }, -- snippets
      },
      signature = { enabled = true },
      completion = {
         ghost_text = {
            enabled = false, -- 'true' conflicts with copilot
         },
         list = {
            -- insert item while navigating
            selection = { preselect = true, auto_insert = true },
            -- max_items = 8,
         },
         menu = {
            auto_show = show_nocmdline_nosearch,
            draw = {
               treesitter = { 'lsp' }, -- experimental!
               -- more customization options:
               -- https://cmp.saghen.dev/configuration/completion#completion-menu-draw
               columns = {
                  { 'label',     'label_description', gap = 2 },
                  { 'kind_icon', gap = 1 },
                  { 'kind' },
               },
            },
         },
         documentation = {
            auto_show = true,
            auto_show_delay_ms = 500,
         },
      },
   },
   opts_extend = { 'sources.default' },
   config = function(_, opts)
      require('blink.cmp').setup(opts)

      -- dismiss copilot suggestions on blink-cmp menu open and close
      -- ref: https://cmp.saghen.dev/recipes.html#hide-copilot-on-suggestion
      -- vim.api.nvim_create_autocmd('User', {
      --    pattern = 'BlinkCmpMenuOpen',
      --    callback = function()
      --       require('copilot.suggestion').dismiss()
      --       vim.b.copilot_suggestion_hidden = true
      --    end,
      -- })
      -- vim.api.nvim_create_autocmd('User', {
      --    pattern = 'BlinkCmpMenuClose',
      --    callback = function()
      --       vim.b.copilot_suggestion_hidden = false
      --    end,
      -- })
   end,
}
