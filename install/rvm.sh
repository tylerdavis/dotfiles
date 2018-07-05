#!/usr/bin/env bash
set -e

echo "Installing RVM..."

command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -sSL https://get.rvm.io | bash -s stable --ruby
