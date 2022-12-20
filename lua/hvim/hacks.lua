-- Workaround for MarkdownPreview options not working in config hook
-- ref: https://github.com/iamcco/markdown-preview.nvim/issues/501
local defaults = require('hvim.defaults').markdown_preview
local conv_util = require('hvim.util.conv')
local net_util = require('hvim.util.net')

vim.g.mkdp_open_to_the_world = conv_util.bool2int(not net_util.is_private_ip(defaults.ip))
vim.g.mkdp_open_ip = defaults.ip
vim.g.mkdp_port = defaults.port
vim.g.mkdp_page_title = '${name} - [MDPreview]'
vim.g.mkdp_echo_preview_url = 1
vim.g.mkdp_refresh_slow = 1
