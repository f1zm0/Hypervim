return require('packer').startup(function(use)
  use('wbthomason/packer.nvim')

  -- Utils
  use('nvim-lua/plenary.nvim')
  use('kyazdani42/nvim-web-devicons')
  use('MunifTanjim/nui.nvim')
  use('windwp/nvim-autopairs')

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

  -- LSP
  use('williamboman/nvim-lsp-installer')
  use('neovim/nvim-lspconfig')
  use('ray-x/lsp_signature.nvim')
  use('onsails/lspkind.nvim')
  use('mhartington/formatter.nvim')
  use('folke/trouble.nvim')
  use('j-hui/fidget.nvim')

  -- Autocompletion
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
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
  use('folke/tokyonight.nvim')
  use({ 'anuvyklack/windows.nvim', requires = {
    'anuvyklack/middleclass',
  } })

  -- Sessions
  use('rmagatti/auto-session')
  use('rmagatti/session-lens')

  -- File explorer
  use('kyazdani42/nvim-tree.lua')

  -- Git integration
  use({ 'lewis6991/gitsigns.nvim', tag = 'release' })
  use({ 'TimUntersberger/neogit' })
  use({ 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' })

  -- Comments
  use('terrortylor/nvim-comment')
  use('folke/todo-comments.nvim')

  -- Markdown support
  use({
    'iamcco/markdown-preview.nvim',
    run = function()
      vim.fn['mkdp#util#install']()
    end,
  })
  use('mzlogin/vim-markdown-toc')
end)
