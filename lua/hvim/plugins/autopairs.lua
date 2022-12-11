local status_ok, autopairs = pcall(require, 'nvim-autopairs')
if not status_ok then
  return
end

autopairs.setup({
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
})

-- integration with nvim-cmp
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
  return
end
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
