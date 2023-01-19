local copilot_defaults = require('hvim.defaults').copilot

local cmp_sources = {
  { name = 'nvim_lsp', group_index = 2 },
  { name = 'treesitter', group_index = 2 },
  { name = 'path', group_index = 2 },
  { name = 'emoji', group_index = 3 },
  { name = 'luasnip', group_index = 4 },
  {
    name = 'buffer',
    option = {
      get_bufnrs = function()
        return vim.api.nvim_list_bufs()
      end,
    },
  },
}

-- if mode is set to 'cmp', copilot auto trigger is set to false,
-- and copilot is added as a cmp source
if copilot_defaults.mode == 'cmp' then
  table.insert(cmp_sources, 1, { name = 'copilot', group_index = 1 })
end

return cmp_sources
