# Zsh
## Install zsh
brew install zsh

## Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## Update zshrc
rm ~/.zshrc
ln -s $PWD/.zshrc ~/.zshrc
ln -s $PWD/.atlassian.zsh ~/.atlassian.zsh
ln -s $PWD/.soundviz.zsh ~/.soundviz.zsh

## Source the new config
source ~/.zshrc

# Shell tools
brew install fzy ripgrep python3

# Neovim
brew install neovim

## Make sure the Neovim config directory is there
mkdir -p ~/.config/nvim

## Symlink the init file
ln -s $PWD/.config/nvim/init.vim ~/.config/nvim/init.vim

## Install VimPlug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## Install Python Dependencies
pip3 install --user neovim jedi psutil setproctitle

## Install Ruby Dependencies
gem install neovim

