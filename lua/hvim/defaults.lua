local M = {}

M.core = {
   globals = {
      mapleader = ' ',
      noswapfile = true,
      nobackup = true,
      nowritebackup = true,
      nowb = true,
   },
   options = {
      termguicolors = true,
      ignorecase = false,
      hlsearch = true,
      ruler = false,
      number = true,
      relativenumber = true,
      showmatch = true,
      hidden = true,     -- buffers
      cursorline = true, -- file navigation
      expandtab = true,
      smartindent = true,
      shiftwidth = 4,
      tabstop = 4,
      pumblend = 5, -- popup bg transparency
      updatetime = 300,
      list = true,
      listchars = 'tab:▸ ,space:·,trail:·,extends:›,precedes:‹,eol:↲,nbsp:␣',
      smoothscroll = true,
      foldexpr = "v:lua.require'hvim.ui.folds'.foldexpr()",
      foldmethod = 'expr',
      foldtext = '',
      foldlevel = 99,
   },
   keymaps = {
      normal_mode = {
         -- quicker exit
         ['Q'] = '<cmd>qall<cr>',   -- quick quit (no save)
         ['<C-s>'] = '<esc>:w<cr>', -- escape and save

         -- buffer navigation and management
         ['<Tab>'] = '<cmd>bnext<cr>',
         ['<S-Tab>'] = '<cmd>bprev<cr>',
         ['<leader>dd'] = '<cmd>bp | bd #<cr>',
         ['<leader>cc'] = '<C-w>c',

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

         -- faster splits (and go to next buffer)
         ['\\'] = '<cmd>bnext | split | bprev<cr>',
         ['|'] = '<cmd>bnext | vsplit | bprev<cr>',

         -- scroll up/down without loosing track of cursor
         ['<c-u>'] = '<c-u>zz',
         ['<c-d>'] = '<c-d>zz',

         -- Move current line up/down
         ['<A-j>'] = ":m '>+1<CR>gv-gv",
         ['<A-k>'] = ":m '<-2<CR>gv-gv",

         -- show diagnostics info for hovered item in a float pane
         ['<c-t>'] = "<cmd>lua vim.diagnostic.open_float({scope='line'})<cr>",
      },
      insert_mode = {
         ['<C-s>'] = '<esc>:w<cr>', -- escape and save
      },
      visual_mode = {
         -- quicker indentation
         ['<'] = '<gv',
         ['>'] = '>gv',

         -- copy from system clipboard
         ['<leader>y'] = '"+y',
      },
      visual_block_mode = {
         -- Move current line up/down
         ['<A-j>'] = ":m '>+1<CR>gv-gv",
         ['<A-k>'] = ":m '<-2<CR>gv-gv",

         -- scroll up/down without loosing track of cursor
         ['<c-u>'] = '<c-u>zz',
         ['<c-d>'] = '<c-d>zz',

         -- copy from system clipboard
         ['<leader>y'] = '"+y',
      },
      command_mode = {},
      terminal_mode = {},
   },
}

M.lang_servers = {
   bashls = {},
   clangd = {},
   -- cssls = {},
   -- eslint = {},
   -- golangci_lint_ls = {},
   gopls = {},
   revive = {},
   -- jsonls = {},
   lua_ls = {},
   pyright = {},
   rust_analyzer = {},
   ts_ls = {},
   yamlls = {},
}

-- additional tools required for lang support
M.lang_tools = {
   'gofumpt',
   'goimports',
}

M.lang_parsers = {
   'bash',
   'css',
   'dockerfile',
   'go',
   'gomod',
   'gowork',
   'gosum',
   'html',
   'javascript',
   'json',
   'lua',
   'python',
   'regex',
   'rust',
   'toml',
   'typescript',
   'yaml',
}

M.cmp = {}

M.startup_tasks = {
   -- check if there is a new Hypervim release
   check_hvim_updates = false,
}

M.sessions = {
   save_on_exit = false,
}

-- UI preferences
M.ui = {
   colorscheme = {
      name = 'tokyonight',
      style = 'storm',
   },
}

-- diagnostics options
M.diagnostics = {
   underline = false,   -- code underline
   virtual_text = true, -- inline diagnostics
   signs = false,       -- diagnostics symbols in gutter line
}

return M
