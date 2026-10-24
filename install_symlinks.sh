#!/usr/bin/env bash
# Symlink dotfiles from this repo into $HOME.
# Existing real files are moved to <name>_backup_<timestamp> (never overwritten);
# existing symlinks are replaced. Safe to re-run.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STAMP="$(date +%Y%m%d%H%M%S)"

# "<source in repo>:<destination>"
LINKS=(
  ".bashrc:$HOME/.bashrc"
  ".bash_profile:$HOME/.bash_profile"
  ".bash_aliases:$HOME/.bash_aliases"
  ".zshrc:$HOME/.zshrc"
  ".inputrc:$HOME/.inputrc"
  ".tmux.conf:$HOME/.tmux.conf"
  ".vimrc:$HOME/.vimrc"
  ".fzf_commands.sh:$HOME/.fzf_commands.sh"
  ".wezterm.lua:$HOME/.wezterm.lua"
  "starship.toml:$HOME/.config/starship.toml"
)

link() {
  local src="$REPO/$1" dest="$2"
  if [ ! -e "$src" ]; then
    echo "skip: $src does not exist" >&2
    return
  fi
  mkdir -p "$(dirname "$dest")"
  if [ -L "$dest" ]; then
    rm "$dest"                       # old symlink: safe to replace
  elif [ -e "$dest" ]; then
    mv "$dest" "${dest}_backup_${STAMP}"
    echo "backed up $dest -> ${dest}_backup_${STAMP}"
  fi
  ln -s "$src" "$dest"
  echo "linked $dest -> $src"
}

for entry in "${LINKS[@]}"; do
  link "${entry%%:*}" "${entry#*:}"
done
