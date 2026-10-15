# FZF shortcut commands
# https://github.com/junegunn/fzf/wiki/examples
#
# fcd - cd into the selected sub directory (recursive, hidden dirs excluded).
# Renamed from `fd`: that shadowed the real `fd` binary, which the `v` alias in
# .bash_aliases depends on.
fcd() {
  local dir
  dir=$(find . -path '*/.*' -prune -o -type d -print 2> /dev/null | fzf-tmux) \
    && [ -n "$dir" ] && cd "$dir" || return
}

# fdr - cd to selected parent directory
fdr() {
  local dirs=()
  get_parent_dirs() {
    if [[ -d "${1}" ]]; then dirs+=("$1"); else return; fi
    if [[ "${1}" == '/' ]]; then
      for _dir in "${dirs[@]}"; do echo "$_dir"; done
    else
      get_parent_dirs "$(dirname "$1")"
    fi
  }
  local DIR
  DIR=$(get_parent_dirs "$(realpath "${1:-$PWD}")" | fzf-tmux --tac)
  [ -n "$DIR" ] && cd "$DIR"
}


# cdf - cd into the directory of the selected file
cdf() {
   local file
   local dir
   file=$(fzf  +m -q "$1" --preview='less {}') && dir=$(dirname "$file") && cd "$dir"
}

# fe - open file in nvim
fe() {
    local file
    file=$(fzf --preview='less {}') && nvim "$file"
}
