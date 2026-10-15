# .bash_profile


# Environment first, so non-interactive login shells get it too
# (.bashrc returns early for non-interactive shells).
case ":$PATH:" in *":$HOME/bin:"*) ;; *) PATH="$PATH:$HOME/bin" ;; esac
export PATH

export COLORTERM=truecolor

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
