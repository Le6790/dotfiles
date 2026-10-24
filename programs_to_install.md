# List of nice programs to install - 

## fastfetch
    macOS:  brew install fastfetch
    Linux:  sudo apt install fastfetch
    A customizeable system info script (replaces neofetch, which is archived)

## htop
    sudo apt install htop
    An interactive process viewer
## npm:
    sudo apt install npm
    Javascript package manager

## starship, fzf, ripgrep, fd
    macOS:  brew install starship fzf ripgrep fd
    Linux:  sudo apt install fzf ripgrep fd-find   (starship: https://starship.rs)
    Prompt and fuzzy-finding used by .bashrc / .zshrc / .fzf_commands.sh

## tmux, neovim
    macOS:  brew install tmux neovim
    Linux:  sudo apt install tmux   (neovim: AppImage at ~/nvim.appimage, see .bashrc)
    Terminal multiplexer and editor; $EDITOR is nvim. nvim config is a separate
    repo in ~/.config/nvim.

## pyenv
    macOS:  brew install pyenv
    Linux:  https://github.com/pyenv/pyenv#installation
    Python version manager. Initialised in .bash_profile and .zshrc; its shims are
    prepended to PATH on purpose so they beat Apple's /usr/bin/python3.

## nvm
    https://github.com/nvm-sh/nvm#installing-and-updating
    Node version manager. Loaded from $HOME/.nvm by .bashrc / .zshrc.
