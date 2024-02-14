#!/bin/bash

PROFILE_PATH="${PROFILE_PATH:-profiles/adam}"

# get home path
pushd ~ > /dev/null
HOME_PATH=$(pwd)
HOME_PATH_SED_STR=$(echo $HOME_PATH | sed 's/\//\\\//g')
popd > /dev/null

######################################################################
############################### git ##################################
######################################################################

cp $PROFILE_PATH/global_gitignore ~/.gitignore
sed "s/HOME_DIRECTORY/${HOME_PATH_SED_STR}/g" "$PROFILE_PATH/global_gitconfig" > ~/.gitconfig

######################################################################
############################# zprofile ###############################
######################################################################

# back up old zprofile
cat ~/.zprofile >> ~/.zprofile_backup

# install zprofile
cp $PROFILE_PATH/zprofile ~/.zprofile

######################################################################
############################## zshrc #################################
######################################################################

# install zshrc
OH_MY_ZSH_PATH=$HOME_PATH/.oh-my-zsh
NEW_PATH=$(echo $OH_MY_ZSH_PATH | sed 's/\//\\\//g')

sed "s/MY_PATH_TO_OH_MY_ZSH/${NEW_PATH}/g" "$PROFILE_PATH/zshrc" > $HOME_PATH/.zshrc

######################################################################
############################## nvim ##################################
######################################################################

rm -rf ~/.config/nvim/ ~/.nvim

mkdir -p ~/.config/nvim
mkdir -p ~/.nvim

cp $PROFILE_PATH/neovimrc ~/.config/nvim/init.vim

######################################################################
############################## tmux ##################################
######################################################################

# back up old tmux config
cat ~/.tmux.conf >> ~/.tmux_conf_backup

cp $PROFILE_PATH/tmux.conf ~/.tmux.conf

######################################################################
############################ profile #################################
######################################################################

# install profile
sh $PROFILE_PATH/install.sh

