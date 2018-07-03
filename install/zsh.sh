#!/usr/bin/env bash

sudo apt-get update && sudo apt-get install -y zsh
[ -d "~/.oh-my-zsh" ] && sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
