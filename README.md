# Welcome to my collection of DOTFILES

Personal config for macOS and Linux / Pop!_OS. Bash is the primary shell on both
(on the Mac the login shell is Homebrew bash, `/opt/homebrew/bin/bash`, and tmux
is pinned to bash). zsh config is kept for when zsh is launched by hand.

## Install

```bash
./install_symlinks.sh
```

Symlinks each file below into `$HOME` (or `~/.config`). Real files already
there are moved to `<name>_backup_<timestamp>` (never overwritten); old
symlinks are replaced. Safe to re-run, works from any directory.

## What's here

| File | Platform | Purpose |
|---|---|---|
| `.bashrc`, `.bash_profile`, `.bash_aliases` | both | Primary shell setup. `.bashrc` returns early for non-interactive shells; PATH for those lives in `.bash_profile`. |
| `.zshrc` | macOS (secondary) | zsh equivalent, used only if zsh is started manually; sources `.bash_aliases` and `.fzf_commands.sh`. |
| `.inputrc` | bash | Case-insensitive completion. Includes `/etc/inputrc` first so system defaults survive. |
| `.fzf_commands.sh` | both | fzf helpers: `fcd`, `fdr`, `cdf`, `fe`. |
| `.tmux.conf`, `.vimrc` | both | tmux / vim config. |
| `.alacritty.yml`, `.wezterm.lua`, `starship.toml` | both | Terminal and prompt. |
| `keyboard_control.sh` | Linux/X11 only | Enable/disable the built-in laptop keyboard via `xinput`. Not linked by the installer. |
| `colors.sh` | both | Prints the 256 terminal colours (for picking tmux colours). Not linked. |
| `epomaker_split65/` | n/a | Keyboard layout JSON for the Epomaker Split65. Not linked. |
| `programs_to_install.md` | n/a | Tools these configs expect. |

## Machine-specific / secret config

`~/.bash_work_specific` and `~/.zsh_work_specific` are sourced if present and
are **gitignored**. Put work hostnames, tokens, and exports there, never in
this repo.

## Decisions and history

See `NOTES_*.md` for the why behind changes, open threads, and gotchas.
