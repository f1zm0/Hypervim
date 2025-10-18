return {
   "mfussenegger/nvim-lint",
   lazy = true,
   event = { "BufReadPre", "BufNewFile" },
   config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
         javascript = { "eslint_d" },
         typescript = { "eslint_d" },
         vue = { "eslint_d" },
         go = { "golangcilint" },
         python = { "ruff" }
      }
      -- auto lint on save
      vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
         callback = function()
            lint.try_lint()
         end,
      })
   end,
}
