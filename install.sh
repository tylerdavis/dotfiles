# Install homebrew
if ! [ -x "$(command -v brew)" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

## Install zsh
brew install zsh fasd

## Install oh-my-zsh
[ -d "~/.oh-my-zsh" ] && sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## oh-my-zsh plugins
### zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

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

## Make sure the Neovim config directory is there
mkdir -p ~/.config/nvim

## Make sure the vim undo directory is created
mkdir -f ~/.vim/undodir

## Symlink the init file
ln -s $PWD/.config/nvim/init.vim ~/.config/nvim/init.vim

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
