# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

## [0.2.2](https://github.com/f1zm0/Hypervim/compare/v0.2.1...v0.2.2) (2023-02-12)


### Bug Fixes

* resolve error after sumneko_lua moved to lua_ls ([7b629ed](https://github.com/f1zm0/Hypervim/commit/7b629eda5b96037dbb8201b060de9a24799b703f))

## [0.2.1](https://github.com/f1zm0/Hypervim/compare/v0.2.0...v0.2.1) (2023-02-01)


### Misc

* improve docs and defaults ([#8](https://github.com/f1zm0/Hypervim/issues/8)) ([266a526](https://github.com/f1zm0/Hypervim/commit/266a5264a6609b148b0d9b0cb91641eec42e9ed8))

## [0.2.0](https://github.com/f1zm0/Hypervim/compare/v0.1.0...v0.2.0) (2023-01-29)


### Features

* remove tab key conflicts between cmp and copilot ([8ceee58](https://github.com/f1zm0/Hypervim/commit/8ceee58844a179b36cef15564e1fea6c558982bd))


### Continuous Integration

* add release workflow ([a289fc6](https://github.com/f1zm0/Hypervim/commit/a289fc666456af5470ee0f48ab856efcc9128ffa))

## 0.1.0 (2023-01-19)


### Features

* add autoinstall plugin function for packer ([b9d7e92](https://github.com/f1zm0/Hypervim/commit/b9d7e925590bcae5ce3eca24fbe117532d5bf4e4))
* add base dir setup for modules ([56442f6](https://github.com/f1zm0/Hypervim/commit/56442f6dbc4fd6cc95edf9f0dfe59107f518f2ef))
* add dual mode for copilot (default and cmp) ([eaf1b4d](https://github.com/f1zm0/Hypervim/commit/eaf1b4dafd527f1e562219e3c15f8e3d7ac030f8))
* add exec wrapper func with plenary ([66b1459](https://github.com/f1zm0/Hypervim/commit/66b1459cb1312342584a61183338b5082fb46552))
* add icons for git and diff ([25cd90e](https://github.com/f1zm0/Hypervim/commit/25cd90e320e76c6450a7521eddcbf7909b0c99ff))
* add installer script ([d7271a9](https://github.com/f1zm0/Hypervim/commit/d7271a94cc1ff81e24d52bf6f673e992feae90ff))
* add node version check to setup script ([55c7e4a](https://github.com/f1zm0/Hypervim/commit/55c7e4a4527e5f12255ec1941bc9be4c01a513c8))
* add util functions ([935d1e5](https://github.com/f1zm0/Hypervim/commit/935d1e55939b2548e7a2d45c9e710aab40916141))
* added fzf-native extension to telescope and updated requirements ([87a349d](https://github.com/f1zm0/Hypervim/commit/87a349daca8258cac8e44f75ede2d7d98c0e5259))
* added html and css ftplugin conf ([43165c0](https://github.com/f1zm0/Hypervim/commit/43165c011241181df74f03b220655a41175b341d))
* added impatient ([51b137d](https://github.com/f1zm0/Hypervim/commit/51b137d4904f9456dd45d953dfc675f0710d8de4))
* added keybindings for both core and plugins ([8e0a6e9](https://github.com/f1zm0/Hypervim/commit/8e0a6e918a2db93d7ac5700ba9c45b1a10104047))
* added keymap for telescope notify integration ([0067ec6](https://github.com/f1zm0/Hypervim/commit/0067ec679b599382f5d65499c7b500bf09dd5c10))
* added neogit and diffview to git integration plugins ([99c5b42](https://github.com/f1zm0/Hypervim/commit/99c5b423b783b1f89785f72ae528a1bf8ec864bf))
* added notify for toast notifications ([018599f](https://github.com/f1zm0/Hypervim/commit/018599f082b5f5ae3871962bec8def344ce3b755))
* added nvim-scrollbar ([7565613](https://github.com/f1zm0/Hypervim/commit/7565613114dc87163cb1deb3b8a4d0a887ca7b34))
* added oxocarbon and catppuccin colorschemes ([cbde38e](https://github.com/f1zm0/Hypervim/commit/cbde38e6de2f38720c8a96c07c6841296b5fc558))
* added prettier as html formatter ([02d46b7](https://github.com/f1zm0/Hypervim/commit/02d46b7b11555e8be398eb5cc7ee5bb23b67eb41))
* added support for clangd-format ([ccb2d24](https://github.com/f1zm0/Hypervim/commit/ccb2d240e4a3c05754b962e0681f6513b35d76ba))
* added support for colorschemes with styles ([63d5ad3](https://github.com/f1zm0/Hypervim/commit/63d5ad377c6a83ea30163811dfa29fe8daba8075))
* added windows package to maximize windows ([40727a1](https://github.com/f1zm0/Hypervim/commit/40727a16610d86a2590e2ff95c99040d72aa9f1f))
* **autosessions:** added hooks close/re-open nvimtree ([3808985](https://github.com/f1zm0/Hypervim/commit/38089859595b47afd01bc37c8f79c29192f8cdd5))
* integrated copilot and added it as cmp source ([6f1d7c4](https://github.com/f1zm0/Hypervim/commit/6f1d7c45db6feacf213d7918b2e23589640f0e8a))
* **lsp:** added cssl to lsp servers ([a74b63b](https://github.com/f1zm0/Hypervim/commit/a74b63b57a332e5f611034ab166ccbaeaa2caf3e))
* **lsp:** added ltex server for markdown and txt files ([fdfcbea](https://github.com/f1zm0/Hypervim/commit/fdfcbea54646607d42aa8e9a51043bd67dd02de7))
* **lsp:** added tsserver as ts/js files lang server ([5207038](https://github.com/f1zm0/Hypervim/commit/5207038bf3a21c573a52d94138c4bf4fbf1710b3))
* **lsp:** improved cmp suggestions ([935ba3a](https://github.com/f1zm0/Hypervim/commit/935ba3a28d214d98f6baa04ff6567f2805499402))
* **scrollbar:** added custom options for scrollbar ([cd26ad1](https://github.com/f1zm0/Hypervim/commit/cd26ad1be32f38221ed0e4d56a9dbb9083f8a0bb))
* **treesitter:** disabled highlight for big files and en ([5e4a1e5](https://github.com/f1zm0/Hypervim/commit/5e4a1e5b4a3f97d9de82ef75566cddcfd057ea3e))


### Bug Fixes

* add DiagnosticsSign icons lost with refactor ([4844a49](https://github.com/f1zm0/Hypervim/commit/4844a492e14d483331effcea4ddbe35ce9143d36))
* add guard to impatient setup in init file ([c52427c](https://github.com/f1zm0/Hypervim/commit/c52427c8d51bf62e0c5b6b7ff4a1270506b03b29))
* add missing termguicolors option ([ea6e62e](https://github.com/f1zm0/Hypervim/commit/ea6e62ec9cfc0c5f72f21973fb4e94e0425acf9f))
* added missing import for mason-config plugin ([1a952ac](https://github.com/f1zm0/Hypervim/commit/1a952acfc9fc39853f7fcc7b0c3cc1e5c64fcee7))
* args checks in launcher template ([9cda9f6](https://github.com/f1zm0/Hypervim/commit/9cda9f6d51dcfe0066c2c9000600934615b37cf6))
* changed on_attach keymappings to minimize conflicts with other mappings ([0776ff7](https://github.com/f1zm0/Hypervim/commit/0776ff70220f857675697b404f0e48a369c77e3f))
* correct command in windows maximize mapping ([b6ef3d8](https://github.com/f1zm0/Hypervim/commit/b6ef3d82ebe7d0210041ad0df62d0eaf38b5cc38))
* disable ts indentation for py and yaml ([366f856](https://github.com/f1zm0/Hypervim/commit/366f856a0254d7d5fc224961d0574fa37ee77676))
* fixed gitsigns plugin import for nvim 0.8.x ([86a4e94](https://github.com/f1zm0/Hypervim/commit/86a4e945eeab5ad7163020dfec4618e163e9ac2e))
* fixed typo in indent-blankline config to exclude nvimtree windows ([cb511f8](https://github.com/f1zm0/Hypervim/commit/cb511f833522771a803268ed72f606d091aef5da))
* increase sessions pane height ([c85c7e6](https://github.com/f1zm0/Hypervim/commit/c85c7e6a119caf9d562877809c5a1d327ebb31de))
* inverted keymap for block indentation ([de2c5d6](https://github.com/f1zm0/Hypervim/commit/de2c5d60c1a7dea4d7da5a146dd92caf9e097af4))
* **plugins:** fixed pcalls for blankline and lspkind ([c023819](https://github.com/f1zm0/Hypervim/commit/c023819b5f095070c324dcb593ad8d8b66fbc9ed))
* remove duplicate call left in util function ([945e7f1](https://github.com/f1zm0/Hypervim/commit/945e7f1df640de09a2acfaab3b9646b0f41cd252))
* remove mapping and imports that could error ([684e909](https://github.com/f1zm0/Hypervim/commit/684e909cb6e736fb51d11670a45f9f7e2c0d6939))
* removed optimization import from entrypoint file ([04eacdf](https://github.com/f1zm0/Hypervim/commit/04eacdfad92302324ed401e79c00a3573f2aaf13))
* removed unused var in hvim init ([1207aef](https://github.com/f1zm0/Hypervim/commit/1207aef98525f5606a9d59b5223e5f08c352e5a5))
* replaced deprecated lsp function with updated one ([515f43f](https://github.com/f1zm0/Hypervim/commit/515f43f8ba3bb3a76bba32643aa6b1cf29a0296f))
* return types and errors check in util functions ([a8d3f9f](https://github.com/f1zm0/Hypervim/commit/a8d3f9f9218a464edfdf35719d971acadd4a43b0))
* **telescope:** added missing node_modules dir in exclude paths ([6ddf5e3](https://github.com/f1zm0/Hypervim/commit/6ddf5e3110aeb08ee991ad95de5cd4c21aed81d7))
* updated tokyonight config structure and custom colors ([fa751a7](https://github.com/f1zm0/Hypervim/commit/fa751a755c7919bf3932b338bbf4bf9bc1551cf8))
