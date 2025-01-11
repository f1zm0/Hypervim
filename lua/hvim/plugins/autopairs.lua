return {
   'windwp/nvim-autopairs',
   event = 'InsertEnter',
   opts = {
      check_ts = true,
      ts_config = {
         lua = { 'string', 'source' },
         javascript = { 'string', 'template_string' },
      },
      disable_filetype = { 'TelescopePrompt' },
      enable_check_bracket_line = false, -- don't add pairs if the next char is close pair is in line
      fast_wrap = {
         map = '<M-e>',
         chars = { '{', '[', '(', '"', "'", '`' },
         pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
         end_key = '$',
         keys = 'qwertyuiopzxcvbnmasdfghjkl',
         check_comma = true,
         highlight = 'Search',
         highlight_grey = 'LineNr',
      },
   },
   -- config = function()
   --   require("nvim-autopairs").setup({})
   --   -- integration with nvim-cmp
   --   local cmp_autopairs = require("nvim-autopairs.completion.cmp")
   --   if cmp_autopairs then
   --     cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
   --   else
   --     print("nvim-cmp not found")
   --   end
   -- end,
}
