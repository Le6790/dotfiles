# ~/.bashrc - interactive bash only. Sourced from ~/.bash_profile.

# Interactive guard: scp/rsync/ssh-command sessions must not run anything below
# (any output here breaks them). PATH for non-interactive shells lives in .bash_profile.
case $- in
    *i*) ;;
    *) return ;;
esac

OS_NAME=$(uname -s)

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Machine/work-specific overrides and secrets. Gitignored; never commit.
if [ -f ~/.bash_work_specific ]; then
    . ~/.bash_work_specific
fi

if [ -f ~/.fzf_commands.sh ]; then
    . ~/.fzf_commands.sh
fi

# Shell option - auto corrects small spelling errors in the cd command
shopt -s cdspell

# Shell option -  Let's you cd into a directory without typing cd
# shopt -s autocd

export CLICOLOR=1

# set timezone (IANA name; the /usr/share/zoneinfo/US/* form is deprecated)
export TZ="America/Denver"

export EDITOR="nvim"

if [[ "$OS_NAME" == "Linux" ]]; then
    # $HOME, not ~: tilde does not expand inside quotes
    export EDITOR="$HOME/nvim.appimage"
    export VISUAL="$HOME/nvim.appimage"
fi

#Automatically enable Tmux on startup
#if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#        tmux -u attach-session -t ssh_tmux || tmux -u new-session -s ssh_tmux
#fi

# Prompt: starship (below) replaces this when installed; this is the fallback.
PS1='\[\e[32m\]<\h> \[\e[m\]\[\033[01;36m\]$PWD\[\033[00m\]
|> '

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000
export HISTTIMEFORMAT="%F %T "

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    # GNU userland (Linux): dircolors generates LS_COLORS
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    # No dircolors (macOS/BSD): fall back to a static LS_COLORS (used by GNU ls from
    # brew coreutils); BSD ls itself honours CLICOLOR/LSCOLORS.
    LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;31:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.flac=01;35:*.mp3=01;35:*.mpc=01;35:*.ogg=01;35:*.wav=01;35:'
    export LS_COLORS
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# fzf file source: prefer rg, then ag
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
elif type ag &> /dev/null; then
    export FZF_DEFAULT_COMMAND='ag -p ~/.gitignore -g ""'
fi

# User dirs are appended, not prepended, so a file dropped there can't shadow
# system binaries (ls, git, ...). If you need an override, put it first on purpose.
case ":$PATH:" in *":$HOME/.local/bin:"*) ;; *) PATH="$PATH:$HOME/.local/bin" ;; esac
case ":$PATH:" in *":$HOME/Applications:"*) ;; *) PATH="$PATH:$HOME/Applications" ;; esac
export PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if command -v starship &> /dev/null; then
    eval "$(starship init bash)"
fi
