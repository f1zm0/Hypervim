local M = {}

M.core = {
  globals = {
    mapleader = ',',
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
    hidden = true, -- buffers
    cursorline = true, -- file navigation
    expandtab = true,
    smartindent = true,
    shiftwidth = 4,
    tabstop = 4,
    clipboard = 'unnamedplus',
    pumblend = 5, -- popup bg transparency
    updatetime = 300,
  },
  keymaps = {
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
      ['<'] = '<gv',
      ['>'] = '>gv',
    },
    visual_block_mode = {
      -- Move current line up/down
      ['<A-j>'] = ":m '>+1<CR>gv-gv",
      ['<A-k>'] = ":m '<-2<CR>gv-gv",
    },
    command_mode = {},
    terminal_mode = {},
  },
}

M.lsp = {
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
  ensure_installed = {
    'bash',
    'css',
    'dockerfile',
    'go',
    'graphql',
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
  },
}

M.cmp = {}

M.sessions = {
  options = {
    -- TODO: customize autosave and stuff
  },
  keymaps = {
    normal_mode = {
      ['<c-s>'] = '<cmd>SessionSave<cr>',
      ['<leader>fs'] = '<cmd>SearchSession<cr>',
    },
  },
}

M.plugins = {
  aerial = {},
  alpha = {},
  ['nvim-autopairs'] = {},
  bufferline = {
    keymaps = {
      normal_mode = {
        ['<Tab>'] = '<cmd>BufferLineCycleNext<cr>',
        ['<S-Tab>'] = '<cmd>BufferLineCyclePrev<cr>',
      },
    },
  },
  colorizer = {},
  gitsigns = {},
  fidget = {},
  indent_blankline = {},
  lsp_signature = {},
  lualine = {},
  mason = {},
  ['mason-lspconfig'] = {},
  neogit = {},
  ['null-ls'] = {},
  ['nvim-tree'] = {
    keymaps = {
      normal_mode = {
        ['<leader>e'] = '<cmd>NvimTreeToggle<cr>',
      },
    },
  },
  nvim_comment = {},
  scrollbar = {},
  telescope = {
    keymaps = {
      normal_mode = {
        ['<leader>ff'] = '<cmd>Telescope find_files<cr>',
        ['<leader>fg'] = '<cmd>Telescope live_grep<cr>',
        ['<leader>fb'] = '<cmd>Telescope buffers<cr>',
        ['<leader>fh'] = '<cmd>Telescope help_tags<cr>',
        ['<leader>fr'] = '<cmd>Telescope oldfiles<cr>',
        ['<leader>fn'] = '<cmd>Telescope notify<cr>',
      },
    },
    extensions = {
      'fzf',
      'notify',
    },
  },
  ['todo-comments'] = {
    keymaps = {
      normal_mode = {
        ['<leader>ft'] = '<cmd>TodoTelescope<cr>',
      },
    },
  },
  trouble = {
    keymaps = {
      normal_mode = {
        ['<leader>tt'] = '<cmd>TroubleToggle<cr>',
        ['<leader>tw'] = '<cmd>Trouble workspace_diagnostics<cr>',
        ['<leader>td'] = '<cmd>Trouble document_diagnostics<cr>',
        ['<leader>tq'] = '<cmd>Trouble quickfix<cr>',
      },
    },
  },
  windows = {
    keymaps = {
      normal_mode = {
        ['<leader>z'] = '<cmd>WindowsMaximize<cr>',
      },
    },
  },
}

M.startup_tasks = {
  -- check if there is a new Hypervim release
  check_hvim_updates = false,
  -- run :PackerSync to update plugins (not recommended)
  sync_plugins = false,
}

-- Markdown files preview options
M.markdown_preview = {
  ip = '127.0.0.1',
  port = 4000,
}

M.copilot = {
  enabled = true,
  mode = 'default', -- or 'cmp', to use copilot as cmp source
  auto_trigger = true,
  inline_suggestions_keymaps = {
    accept = false, -- use <Tab> (defined in cmp keymaps)
    accept_word = false,
    accept_line = false,
    next = '<M-]>',
    prev = '<M-[>',
    dismiss = '<C-]>',
  },
  panel_suggestions_keymaps = {
    jump_prev = '[[',
    jump_next = ']]',
    accept = '<CR>',
    refresh = 'gr',
    open = '<C-CR>',
  },
  filetypes = {
    yaml = true,
    markdown = true,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ['.'] = false,
  },
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
