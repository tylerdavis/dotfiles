#!/usr/bin/env bash
set -e

export WORKING_DIRECTORY=$PWD
export INSTALL_DIRECTORY=$WORKING_DIRECTORY/install

# Install ZSH and oh-my-zsh
source $INSTALL_DIRECTORY/zsh.sh

# Install RVM if it's not installed
[ ! -d ~/.rvm ] && source $INSTALL_DIRECTORY/rvm.sh

# Installs or updates NVM
source $INSTALL_DIRECTORY/nvm.sh

###################
### Base Config ###
###################
check_and_link () {
  if [ ! -f ~/$1 ]; then
    ln -s $PWD/$1 ~/$1
  else
    echo "$1 already exists.  skipping..."
  fi
}

check_and_link .zshrc
check_and_link .atlassian.zsh
check_and_link .soundviz.zsh
check_and_link .gitconfig
check_and_link .gitignore
check_and_link .tmux.conf

# Install fzf if it's not installed already
source $INSTALL_DIRECTORY/fzf.sh

# Install Ripgrep
source $INSTALL_DIRECTORY/ripgrep.sh

# Install Neovim
source $INSTALL_DIRECTORY/neovim.sh

# Python deps - also some neovim stuff
pip3 install --user neovim jedi psutil setproctitle

# Ruby stuff
gem install neovim rcodetools

##############
### FastRi ###
##############
cd /tmp
git clone https://github.com/orta/fastri.git
cd fastri
ruby setup.rb
cd ..
rm -rf ./fastri
cd $WORKING_DIRECTORY

# Last thing, install your vim plugins
nvim -c ':PlugInstall | quit | quit'

