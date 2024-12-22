# Welcome to my collection of DOTFILES

## This is a work in progress

### To install -

`./install_symlinks.sh`

This will create symlinks in the respective directories for each file.
If the file exists, it will back it up beforehand.

### Case Insensitive Bash

If ~/.inputrc doesn't exist yet: First include the original /etc/inputrc
so it won't get overriden
if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrc; fi

 Add shell-option to ~/.inputrc to enable case-insensitive tab completion
echo 'set completion-ignore-case On' >> ~/.inputrc
