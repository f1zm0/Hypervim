return {
   "rachartier/tiny-inline-diagnostic.nvim",
   event = "VeryLazy",
   priority = 1000,
   config = function()
      require("tiny-inline-diagnostic").setup({
         options = {
            throttle = 100,

            virt_texts = {
               priority = 5000,
            },
            show_source = {
               enabled = true,
               if_many = false,
            },
            set_arrow_to_diag_color = true,

            show_all_diags_on_cursorline = true,
            multilines = true,

            add_messages = {
               messages = false,            -- show full diagnostic messages
               display_count = true,        -- show diagnostic count instead of messages when cursor not on line
               use_max_severity = false,    -- when counting, only show the most severe diagnostic
               show_multiple_glyphs = true, -- show multiple icons for multiple diagnostics of same severity
            },
         },
         disabled_ft = { "lazy" },
      })

      -- disable neovim's default virtual text diagnostics
      vim.diagnostic.config({ virtual_text = false })
   end,
}
