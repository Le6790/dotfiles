# .bash_profile


# Environment first, so non-interactive login shells get it too
# (.bashrc returns early for non-interactive shells).
case ":$PATH:" in *":$HOME/bin:"*) ;; *) PATH="$PATH:$HOME/bin" ;; esac
export PATH

# pyenv shims are prepended on purpose: they must beat Apple's /usr/bin/python3.
# Shims only contain pyenv-managed Python executables, so nothing else is shadowed.
export PYENV_ROOT="$HOME/.pyenv"
[ -d "$PYENV_ROOT/bin" ] && PATH="$PYENV_ROOT/bin:$PATH"
command -v pyenv &> /dev/null && eval "$(pyenv init - bash)"

export COLORTERM=truecolor

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
