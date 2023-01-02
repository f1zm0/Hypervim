local status_ok, autosess = pcall(require, 'auto-session')
if not status_ok then
  return
end

autosess.setup({
  log_level = 'info',
  auto_session_enable_last_session = false,
  auto_session_root_dir = vim.fn.stdpath('data') .. '/sessions/',
  auto_session_enabled = false,
  auto_save_enabled = false,
  auto_restore_enabled = false,
  auto_session_suppress_dirs = nil,
  auto_session_use_git_branch = nil,
})

-- auto-sessions
vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal'

-- close NvimTree buffer when exiting, open it at startup
vim.api.nvim_exec(
  [[ 
let g:auto_session_pre_save_cmds = ["NvimTreeClose"]
let g:auto_session_post_restore_cmds = ["NvimTreeOpen"]
]],
  true
)

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
