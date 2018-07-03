#!/usr/bin/env bash

WORKING_DIRECTORY=$PWD

if [ ! -x "$(command -v rg)" ]; then
  cd /tmp
  curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep-0.8.1-x86_64-unknown-linux-musl.tar.gz
  tar zxvf ripgrep-0.8.1-x86_64-unknown-linux-musl.tar.gz
  sudo cp ./ripgrep-0.8.1-x86_64-unknown-linux-musl/rg /usr/local/bin/
  rm ripgrep-0.8.1-x86_64-unknown-linux-musl.tar.gz
  rm -rf ripgrep-0.8.1-x86_64-unknown-linux-musl
  cd $WORKING_DIRECTORY
fi
