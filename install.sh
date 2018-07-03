#!/bin/bash

set -e

unamestr=`uname`

if [[ "$unamestr" == "Linux" ]]; then
  ./install/ubuntu.sh
elif [[ "$unamestr" == "Darwin" ]]; then
  platform="darwin"
  ./install/darwin.sh
fi

