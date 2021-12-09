#!/bin/bash -xe

sudo apt install deepin-terminal
mkdir -p ~/soft/git
cd ~/soft/git
git clone https://github.com/xxczaki/deepin-snazzy.git
(cd deepin-snazzy && chmod +x install.sh && ./install.sh)
#
# fish shell
#
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install fish powerline fonts-powerline exa
#Note: for exa install nerd font called Arimo
# CascadiaCode for oh my posh

#
# oh my fish shell
#
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
# install them for fish-shell
omf install bobthefish

# install neovim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
