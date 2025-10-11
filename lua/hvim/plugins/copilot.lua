return {
   'zbirenbaum/copilot.lua',
   cmd = 'Copilot',
   event = 'InsertEnter',
   opts = {
      suggestion = {
         auto_trigger = true,
         keymap = {
            accept = '<M-p>',      -- accept prompt suggestion
            accept_line = '<M-l>', -- accept line suggestion
            accept_word = '<M-w>', -- accept word suggestion
            next = '<M-]>',        -- go to the next suggestion
            prev = '<M-[>',        -- go to the previous suggestion
            dismiss = '<M-\\>',    -- dismiss the suggestions
         },
      },
      panel = { enabled = false },
      filetypes = {
         -- default disabled filetypes
         yaml = true,
         markdown = false,
         help = false,
         gitcommit = false,
         gitrebase = false,
         hgcommit = false,
         svn = false,
         cvs = false,
         ["."] = false,
      },
   },
}
