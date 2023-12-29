require('lazy').setup({

  -- Colorschemes
  { 'folke/tokyonight.nvim', priority = 1000 },
  { 'catppuccin/nvim', name = 'catppuccin', event = 'VeryLazy' },
  { 'shaunsingh/moonlight.nvim', priority = 1000, event = 'VeryLazy' },

  -- Syntax highligther
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPre', 'BufNewFile' },
    build = function()
      require('nvim-treesitter.install').update({
        with_sync = true,
      })
    end,
  },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'kyazdani42/nvim-web-devicons',
    },
  },

  -- LSP
  'williamboman/mason.nvim',
  { 'williamboman/mason-lspconfig.nvim', dependencies = 'williamboman/mason.nvim' },
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'hrsh7th/cmp-nvim-lsp' },
  },
  {
    'folke/neodev.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'neovim/nvim-lspconfig' },
  },
  {
    'folke/trouble.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'neovim/nvim-lspconfig' },
  },
  {
    'j-hui/fidget.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
  },

  -- Formatting
  {
    'nvimtools/none-ls.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
  },

  -- Autocompletion and code snippets
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
  },
  {
    'onsails/lspkind.nvim',
    event = 'InsertEnter',
  },
  {
    'ray-x/lsp_signature.nvim',
    event = 'VeryLazy',
  },
  {
    'windwp/nvim-autopairs',
    event = { 'InsertEnter' },
    dependencies = {
      'hrsh7th/nvim-cmp',
    },
  },

  -- UI
  {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    version = 'v4.*',
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
  },
  {
    'rcarriga/nvim-notify',
    event = 'VimEnter',
  },

  {
    'goolord/alpha-nvim',
    event = 'VimEnter',
  },
  {
    'petertriho/nvim-scrollbar',
    event = { 'BufReadPre', 'BufNewFile' },
  },
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
  },
  {
    'declancm/maximize.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
  },

  -- Sessions
  'rmagatti/auto-session',
  {
    'rmagatti/session-lens',
    dependencies = {
      'rmagatti/auto-session',
      'nvim-telescope/telescope.nvim',
    },
  },

  -- File explorer
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  -- Git integration
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
  },
  {
    'NeogitOrg/neogit',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
    },
  },
  {
    'sindrets/diffview.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  -- Comments
  {
    'terrortylor/nvim-comment',
    event = { 'BufReadPre', 'BufNewFile' },
  },
  {
    'folke/todo-comments.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  -- Markdown support
  {
    'iamcco/markdown-preview.nvim',
    build = function()
      fn['mkdp#util#install']()
    end,
    event = 'VeryLazy',
  },
  {
    'mzlogin/vim-markdown-toc',
    event = 'VeryLazy',
  },

  -- Copilot integration
  {
    'zbirenbaum/copilot.lua',
    event = 'InsertEnter',
    config = function()
      vim.defer_fn(function()
        local opts = require('hvim.plugins.copilot').options
        require('copilot').setup(opts)
      end, 100)
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    event = 'InsertEnter',
    dependencies = {
      'copilot.lua',
    },
    config = function()
      require('copilot_cmp').setup()
    end,
  },

  performance = {
    disabled_plugins = {
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
      'tohtml',
      'tutor',
      'vimball',
      'vimballPlugin',
      'zip',
      'zipPlugin',
    },
    checker = {
      enabled = true,
      notify = false,
    },
    change_detection = {
      notify = true,
    },
  },
})
