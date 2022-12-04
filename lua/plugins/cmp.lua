-- nvim-cmp plugin guard
local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
  return
end

-- luasnip plugin guard
local snip_status_ok, luasnip = pcall(require, 'luasnip')
if not snip_status_ok then
  return
end

-- lspkind plugin guard
local kind_status_ok, _ = pcall(require, 'lspkind')
if not kind_status_ok then
  return
end

local lspkind_icons = {
  Text = '',
  Method = ' ',
  Function = '',
  Constructor = ' ',
  Field = ' ',
  Variable = ' ',
  Class = ' ',
  Interface = '',
  Module = '硫',
  Property = '',
  Unit = ' ',
  Value = '',
  Enum = ' ',
  Keyword = ' ',
  Snippet = ' ',
  Color = ' ',
  File = ' ',
  Reference = 'Ꮢ',
  Folder = ' ',
  EnumMember = ' ',
  Constant = ' ',
  Struct = ' ',
  Event = '',
  Operator = '',
  TypeParameter = ' ',
  Copilot = ' ',
}

-- custom highlights
-- vim.api.nvim_set_hl(0, 'CmpItemKindCopilot', { fg = '#5419cf' })

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion = {
      border = 'rounded',
      max_width = 60,
      min_width = 40,
      max_height = math.floor(vim.o.lines * 0.4),
      min_height = 3,
    },
    documentation = {
      border = 'rounded',
      max_width = 60,
      min_width = 40,
      max_height = math.floor(vim.o.lines * 0.4),
      min_height = 3,
    },
  },
  sources = cmp.config.sources({
    { name = 'copilot', group_index = 2 },
    { name = 'nvim_lsp', group_index = 2 },
    { name = 'treesitter', group_index = 2 },
    { name = 'path', group_index = 2 },
    { name = 'luasnip', group_index = 2 },
    {
      name = 'buffer',
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end,
      },
    },
  }),
  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = function(entry, vim_item)
      local meta_type = vim_item.kind
      -- load lspkind icons
      vim_item.kind = lspkind_icons[vim_item.kind] .. ''

      vim_item.menu = ({
        buffer = 'Buffer',
        nvim_lsp = meta_type,
        path = 'Path',
        luasnip = 'LuaSnip',
      })[entry.source.name]

      return vim_item
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-c>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace,
    }),
    ['Right'] = cmp.mapping.confirm({ select = true }),
  }),
  experimental = {
    ghost_text = {
      hl_group = 'Comment',
    },
  },
})
