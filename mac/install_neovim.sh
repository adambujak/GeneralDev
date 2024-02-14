#!/bin/bash
PROFILE_PATH="${PROFILE_PATH:-profiles/adam}"

pushd ~ > /dev/null
HOME_PATH=$(pwd)
popd > /dev/null

brew install nvim 
pip3 install pynvim

rm -rf ~/.config/nvim/ ~/.nvim

git submodule update --init --recursive

mkdir -p ~/.config/nvim
mkdir -p ~/.nvim

# copy vim config to correct path
cp $PROFILE_PATH/neovimrc ~/.config/nvim/init.vim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
