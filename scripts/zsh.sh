#!/usr/bin/env bash

set -e

echo "Installing ZSH..."

sudo apt-get update && sudo apt-get install -y zsh
[ ! -d "~/.oh-my-zsh" ] && sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
