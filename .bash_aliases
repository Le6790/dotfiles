# Add aliases here.

# alias vim="~/nvim.appimage"

alias v="fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim"

alias tmux="tmux -f ~/.tmux.conf -u"

alias cura="~/.UltiMaker-Cura-5.3.0-linux.AppImage"

alias src="source ~/.bashrc | echo sourced ~/.bashrc"

#alias nvim="~/nvim.appimage"

alias spt="~/.cargo/bin/spt" # spotify in command line

alias finances="cd ~/Documents/finances/"

alias ll="ls -l"

alias disable_screens="xrandr --output DP-4 --off; xrandr --output DP-1 --off"
alias enable_screens="xrandr --output HDMI-0 --primary --mode 1920x1080 --rate 60 --output DP-4 --mode 1920x1080 --rate 60.00 --right-of HDMI-0 --output DP-1 --mode 1920x1080 --rate 60.00 --right-of DP-4"




function obsidian(){
  cd ~/Documents/obsidian_brain/
  nvim
}

function cfp() {
  local path
  path=$(realpath "$1")
  printf "\033]52;c;%s\a" "$(echo -n "$path" | base64 -w 0)"
  echo "Copied $1 to clipboard!"
}
function cwd() {
  printf "\033]52;c;%s\a" "$(echo -n "$PWD" | base64 -w 0)"
  echo "Copied $1 to clipboard!"
}

# Copy file with a progress bar
cpp()
{
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
}

# grep through the bash history for a command
function hst()
{
	history | grep "$1";
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

# edit files on the pi via nvim
function nvim_scp() {
   nvim scp://pi@192.168.0.53/"$1"
}


# Query claude code
?? () {
  claude -p "$*"

}
