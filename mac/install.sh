#!/bin/bash

export PROFILE_PATH="${PROFILE_PATH:-profiles/adam}"

./install_zsh.sh
./install_neovim.sh
./install_tmux.sh
./install_tools.sh

# install profile
sh $PROFILE_PATH/install.sh

