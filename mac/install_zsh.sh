#!/bin/bash
PROFILE_PATH="${PROFILE_PATH:-profiles/adam}"

######################################################################
############################# ohmyzsh ################################
######################################################################

rm -rf ~/.oh-my-zsh
rm ~/.zshrc

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

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

# get HOME_PATH
pushd ~ > /dev/null
HOME_PATH=$(pwd)
popd > /dev/null

# install zshrc
#
OH_MY_ZSH_PATH=$HOME_PATH/.oh-my-zsh
NEW_PATH=$(echo $OH_MY_ZSH_PATH | sed 's/\//\\\//g')

sed "s/MY_PATH_TO_OH_MY_ZSH/${NEW_PATH}/g" "$PROFILE_PATH/zshrc" > $HOME_PATH/.zshrc

