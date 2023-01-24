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

-- kind icons
local kind_icons = require('hvim.ui.icons').completion

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion = {
      border = '',
      max_width = 60,
      min_width = 40,
      max_height = math.floor(vim.o.lines * 0.4),
      min_height = 3,
    },
    documentation = {
      border = '',
      max_width = 60,
      min_width = 40,
      max_height = math.floor(vim.o.lines * 0.4),
      min_height = 3,
    },
  },
  sources = cmp.config.sources(require('hvim.plugins.cmp.sources')),
  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = function(entry, vim_item)
      local meta_type = vim_item.kind
      -- load lspkind icons
      vim_item.kind = kind_icons[vim_item.kind]

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
    ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { 'i' }),
    ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { 'i' }),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-c>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace,
    }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if require('copilot.suggestion').is_visible() then
        require('copilot.suggestion').accept()
      elseif cmp.visible() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
    ['<S-Tab>'] = function(fallback)
      if not cmp.select_prev_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,
  }),
  experimental = {
    ghost_text = {
      hl_group = 'Comment',
    },
  },
})
