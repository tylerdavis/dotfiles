#!/bin/bash

set -e

platform='unknown'
unamestr=`uname`

if [[ "$unamestr" == "Linux" ]]; then
  platform="linux"
elif [[ "$unamestr" == "Darwin" ]]; then
  platform="darwin"
fi

if [[ "$platform" == "darwin" ]]; then
  # Install homebrew
  if ! [ -x "$(command -v brew)" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  ## Install zsh
  brew install zsh
elif [[ "$platform" == "linux" ]]; then
  apt-get update && apt-get install -y zsh
fi

## Install oh-my-zsh
[ -d "~/.oh-my-zsh" ] && sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## oh-my-zsh plugins
### zsh-syntax-highlighting
if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
  echo "Installing ZSH Syntax Highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
else
  echo "ZSH Syntax Highlighting already installed.  Continuing..."
fi

## Install RVM
curl -sSL https://get.rvm.io | bash -s stable --ruby
source ~/.rvm/scripts/rvm

## Install NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash

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
check_and_link .deployhub.zsh
check_and_link .gitconfig
check_and_link .gitignore
check_and_link .tmux.conf

# fzf
[ -d "~/.fzf" ] && git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

if [[ "$platform" == "darwin" ]]; then
  # iterm2
  brew install caskroom/versions/iterm2-beta
  # Setup iterm2 preferences directory
  defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$PWD/iterm2_profile"
  # Tell iterm to use the custom preferences in the directory
  defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

  # Shell tools
  brew install ripgrep python3 highlight

  # Neovim
  brew install neovim

elif [[ "$platform" == "linux" ]]; then
  curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
  dpkg -i ripgrep_0.8.1_amd64.deb 
  rm -rf ripgrep_0.8.1_amd64.deb
  apt-get install -y highlight python-dev python-pip python3-dev python3-pip
  apt-get install -y software-properties-common
  apt-get install -y python-software-properties
  apt-add-repository ppa:neovim-ppa/stable
  apt-get update
  apt-get install -y neovim
fi

## Make sure the Neovim config directory is there
mkdir -p ~/.config/nvim

## Make sure the vim undo directory is created
mkdir -p ~/.vim/undodir

## Symlink the init file
if [[ ! -f ~/.config/nvim/init.vim ]]; then
  ln -s $PWD/.config/nvim/init.vim ~/.config/nvim/init.vim
else
  echo "Vim config already symlinked. Skipping..."
fi

## Install VimPlug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## Install Python Dependencies
pip3 install --user neovim jedi psutil setproctitle

## Install Ruby Dependencies
gem install neovim rcodetools

## Install FastRi
git clone https://github.com/orta/fastri.git
cd fastri && ruby setup.rb && cd .. && rm -rf ./fastri

## Last thing, install your vim plugins
nvim -c ':PlugInstall | quit | quit'
