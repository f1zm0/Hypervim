local M = {}

M.globals = {
  mapleader = ',',
  noswapfile = true,
  nobackup = true,
  nowritebackup = true,
  nowb = true,
}

M.options = {
  ignorecase = false,
  hlsearch = true,
  ruler = false,
  number = true,
  relativenumber = true,
  showmatch = true,
  hidden = true, -- buffers
  cursorline = true, -- file navigation
  expandtab = true,
  smartindent = true,
  shiftwidth = 4,
  tabstop = 4,
  clipboard = 'unnamedplus',
  pumblend = 5, -- popup bg transparency
  updatetime = 300,
}

M.startup_tasks = {
  -- check if there is a new Hypervim release
  check_hvim_updates = false,
  -- run :PackerSync to update plugins (not recommended)
  sync_plugins = false,
}

M.lsp_servers = {
  -- LSP servers to install
  ensure_installed = {
    'bashls',
    'clangd',
    'cssls',
    'eslint',
    'golangci_lint_ls',
    'gopls',
    'jsonls',
    'pyright',
    'rust_analyzer',
    'sumneko_lua',
    'tsserver',
    'yamlls',
  },
}

M.treesitter = {
  -- parsers to install
  ensure_installed = {
    'bash',
    'c',
    'comment',
    'cpp',
    'css',
    'dockerfile',
    'go',
    'gomod',
    'graphql',
    'html',
    'javascript',
    'json',
    'lua',
    'markdown',
    'python',
    'regex',
    'rust',
    'toml',
    'tsx',
    'typescript',
    'yaml',
  },
}

M.keymaps = {
  normal_mode = {
    -- quicker exit
    ['<leader>q'] = '<cmd>qall<cr>',
    ['<leader>wq'] = '<cmd>wqall<cr>',

    -- buffer navigation and management
    ['<Tab>'] = '<cmd>bnext<cr>',
    ['<S-Tab>'] = '<cmd>bprev<cr>',
    ['<leader>d'] = '<cmd>bp | bd #<cr>',
    ['<leader>c'] = '<C-w>c',

    -- window navigation
    ['<c-h>'] = '<C-w>h',
    ['<c-j>'] = '<C-w>j',
    ['<c-k>'] = '<C-w>k',
    ['<c-l>'] = '<C-w>l',

    -- window resizing
    ['<c-Left>'] = '<cmd>vertical resize -2<cr>',
    ['<c-Down>'] = '<cmd>resize +2<cr>',
    ['<c-Up>'] = '<cmd>resize -2<cr>',
    ['<c-Right>'] = '<cmd>vertical resize +2<cr>',

    -- faster splits
    ['\\'] = '<cmd>split<cr>',
    ['|'] = '<cmd>vsplit<cr>',

    -- Move current line up/down
    ['<A-j>'] = ":m '>+1<CR>gv-gv",
    ['<A-k>'] = ":m '<-2<CR>gv-gv",

    -- open config entrypoint
    ['<leader>rc'] = '<cmd>e ' .. os.getenv('MYVIMRC') .. '<cr>',

    -- packer sync and clean plugins
    ['<leader>ps'] = '<cmd>PackerSync<cr>',
    ['<leader>pc'] = '<cmd>PackerClean<cr>',

    -- show diagnostics info for hovered item in a float pane
    ['T'] = "<cmd>lua vim.diagnostic.open_float({scope='line'})<cr>",

    -- open trouble pane with diagnostics and quickfixes
    ['<leader>tt'] = '<cmd>TroubleToggle<cr>',
  },
  insert_mode = {},
  visual_mode = {
    -- quicker indentation
    ['>'] = '<gv',
    ['<'] = '>gv',
  },
  visual_block_mode = {
    -- Move current line up/down
    ['<A-j>'] = ":m '>+1<CR>gv-gv",
    ['<A-k>'] = ":m '<-2<CR>gv-gv",
  },
  command_mode = {},
  terminal_mode = {},
}

-- Markdown files preview options
M.markdown_preview = {
  ip = '127.0.0.1',
  port = 4000,
}

M.copilot = {
  enabled = true,
}

-- UI preferences
M.ui = {
  colorscheme = {
    name = 'tokyonight',
    style = 'neo',
  },
}

-- unused plugins to be disabled for optimizations
M.disabled_built_ins = {
  '2html_plugin',
  'bugreport',
  'compiler',
  'getscript',
  'getscriptPlugin',
  'gzip',
  'logipat',
  'matchit',
  'netrw',
  'netrwFileHandlers',
  'netrwPlugin',
  'netrwSettings',
  'optwin',
  'rplugin',
  'rrhelper',
  'spellfile_plugin',
  'synmenu',
  'tar',
  'tarPlugin',
  'tutor',
  'vimball',
  'vimballPlugin',
  'zip',
  'zipPlugin',
}

-- diagnostics options
M.diagnostics = {
  underline = false,
  virtual_text = false, -- disable inline diagnostics
}

return M
