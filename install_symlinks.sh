#/usr/bin/bash
set -e
set -x


#.bashrc
if [ -f ~/.bashrc ]; 
then
        mv ~/.bashrc ~/.bashrc_backup
fi    
ln -s $PWD/.bashrc ~/.bashrc 

#.tmux.conf
if [ -f ~/.tmux.conf ]; 
then
        mv ~/.tmux.conf ~/.tmux.conf_backup
fi    
ln -s $PWD/.tmux.conf ~/.tmux.conf 

#.vimrc
if [ -f ~/.vimrc ]; 
then
        mv ~/.vimrc ~/.vimrc_backup
fi    
ln -s $PWD/.vimrc ~/.vimrc 

#.bash_aliases
if [ -f ~/.bash_aliases ]; 
then
        mv ~/.bash_aliases ~/.bash_aliases_backup
fi    
ln -s $PWD/.bash_aliases ~/.bash_aliases 

#alacritty
if [ -f ~/.alacritty ]; 
then
        mv ~/.alacritty ~/.alacritty_backup
fi    
ln -s $PWD/.alacritty ~/.alacritty 
