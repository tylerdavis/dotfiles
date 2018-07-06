#!/usr/bin/env bash
set -e

echo "Installing RVM..."
command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -sSL https://get.rvm.io | bash -s stable --ruby

source ~/.rvm/scripts/rvm

gem install neovim rcodetools bundler 
bundle config --global --jobs 16

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

# bundle install
