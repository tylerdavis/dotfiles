#!/usr/bin/env bash
set -e

echo "Installing FZF..."

[ ! -d ~/.fzf ] && git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
