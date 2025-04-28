#!/usr/bin/bash 





get_keyboard_id() {
  xinput list | grep -i 'AT Translated Set 2 keyboard' | grep -o 'id=[0-9]\+' | cut -d= -f2
}



enable_keyboard() {
  id=$(get_keyboard_id)
  if [ "$id" != "" ]; then
    xinput enable "$id"
    echo "Keyboard enabled."
  else
    echo "Keyboard not found."
  fi 
}

disable_keyboard() {
  id=$(get_keyboard_id)
  if [ "$id" != "" ]; then
    xinput disable  "$id"
    echo "Keyboard disabled."
  else
    echo "Keyboard not found."
  fi 
}



if [[ $1 == "enable" ]]; then
  enable_keyboard
elif [[ $1 == "disable" ]]; then
  disable_keyboard
else
  echo "expecting 1 arguement [enable|disable]"

fi
