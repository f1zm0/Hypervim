<h1 align="center">Hypervim</h1>

<p align="center">
  <a href="https://github.com/neovim/neovim/releases">
    <img alt="Neovim Minimum Version" src="https://img.shields.io/badge/Neovim-0.7.0+-blueviolet.svg?style=flat-square&labelColor=282a36&logo=Neovim&logoColor=white)](https://github.com/neovim/neovim">
</a>
<a href="https://github.com/f1zm0/Hypervim/actions?query=workflow%3ACI+branch%3Amain+event%3Apush"> <img src="https://github.com/f1zm0/Hypervim/actions/workflows/ci.yml/badge.svg" alt="GitHub CI" style="max-width: 100%;">
</a>
<a href="https://github.com/f1zm0/Hypervim/LICENSE">
    <img src="https://img.shields.io/github/license/f1zm0/Hypervim?style=flat-square&labelColor=282a36" alt="project license">
</a>
</p>

<p align="center">
  Hypervim is a configuration written in Lua that extends Neovim into a modern code editor with IDE-like features while maintaining its speed and efficiency.
</p>

## Installation

```bash
mv $HOME/.config/nvim{,.bak} && \
git clone https://github.com/f1zm0/Hypervim $HOME/.config/nvim
```

### Requirements

- `nvim` (v0.7+)
- `node` and `npm` (version < 18 if you need to enable copilot)
- `curl`
- `ripgrep`
- `gcc` (or `clang`)
- `make`
