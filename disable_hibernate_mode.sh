#!/bin/bash

source ./ask.sh

if [[ -n $SSH_CONNECTION ]]; then
  sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
  xset -display :0.0 dpms force on
fi