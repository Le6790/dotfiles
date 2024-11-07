# Add aliases here.

# alias vim="~/nvim.appimage"

alias v="fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim"

alias tmux="tmux -f ~/.tmux.conf -u"

alias cura="~/.UltiMaker-Cura-5.3.0-linux.AppImage"

alias src="source ~/.bashrc | echo sourced ~/.bashrc"

alias nvim="~/nvim.appimage"

alias spt="~/.cargo/bin/spt"

alias finances="cd ~/Documents/finances/"

alias disable_screens="xrandr --output DP-4 --off; xrandr --output DP-1 --off"
alias enable_screens="xrandr --output HDMI-0 --primary --mode 1920x1080 --rate 60 --output DP-4 --mode 1920x1080 --rate 60.00 --right-of HDMI-0 --output DP-1 --mode 1920x1080 --rate 60.00 --right-of DP-4"

function obsidian(){
  cd ~/Documents/obsidian_brain/
  nvim
}
