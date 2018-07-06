#!/usr/bin/env bash
set -e

export WORKING_DIRECTORY=$PWD
export SCRIPTS_DIRECTORY=$WORKING_DIRECTORY/scripts

# Install ZSH and oh-my-zsh
source $SCRIPTS_DIRECTORY/zsh.sh

# Install Ruby stuff
source $SCRIPTS_DIRECTORY/setup_ruby.sh

# Installs or updates NVM
source $SCRIPTS_DIRECTORY/nvm.sh

# Install fzf if it's not installed already
source $SCRIPTS_DIRECTORY/fzf.sh

# Install Ripgrep
source $SCRIPTS_DIRECTORY/ripgrep.sh

# Install Neovim
source $SCRIPTS_DIRECTORY/neovim.sh

# Python deps - also some neovim stuff
pip3 install --user neovim jedi psutil setproctitle

# Last thing, install your vim plugins
nvim -c ':PlugInstall | quit | quit'

