#!/bin/bash

readonly DIRECTORY='/etc/no-hibernate-when-ssh'
readonly SCRIPT_FILE='pam_ssh_no_hibernate.sh'
readonly PAM_SSHD_FILE='/etc/pam.d/sshd'
readonly ASK_FILE='ask.sh'
readonly SCRIPT_FILE_REMOTE='https://raw.githubusercontent.com/phips4/no-hibernate-when-ssh/master/pam_ssh_no_hibernate.sh'
readonly ASK_FILE_REMOTE='https://raw.githubusercontent.com/phips4/no-hibernate-when-ssh/master/ask.sh'

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
  wget -q --show-progress -O "$DIRECTORY/$1" "$2"
  chmod +x "$HOME/$1"
  #TODO: verify checksum
}

check_cmd 'wget'
check_cmd 'system76-power'
check_cmd 'xset'

mkdir -p $DIRECTORY
download $SCRIPT_FILE $SCRIPT_FILE_REMOTE
download $ASK_FILE $ASK_FILE_REMOTE
chmod a+x "$DIRECTORY/$SCRIPT_FILE"
chmod a+x "$DIRECTORY/$ASK_FILE"

if ! grep -L '# no-hibernate-when-ssh' $PAM_SSHD_FILE; then
  printf '\n# no-hibernate-when-ssh\n' >> $PAM_SSHD_FILE
  echo "session     optional    pam_exec.so quiet $DIRECTORY/$SCRIPT_FILE" >> $PAM_SSHD_FILE
fi
