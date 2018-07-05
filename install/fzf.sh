#!/usr/bin/env bash
set -e

echo "Installing FZF..."

if [ ! -d ~/.fzf ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  source ~/.fzf/install
  echo "Sourced FZF install..."
fi
