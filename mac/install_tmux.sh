#!/bin/bash
PROFILE_PATH="${PROFILE_PATH:-profiles/adam}"

brew install tmux

rm -rf ~/.tmux

cat ~/.tmux.conf >> ~/.tmux_conf_backup

cp $PROFILE_PATH/tmux.conf ~/.tmux.conf
