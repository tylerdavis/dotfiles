# Install zsh
brew install zsh

# Update zshrc
rm ~/.zshrc
ln -s $PWD/.zshrc ~/.zshrc
ln -s $PWD/.atlassian.zsh ~/.atlassian.zsh

# Make sure the Neovim config directory is there
mkdir -p ~/.config/nvim

# Symlink the init file
ln -s $PWD/.config/nvim/init.vim ~/.config/nvim/init.vim

# Install VimPlug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Python Dependencies
pip install neovim

# Install Ruby Dependencies
gem install neovim
