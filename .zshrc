# ~/.zshrc - macOS default shell. Shares aliases/functions with bash.
# Case-insensitive completion is zsh-native, unlike bash's .inputrc.

[[ -o interactive ]] || return

export CLICOLOR=1
export TZ="America/Denver"
export EDITOR="nvim"

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=20000
setopt HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE INC_APPEND_HISTORY EXTENDED_HISTORY

# Completion, case-insensitive
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Shared with bash. Machine/work file is gitignored.
[ -f ~/.bash_aliases ]       && source ~/.bash_aliases
[ -f ~/.zsh_work_specific ]  && source ~/.zsh_work_specific
[ -f ~/.fzf_commands.sh ]    && source ~/.fzf_commands.sh
[ -f ~/.fzf.zsh ]            && source ~/.fzf.zsh

if command -v rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
fi

# Append (not prepend) user dirs so they can't shadow system binaries
typeset -U path
path+=("$HOME/.local/bin" "$HOME/Applications")

# Exception to the append rule: pyenv shims must beat Apple's /usr/bin/python3.
# Shims only contain pyenv-managed Python executables, so nothing else is shadowed.
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv &> /dev/null && eval "$(pyenv init - zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

command -v starship &> /dev/null && eval "$(starship init zsh)"
