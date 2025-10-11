local M = {}

---@param kind string
function M.pick(kind)
   return function()
      local actions = require('CopilotChat.actions')
      local items = actions[kind .. '_actions']()
      if not items then
         vim.notify('No ' .. kind .. ' found on the current line')
         return
      end
      require('CopilotChat.integrations.fzflua').pick(items)
   end
end

return {
   'CopilotC-Nvim/CopilotChat.nvim',
   -- config ref from docs:
   -- https://github.com/jellydn/lazy-nvim-ide/blob/main/lua/plugins/extras/copilot-chat-v2.lua
   dependencies = {
      { 'ibhagwan/fzf-lua' }, -- integration for actions prompt
      { 'nvim-lua/plenary.nvim', branch = 'master' },
   },
   -- build = 'make tiktoken', -- Only on MacOS or Linux (not using tiktoken for now)
   event = 'VeryLazy',
   keys = {
      -- Show prompts actions with fzf-lua
      {
         '<leader>aa',
         -- toggle CopilotChat side panel
         function()
            require('CopilotChat').toggle()
         end,
      },
      {
         "<leader>a?",
         function()
            local input = vim.fn.input("Ask Copilot: ")
            if input ~= "" then
               vim.cmd("CopilotChat " .. input)
            end
         end,
         desc = "CopilotChat - Ask input",
      },
      -- {
      --    "<leader>ax",
      --    ":CopilotChatInline",
      --    mode = "x",
      --    desc = "CopilotChat - Inline chat",
      -- },
      -- {
      --    '<leader>ap',
      --    function()
      --       local actions = require('CopilotChat.actions') -- .actions doesn't exist!!
      --       require('CopilotChat.integrations.fzflua').pick(actions.prompt_actions())
      --    end,
      --    desc = 'CopilotChat - Actions prompt',
      -- },
      {
         "<leader>aq",
         function()
            local input = vim.fn.input("Quick Chat: ")
            if input ~= "" then
               require("CopilotChat").ask(input, {
                  selection = require("CopilotChat.select").buffer
               })
            end
         end,
         desc = "CopilotChat - Quick chat",
      },

   },
   opts = function()
      local user = vim.env.USER or "User"
      user = user:sub(1, 1):upper() .. user:sub(2)
      return {
         auto_insert_mode = false,
         question_header = "  " .. user .. " ",
         answer_header = "  Copilot ",
         error_header = '> [!ERROR] Error',

         -- window pane
         window = {
            width = 0.4,
         },

         -- custom prompts
         prompts = {
            -- code
            Explain = 'Please explain how the following code works.',
            Review = 'Please review the following code and provide suggestions for improvement.',
            Tests = 'Please generate unit tests for the following code.',
            Refactor = 'Please refactor the following code to improve its clarity and readability.',
            FixCode = 'Please fix the following code to make it work as intended.',
            FixError = 'Please explain the error in the following text and provide a solution.',
            BetterNamings = 'Please provide better names for the following variables and functions.',
            Documentation = 'Please provide documentation for the following code.',
            SwaggerApiDocs = 'Please provide documentation for the following API using Swagger.',
            SwaggerJsDocs = 'Please write JSDoc for the following API using Swagger.',
            -- text
            Summarize = 'Please summarize the following text.',
            Spelling = 'Please correct any grammar and spelling errors in the following text.',
            Wording = 'Please improve the grammar and wording of the following text.',
            Concise = 'Please rewrite the following text to make it more concise.',
         },
         auto_follow_cursor = false, -- Don't follow the cursor after getting response
         mappings = {
            -- use tab for completion
            complete = {
               detail = 'Use @<Tab> or /<Tab> for options.',
               insert = '<Tab>',
            },
            -- close the chat
            close = {
               normal = 'q',
               insert = '<C-c>',
            },
            -- reset the chat buffer
            reset = {
               normal = '<C-x>',
               insert = '<C-x>',
            },
            -- submit the prompt to Copilot
            submit_prompt = {
               normal = '<CR>',
               insert = '<C-CR>',
            },
            -- accept the diff
            accept_diff = {
               normal = '<C-y>',
               insert = '<C-y>',
            },
            -- show help
            show_help = {
               normal = 'g?',
            },
         },
      }
   end,
   config = function(_, opts)
      local chat = require('CopilotChat')
      -- local select = require('CopilotChat.select')

      chat.setup(opts)

      -- set fzflua for ui select
      local fzf = require('fzf-lua')
      fzf.register_ui_select({
         fzf_lua = {
            winopts = {
               height = 0.4,
               width = 0.5,
               row = 1,
               col = 0.5,
            },
         },
      })
   end,
}
