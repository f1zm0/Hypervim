-- automatically install packer if not installed
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  })
  print('Installing packer...')
  vim.cmd([[packadd packer.nvim]])
end

-- call to packer with guard to avoid errors at first start
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

local opts = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end,
  },
}

packer.init(opts)

packer.startup(function(use)
  use('wbthomason/packer.nvim')

  -- Utils
  use('nvim-lua/plenary.nvim')
  use('kyazdani42/nvim-web-devicons')
  use('MunifTanjim/nui.nvim')
  use('windwp/nvim-autopairs')
  use('rcarriga/nvim-notify')
  use('lewis6991/impatient.nvim')

  -- Syntax highligther
  use({
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({
        with_sync = true,
      })
    end,
  })

  -- Telescope
  use({ 'nvim-telescope/telescope.nvim', tag = '0.1.0' })
  use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })

  -- LSP
  use({
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  })
  use('ray-x/lsp_signature.nvim')
  use('onsails/lspkind.nvim')
  use('folke/trouble.nvim')
  use('j-hui/fidget.nvim')

  -- Formatting
  use('jose-elias-alvarez/null-ls.nvim')

  -- Autocompletion
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-emoji')
  use('hrsh7th/cmp-cmdline')
  use('hrsh7th/nvim-cmp')

  -- Snippets
  use('L3MON4D3/LuaSnip')
  use('saadparwaiz1/cmp_luasnip')
  use('rafamadriz/friendly-snippets')

  -- UI
  use({ 'akinsho/bufferline.nvim', tag = 'v2.*' })
  use({ 'nvim-lualine/lualine.nvim' })
  use('lukas-reineke/indent-blankline.nvim')
  use('goolord/alpha-nvim')
  use('norcalli/nvim-colorizer.lua')
  use({ 'anuvyklack/windows.nvim', requires = {
    'anuvyklack/middleclass',
  } })
  use('petertriho/nvim-scrollbar')
  use('stevearc/aerial.nvim')

  -- Colorschemes
  use('folke/tokyonight.nvim')
  use({ 'nyoom-engineering/oxocarbon.nvim' })
  use({ 'catppuccin/nvim', as = 'catppuccin' })

  -- Sessions
  use('rmagatti/auto-session')
  use('rmagatti/session-lens')

  -- File explorer
  use('kyazdani42/nvim-tree.lua')

  -- Git integration
  use('lewis6991/gitsigns.nvim')
  use({ 'TimUntersberger/neogit' })
  use({ 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' })

  -- Comments
  use('terrortylor/nvim-comment')
  use('folke/todo-comments.nvim')

  -- Markdown support
  use({
    'iamcco/markdown-preview.nvim',
    run = function()
      fn['mkdp#util#install']()
    end,
  })
  use('mzlogin/vim-markdown-toc')

  -- Copilot integration
  use({
    'zbirenbaum/copilot.lua',
    event = 'InsertEnter',
    config = function()
      vim.defer_fn(function()
        local opts = require('hvim.plugins.copilot').options
        require('copilot').setup(opts)
      end, 100)
    end,
  })
  use({
    'zbirenbaum/copilot-cmp',
    after = { 'copilot.lua' },
    config = function()
      require('copilot_cmp').setup()
    end,
  })

  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end)
