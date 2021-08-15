#!/bin/bash

readonly ENABLE_FILE="enable_hibernate_mode.sh"
readonly DISABLE_FILE="disable_hibernate_mode.sh"
readonly ASK_FILE="ask.sh"
readonly ENABLE_FILE_REMOTE="https://raw.githubusercontent.com/phips4/no-hibernate-when-ssh/master/enable-hibernate.sh"
readonly DISABLE_FILE_REMOTE="https://raw.githubusercontent.com/phips4/no-hibernate-when-ssh/master/disable-hibernate.sh"
readonly ASK_FILE_REMOTE="https://raw.githubusercontent.com/phips4/no-hibernate-when-ssh/master/ask.sh"

# command_name
check_cmd () {
  if ! command -v "$1" &> /dev/null; then
      echo "ERROR: $1 needs to be installed."
      exit
  fi
}

# file_name, remote_file
download () {
  echo "downloading $2 to"
  wget -q --show-progress -O "$HOME/$1" "$2"
  chmod +x "$HOME/$1"
  #TODO: verify checksum
}

# file_to_start, file
link_file () {
  START_SCRIPT="/bin/bash ./$1"
  grep -qxF "$START_SCRIPT" "$2" || echo "$START_SCRIPT" >> "$2"
  echo "linked $1 to $2"
}

check_cmd "wget"
check_cmd "xset"
download $ENABLE_FILE $ENABLE_FILE_REMOTE
download $DISABLE_FILE $DISABLE_FILE_REMOTE
download $ASK_FILE $ASK_FILE_REMOTE
link_file $ENABLE_FILE "$HOME/.bashrc"
link_file $DISABLE_FILE "$HOME/.bash_logout"
