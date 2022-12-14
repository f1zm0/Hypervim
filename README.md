<h1 align="center">Hypervim</h1>

<p align="center">
  <a href="https://github.com/neovim/neovim/releases">
    <img alt="Neovim Minimum Version" src="https://img.shields.io/badge/Neovim-0.7.0+-blueviolet.svg?style=for-the-badge&labelColor=282a36&logo=Neovim&logoColor=white)](https://github.com/neovim/neovim">
</a>
  <a href="https://github.com/f1zm0/Hypervim/commits/master">
    <img src="https://img.shields.io/github/last-commit/f1zm0/Hypervim.svg?style=for-the-badge&labelColor=a33628"/>
  </a>
<a href="https://github.com/f1zm0/Hypervim/LICENSE">
    <img src="https://img.shields.io/github/license/f1zm0/Hypervim?style=for-the-badge&labelColor=282a36" alt="project license">
</a>
<a href="#"> <img src="https://img.shields.io/badge/Status-Alpha-informational?style=for-the-badge" alt="project status"> </a>
</p>

<p align="center">
  Hypervim is a modular configuration written in Lua that extends Neovim into a modern code editor with IDE-like features while maintaining its speed and efficiency.
</p>

<p align="center">
  <a href="#features">Features</a> •
  <a href="#installation">Installation</a> •
  <a href="#keymaps">Keymaps</a>
</p>

## Showcase

## Motivation

## Features

- 💡 Linting, Completion and formatting with [native LSP](https://neovim.io/doc/user/lsp.html) and [CMP](https://github.com/hrsh7th/nvim-cmp) and [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim)
- 🩺 Diagnostics and quickfixes with [Trouble](https://github.com/folke/trouble.nvim)
- 🔀 Git integration with [gitsigns](https://github.com/lewis6991/gitsigns.nvim), [diffview](https://github.com/indrets/diffview.nvim) and [Neogit](https://github.com/TimUntersberger/neogit)
- ⚙️ Pain-free LSP, DAG and formatting tool management with [Mason](https://github.com/williamboman/mason.nvim)
- ✂️ Code snippets powered by [LuaSnip](https://github.com/sirverL3MON4D3/LuaSnip)
- 📁 Simple file browsing with [NvimTree](https://github.com/nvim-tree/nvim-tree.lua)
- 🪟 Session management with [auto-sessions](https://github.com/rmagatti/auto-session) and [session-lens](https://github.com/rmagatti/session-lens)
- 📖 Real-time preview of MD files with [MarkdownPreview](#)
- 👁️ Informative statusline and tabline with [lualine](https://github.com/nvim-lualine/nvim-lualine) and [bufferline](https://github.com/akinsho/bufferline.nvim)
- 🤖 Copilot support

## Requirements

The following tools are required:

- `nvim` (v0.7.0+)
- `node` and `npm` (< v18.x.x if you use copilot)
- `curl`
- `ripgrep`
- `gcc` or `clang`
- `make`

## Installation

```sh
# optional if you don't need to backup current config
mv ~/.config/nvim{,.bak}

# clone Hypervim config into default config path
git clone https://github.com/f1zm0/Hypervim ~/.config/nvim
```

The first time you open Neovim, Packer will automatically install and compile all the plugins, as well as several code parsers for Treesitter. This might take a while.

> IMPORTANT NOTE: Hypervim is alpha software. I'll do my best to keep the main branch as stable as possible and the documentation up-to-date, but this may not always be guaranteed at this stage.

## Keymaps

Below are some of the most important keymaps, for a full list see [keymaps.lua](#)

<details><summary><code>Basic Keymaps</code> 🗺️</summary>
<p>

| Function                  | Keymap       |
| ------------------------- | ------------ |
| Leader Key                | `,`          |
| Close everything and exit | `<leader>q`  |
| Sync packages             | `<leader>ps` |
| Delete buffer             | `<leader>d`  |
| Close window              | `<leader>c`  |
| Expand window             | `<leader>z`  |

</p>
</details>

<details><summary><code>Navigation</code> 🧭</summary>
<p>

| Function                  | Keymap      |
| ------------------------- | ----------- |
| Navigate to left window   | `Ctrl+h`    |
| Navigate to right window  | `Ctrl+l`    |
| Navigate to top window    | `Ctrl+k`    |
| Navigate to bottom window | `Ctrl+j`    |
| Horizontal split          | `\`         |
| Vertical split            | `\|`        |
| Next buffer               | `Tab`       |
| Previous buffer           | `Shift+Tab` |

</p>
</details>

<details><summary><code>Telescope </code> 🔭 </summary>
<p>

| Function                | Keymap          |
| ----------------------- | --------------- |
| Find files (fzf syntax) | `<Leader>ff`    |
| Find buffers            | `<Leader>fb`    |
| Find notifications      | `<Leader>fn`    |
| Find with ripgrep       | `<Leader>fg`    |
| Next result             | `Ctrl+n` or `↓` |
| Previous result         | `Ctrl+p` or `↑` |

</p>
</details>

<details><summary><code>Completion</code> ✨</summary>
<p>

| Function            | Keymap          |
| ------------------- | --------------- |
| Next suggestion     | `Ctrl+n` or `↓` |
| Previous suggestion | `Ctrl+p` or `↑` |
| Accept suggestion   | `Enter`         |

</p>
</details>

<details><summary><code>LSP</code> ⚙️</summary>
<p>

| Function                     | Keymap       |
| ---------------------------- | ------------ |
| Go to definition             | `gd`         |
| Go to declaration            | `gD`         |
| Show references              | `gr`         |
| Show errors and warnings     | `<leader>T`  |
| Rename hovered item          | `<leader>rn` |
| Show info about hovered item | `K`          |

</p>
</details>

<details><summary><code>Markdown </code> 📜</summary>
<p>

| Function         | Keymap       |
| ---------------- | ------------ |
| :MarkdownPreview | `<Leader>mp` |
| :GenTOCGFM       | `<Leader>mt` |

</p>
</details>

## Credits

Big shout-out to the Neovim community and to the creators of the following projects that have inspired this configuration:

- [LunarVim by Chris Chiarulli](https://github.com/LunarVim/LunarVim)
- [Nyoom.nvim](https://github.com/nyoom-engineering/nyoom.nvim)
- All [plugins](lua/hvim/packer.lua#35) and their authors

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
