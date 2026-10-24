# Add aliases here. Sourced by .bashrc (and .zshrc); keep it bash/zsh compatible.

# alias vim="~/nvim.appimage"

alias v="fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim"

alias tmux="tmux -f ~/.tmux.conf -u"

alias cura="~/.UltiMaker-Cura-5.3.0-linux.AppImage"

# `source` must run in the current shell; piping it into echo ran it in a subshell.
# zsh reads .zshrc, not .bashrc.
if [ -n "$ZSH_VERSION" ]; then
  alias src='source ~/.zshrc && echo sourced ~/.zshrc'
else
  alias src='source ~/.bashrc && echo sourced ~/.bashrc'
fi

#alias nvim="~/nvim.appimage"

alias spt="~/.cargo/bin/spt" # spotify in command line

alias finances="cd ~/Documents/finances/"

alias ll="ls -l"

alias disable_screens="xrandr --output DP-4 --off; xrandr --output DP-1 --off"
alias enable_screens="xrandr --output HDMI-0 --primary --mode 1920x1080 --rate 60 --output DP-4 --mode 1920x1080 --rate 60.00 --right-of HDMI-0 --output DP-1 --mode 1920x1080 --rate 60.00 --right-of DP-4"

# base64 without line wrapping: GNU needs -w 0, BSD/macOS never wraps and has no -w.
_b64() {
  if base64 -w 0 </dev/null >/dev/null 2>&1; then
    base64 -w 0
  else
    base64 | tr -d '\n'
  fi
}

function obsidian(){
  cd ~/Documents/obsidian_brain/ || return
  nvim
}

# Copy a file's absolute path to the clipboard via OSC 52 (needs terminal support;
# inside tmux also needs `set -g set-clipboard on`, see .tmux.conf).
function cfp() {
  local fpath
  fpath=$(realpath "$1") || return
  printf "\033]52;c;%s\a" "$(printf %s "$fpath" | _b64)"
  echo "Copied $fpath to clipboard!"
}
# Copy the current directory to the clipboard.
function cwd() {
  printf "\033]52;c;%s\a" "$(printf %s "$PWD" | _b64)"
  echo "Copied $PWD to clipboard!"
}

# Copy file with a progress bar (Linux only: needs strace + GNU stat).
# Runs in a subshell so nothing leaks into the interactive shell.
cpp()
(
	set -e
	strace -q -ewrite cp -- "${1}" "${2}" 2>&1 \
	| awk '{
	count += $NF
	if (count % 10 == 0) {
		percent = count / total_size * 100
		printf "%3d%% [", percent
		for (i=0;i<=percent;i++)
			printf "="
			printf ">"
			for (i=percent;i<100;i++)
				printf " "
				printf "]\r"
			}
		}
	END { print "" }' total_size="$(stat -c '%s' "${1}")" count=0
)

# grep through the shell history for a command
# (zsh's bare `history` prints only the last 16 entries; `history 1` prints all)
function hst()
{
	if [ -n "$ZSH_VERSION" ]; then
		history 1 | grep "$1"
	else
		history | grep "$1"
	fi
}

# change directory and list the contents
function cdl()
{
	cd "$@" && ls -al;
}

# Attach to a tmux session
function tmuxattach(){
    tmux attach-session -t "$1"
}

# Create a new tmux session
function tmuxnew() {
    tmux new -s "$1"
}



# Query claude code with `?? your question`.
# `??` is glob-like: bash accepts it as a function name, zsh does not, so zsh
# gets an alias instead (aliases expand before globbing). Quote prompts that
# contain ? or * in zsh. The bash definition is eval'd so zsh never parses it.
if [ -n "$ZSH_VERSION" ]; then
  alias '??'='claude -p'
else
  eval '?? () { claude -p "$*"; }'
fi
