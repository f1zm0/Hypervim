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
  use({ 'glepnir/galaxyline.nvim', branch = 'main' })
  use('goolord/alpha-nvim')
  use('norcalli/nvim-colorizer.lua')

  -- Sessions
  use('rmagatti/auto-session')
  use('rmagatti/session-lens')

  -- File explorer
  -- use { "nvim-neo-tree/neo-tree.nvim", branch = "v2.x" }
  use('kyazdani42/nvim-tree.lua')

  -- Git status
  use({ 'lewis6991/gitsigns.nvim', tag = 'release' })

  -- Indentation guides
  use('lukas-reineke/indent-blankline.nvim')

  -- Comments
  use('terrortylor/nvim-comment')
  use('folke/todo-comments.nvim')

  -- Colorschemes
  use('folke/tokyonight.nvim')
  use('marko-cerovac/material.nvim')
  use('navarasu/onedark.nvim')
  use('yuttie/hydrangea-vim')

  -- Markdown support
  use({
    'iamcco/markdown-preview.nvim',
    run = function()
      vim.fn['mkdp#util#install']()
    end,
  })
end)
