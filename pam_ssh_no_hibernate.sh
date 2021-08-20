#!/bin/sh

. ./ask.sh

if [ "$PAM_TYPE" = "open_session" ]; then
  echo "connected over ssh"

  if ask "Do you want to set the PC in battery mode?" Y; then
    sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
    sudo system76-power profile battery
    xset -display :0.0 dpms force off
  fi
fi

if [ "$PAM_TYPE" = "close_session" ]; then
  sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
  xset -display :0.0 dpms force on
fi