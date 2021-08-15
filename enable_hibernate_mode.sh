#!/bin/bash

source ./ask.sh

if [[ -n $SSH_CONNECTION ]]; then
  echo "LOGIN VIA SSH";
  if ask "Do you want to set the PC in battery mode?" Y; then
    sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
    sudo system76-power graphics intel
    sudo system76-power profile battery
    xset -display :0.0 dpms force off
  fi
fi