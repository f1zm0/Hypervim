#!/usr/bin/env bash
set -eo pipefail

declare HV_BRANCH="main" # stable branch
declare -r HV_REMOTE="f1zm0/Hypervim.git"
declare -r INSTALL_PREFIX="$HOME/.local"

declare -r XDG_DATA_HOME="$HOME/.local/share"
declare -r XDG_CACHE_HOME="$HOME/.cache"
declare -r XDG_CONFIG_HOME="$HOME/.config"

declare -r HYPERVIM_RUNTIME_DIR="$XDG_DATA_HOME/Hypervim"
declare -r HYPERVIM_CONFIG_DIR="$XDG_CONFIG_HOME/hvim"
declare -r HYPERVIM_CACHE_DIR="$XDG_CACHE_HOME/hvim"
declare -r HYPERVIM_BASE_DIR="$HYPERVIM_RUNTIME_DIR/hvim"

declare BASEDIR
BASEDIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
BASEDIR="$(dirname -- "$(dirname -- "$BASEDIR")")"
readonly BASEDIR

declare ARGS_LOCAL=0
declare ARGS_OVERWRITE=0
declare ARGS_INSTALL_DEPENDENCIES=1
declare INTERACTIVE_MODE=1

declare -a __hvim_dirs=(
  "$HYPERVIM_CONFIG_DIR"
  "$HYPERVIM_RUNTIME_DIR"
  "$HYPERVIM_CACHE_DIR"
)

function usage() {
  echo "Usage: install.sh [<options>]"
  echo ""
  echo "Options:"
  echo "    -h, --help                    Print this help message"
  echo "    -l, --local                   Install local copy of Hypervim"
  echo "    -y, --yes                     Disable confirmation prompts (answer yes to all questions)"
  echo "    --overwrite                   Overwrite previous Hypervim configuration (a backup is always performed first)"
  echo "    --branch                      Specify a specific branch."
  echo "    --[no]-install-dependencies   Whether to automatically install external dependencies (will prompt by default)"
}

function parse_arguments() {
  while [ "$#" -gt 0 ]; do
    case "$1" in
      -l | --local)
        ARGS_LOCAL=1 ;;
      --overwrite)
        ARGS_OVERWRITE=1 ;;
      -y | --yes)
        INTERACTIVE_MODE=0 ;;
      --install-dependencies)
        ARGS_INSTALL_DEPENDENCIES=1 ;;
      --no-install-dependencies)
        ARGS_INSTALL_DEPENDENCIES=0 ;;
      --branch)
        HV_BRANCH="$2"
        ;;
      -h | --help)
        usage
        exit 0
        ;;
    esac
    shift
  done
}

function msg() {
  local text="$1"
  local div_width="80"
  printf "%${div_width}s\n" ' ' | tr ' ' -
  printf "%s\n" "$text"
}

function confirm() {
  local question="$1"
  while true; do
    msg "$question"
    read -p "[y]es or [n]o (default: no) : " -r answer
    case "$answer" in
      y | Y | yes | YES | Yes | YEs | YeS | yES | yeS | yEs)
        return 0
        ;;
      n | N | no | NO | No | nO | *[[:blank:]]* | "")
        return 1
        ;;
      *)
        msg "Please answer [y]es or [n]o."
        ;;
    esac
  done
}

function main() {
  parse_arguments "$@"

  print_logo

  msg "Detecting platform for managing any additional neovim dependencies"
  detect_platform

  check_system_deps

  backup_old_config

  verify_hvim_dirs

  if [ "$ARGS_LOCAL" -eq 1 ]; then
    link_local_hvim
  elif [ -d "$HYPERVIM_BASE_DIR" ]; then
    validate_hvim_files
  else
    clone_hvim
  fi

  setup_hvim

  msg "Thank you for installing Hypervim."
  echo "You can start it by running: $INSTALL_PREFIX/bin/hvim"
}

function detect_platform() {
  OS="$(uname -s)"
  case "$OS" in
    Linux)
      if [ -f "/etc/arch-release" ] || [ -f "/etc/artix-release" ]; then
        RECOMMEND_INSTALL="sudo pacman -S"
      elif [ -f "/etc/fedora-release" ] || [ -f "/etc/redhat-release" ]; then
        RECOMMEND_INSTALL="sudo dnf install -y"
      elif [ -f "/etc/gentoo-release" ]; then
        RECOMMEND_INSTALL="emerge -tv"
      else # assume debian based
        RECOMMEND_INSTALL="sudo apt install -y"
      fi
      ;;
    FreeBSD)
      RECOMMEND_INSTALL="sudo pkg install -y"
      ;;
    NetBSD)
      RECOMMEND_INSTALL="sudo pkgin install"
      ;;
    OpenBSD)
      RECOMMEND_INSTALL="doas pkg_add"
      ;;
    Darwin)
      RECOMMEND_INSTALL="brew install"
      ;;
    *)
      echo "OS $OS is not currently supported."
      exit 1
      ;;
  esac
}

function print_missing_dep_msg() {
  if [ "$#" -eq 1 ]; then
    echo "[ERROR]: Unable to find dependency [$1]"
    echo "Please install it first and re-run the installer. Try: $RECOMMEND_INSTALL $1"
  else
    local cmds
    cmds=$(for i in "$@"; do echo "$RECOMMEND_INSTALL $i"; done)
    printf "[ERROR]: Unable to find dependencies [%s]" "$@"
    printf "Please install any one of the dependencies and re-run the installer. Try: \n%s\n" "$cmds"
  fi
}

function check_neovim_min_version() {
  local verify_version_cmd='if !has("nvim-0.7") | cquit | else | quit | endif'

  # exit with an error if min_version not found
  if ! nvim --headless -u NONE -c "$verify_version_cmd"; then
    echo "[ERROR]: Hypervim requires at least Neovim v0.7 or higher"
    exit 1
  fi
}

function validate_hvim_files() {
  local verify_version_cmd='if v:errmsg != "" | cquit | else | quit | endif'
  if ! "$INSTALL_PREFIX/bin/hvim" --headless -c "$verify_version_cmd" &>/dev/null; then
    msg "Removing old installation files"
    rm -rf "$HYPERVIM_BASE_DIR"
    clone_hvim
  fi
}

function check_system_deps() {
    local deps_list = ("curl" "git" "node" "npm" "make" "cc" "fzf" "ripgrep")

    for dep in "${deps_list[@]}"; do
        if ! command -v "$dep" &>/dev/null; then
            print_missing_dep_msg "$dep"
            exit 1
        fi
    done
  check_neovim_min_version
}

function verify_hvim_dirs() {
  if [ "$ARGS_OVERWRITE" -eq 1 ]; then
    for dir in "${__hvim_dirs[@]}"; do
      [ -d "$dir" ] && rm -rf "$dir"
    done
  fi

  for dir in "${__hvim_dirs[@]}"; do
    mkdir -p "$dir"
  done
}

function backup_old_config() {
  local src="$HYPERVIM_CONFIG_DIR"
  if [ ! -d "$src" ]; then
    return
  fi
  mkdir -p "$src.old"
  touch "$src/ignore"
  msg "Backing up old $src to $src.old"
  if command -v rsync &>/dev/null; then
    rsync --archive -hh --stats --partial --copy-links --cvs-exclude "$src"/ "$src.old"
  else
    OS="$(uname -s)"
    case "$OS" in
      Linux | *BSD)
        cp -r "$src/"* "$src.old/."
        ;;
      Darwin)
        cp -R "$src/"* "$src.old/."
        ;;
      *)
        echo "OS $OS is not currently supported."
        ;;
    esac
  fi
  msg "Backup operation complete"
}

function clone_hvim() {
  msg "Cloning Hypervim configuration"

  if [[ -d "$XDG_DATA_HOME/Hypervim/hvim" ]]; then
    cp -r "$XDG_DATA_HOME/Hypervim/hvim" "$XDG_DATA_HOME/Hypervim/hvim.back"
  fi

  if [[ -d "$HYPERVIM_BASE_DIR" ]]; then
    if confirm "$HYPERVIM_BASE_DIR already exists. Do you want to remove it by doing another git clone?"; then
      if ! git clone --branch "$HV_BRANCH" "https://github.com/$HV_REMOTE" "$HYPERVIM_BASE_DIR"; then
        echo "Failed to clone repository. Installation failed."
        exit 1
      fi
    fi
  else
    if ! git clone --branch "$HV_BRANCH" "https://github.com/$HV_REMOTE" "$HYPERVIM_BASE_DIR"; then
      echo "Failed to clone repository. Installation failed."
      exit 1
    fi
  fi
}

function link_local_hvim() {
  echo "Linking local Hypervim repo"

  # Detect whether it's a symlink or a folder
  if [ -d "$HYPERVIM_BASE_DIR" ]; then
    echo "Removing old installation files"
    rm -rf "$HYPERVIM_BASE_DIR"
  fi

  echo "   - $BASEDIR -> $HYPERVIM_BASE_DIR"
  ln -s -f "$BASEDIR" "$HYPERVIM_BASE_DIR"
}

function create_executable() {
  local dst="$INSTALL_PREFIX/bin/hvim"

  if [[ -f $dst ]]; then
    rm -rf "$dst"
  fi

cat >dst" << EOF
#!/bin/sh

export HYPERVIM_RUNTIME_DIR="${HYPERVIM_RUNTIME_DIR:-"$XDG_DATA_HOME/hypervim"}"
export HYPERVIM_CONFIG_DIR="${HYPERVIM_CONFIG_DIR:-"$XDG_CONFIG_HOME/hvim"}"
export HYPERVIM_CACHE_DIR="${HYPERVIM_CACHE_DIR:-"$XDG_CACHE_HOME/hvim"}"

exec nvim -u "$HYPERVIM_RUNTIME_DIR/dvim/init.lua" "$@"
EOF

  chmod +x "$dst"
}

function remove_old_cache_files() {
  local packer_cache="$HYPERVIM_CONFIG_DIR/plugin/packer_compiled.lua"
  if [ -e "$packer_cache" ]; then
    msg "Removing old packer cache file"
    rm -f "$packer_cache"
  fi

  if [ -e "$HYPERVIM_CACHE_DIR/luacache" ] || [ -e "$HYPERVIM_CACHE_DIR/hvim_cache" ]; then
    msg "Removing old startup cache file"
    rm -f "$HYPERVIM_CACHE_DIR/{luacache,hvim_cache}"
  fi
}

function setup_hvim() {
  remove_old_cache_files

  msg "Creating Hypervim executable"

  create_executable

  msg "Preparing Packer setup"

  "$INSTALL_PREFIX/bin/hvim" --headless \
    -c 'autocmd User PackerComplete quitall'

  echo "Packer setup complete"
}

function print_logo() {
  cat <<'EOF'
  ⠀⠀⠀⠀⠀⢀⣤⣴⡦⠀⠀⠀⠀⠀⢀⣴⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⣼⣿⣿⠇⠀⠀⠀⠀⢀⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⢀⣿⣿⡿⠀⠀⠀⠀⠀⣼⡿⠀⠀⠀⠀⠀⢀⣀⣠⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣦⠀⠀⠀⠀⠀⠀⣠⠞⠁⠀⠀⠀⠀⠀⠀⠀⢀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⢘⣻⣻⠃⠀⠀⠀⠀⣸⣿⠃⠀⣴⣆⢀⣴⣿⡿⠁⣠⣴⣶⣶⣤⣤⣤⣤⣤⣴⡆⣠⣶⣶⣶⣶⣶⣶⣶⣶⡶⢆⣤⣶⣶⣶⣶⣶⣶⣶⣶⣌⢻⣿⣇⠀⠀⠀⣠⡾⠻⠿⠿⢿⣿⣿⣿⠟⠀⢸⣿⣿⣿⡀⠀⢀⣤⣶⠀⠀⠀
  ⠀⠀⠀⢠⣿⣽⣿⣶⣶⣶⣶⣶⣿⣿⣦⣄⠙⠛⣿⣿⠟⠀⣴⣿⣿⣥⣤⣶⣶⡾⠿⠛⢋⣼⣿⣿⣉⣉⣉⣡⣤⣄⠀⢀⣾⣿⣤⣤⣴⣶⠿⠟⠛⠉⠁⠈⣿⣿⡀⢠⣾⡿⠀⠀⠀⠀⢸⣿⠀⠀⠀⠀⣿⣿⠈⣿⣇⢠⣾⡿⣿⡆⠀⠀
  ⠀⠀⠀⣾⣿⡿⠁⠀⠀⠀⢸⣿⣿⠏⠁⠀⢀⣾⣿⠋⠀⣻⣿⡿⠛⠋⠉⠁⠀⠀⠀⣠⣬⣿⣿⠿⠛⠛⠛⠉⠉⠁⢀⣾⡿⠛⠿⢿⣿⣷⣶⣤⣤⣀⠀⠀⠸⣿⣷⣿⡾⠁⠀⠀⠀⠀⣼⡿⠀⠀⠀⢀⣿⡇⠀⢿⣿⣿⠛⠀⢿⣧⠀⠀
  ⠀⠀⣸⣿⣿⠁⠀⠀⠀⢀⣿⣿⠏⠀⠀⣠⣿⡿⠁⠀⣼⣿⠟⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣻⣥⣰⣶⣶⣾⡿⠿⠁⣼⡿⠁⠀⠀⠀⠀⠈⠉⠙⠛⠁⠀⠀⠀⢿⣿⡟⠁⠀⣠⣤⣤⣤⣿⣧⣤⡄⠀⣸⣿⠀⠀⢸⡿⠏⠀⠀⠸⣿⡀⠀
  ⠀⢀⣿⣿⠃⠀⠀⠀⠀⣸⣿⡟⠀⠀⣴⠟⠋⠀⢀⣾⡿⠋⠀⠀⠀⠀⠀⠀⠀⠘⠻⠿⠿⠛⠛⠋⠉⠁⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠋⠀⠀⠀⠘⠛⠛⠋⠉⠉⠉⠉⠀⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⢿⡇⠀
  ⠀⡼⠉⠀⠀⠀⠀⠀⠀⠈⠛⠁⠀⠞⠃⠀⠀⠠⠊⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⠀
  ⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠃
EOF
}

main "$@"
