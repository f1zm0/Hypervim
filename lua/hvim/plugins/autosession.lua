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
  theme = 'dropdown',
  theme_conf = {
    layout_config = {
      width = 0.85,
      height = 0.2,
    },
    borderchars = require('telescope.config').values.borderchars,
    layout_strategy = 'flex',
  },
  previewer = false,
})

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
