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
sudo apt-get install fish

#
# oh my fish shell
#
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
# install them for fish-shell
omf install bobthefish
