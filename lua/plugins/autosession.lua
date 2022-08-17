local as_status_ok, sessions = pcall(require, 'auto-session')
local sl_status_ok, lens = pcall(require, 'session-lens')
if not (as_status_ok and sl_status_ok) then
  return
end

vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal'

local opts = {
  log_level = 'info',
  auto_session_enable_last_session = false,
  auto_session_root_dir = vim.fn.stdpath('data') .. '/sessions/',
  auto_session_enabled = false,
  auto_save_enabled = false,
  auto_restore_enabled = false,
  auto_session_suppress_dirs = nil,
  auto_session_use_git_branch = nil,
}

sessions.setup(opts)

lens.setup({
  path_display = { 'shorten' },
})

-- save current session on exit
vim.api.nvim_exec(
  [[
augroup SessionsManagement
  autocmd!
  autocmd VimLeavePre * SaveSession
augroup END
]],
  true
)
