require('lazy').setup({
   spec = {
      { import = 'hvim.plugins' },
      { import = 'hvim.plugins.lsp' },
   },
   defaults = {
      -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
      -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
      lazy = false,
      -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
      -- have outdated releases, which may break your Neovim install.
      version = false, -- always use the latest git commit
      -- version = "*", -- try installing the latest stable version for plugins that support semver
   },
   checker = {
      enabled = true,
      notify = false,
   },
   change_detection = {
      notify = true,
   },
   performance = {
      rtp = {
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
      },
   },
})
