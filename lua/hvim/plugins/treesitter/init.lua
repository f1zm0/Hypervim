local status_ok, _ = pcall(require, 'nvim-treesitter')
if not status_ok then
  return
end

require('nvim-treesitter.configs').setup({
  ensure_installed = require('hvim.defaults').treesitter.ensure_installed,
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true, disable = { 'yaml', 'python' } },

  -- disable highlighting for huge files
  disable = function(_, buf)
    local max_filesize = 100 * 1024 -- 100 KB
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    if ok and stats and stats.size > max_filesize then
      return true
    end
  end,
})
