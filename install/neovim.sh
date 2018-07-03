#!/usr/bin/env bash

sudo apt-get install -y highlight python-dev python-pip python3-dev python3-pip
sudo apt-get install -y software-properties-common
sudo apt-get install -y python-software-properties
sudo apt-add-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install -y neovim

# Setup Neovim config stuff
mkdir -p ~/.config/nvim
mkdir -p ~/.vim/undodir

if [ ! -f ~/.config/nvim/init.vim ]; then
  ln -s $WORKING_DIRECTORY/.config/nvim/init.vim ~/.config/nvim/init.vim
else
  echo "Vim config already symlinked. Skipping..."
fi

# Set neovim to the default editor for everything we care about
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
echo 0 | sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
echo 0 | sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
echo 0 | sudo update-alternatives --config editor

###############
### VimPlug ###
###############
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
