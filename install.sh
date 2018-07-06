#!/bin/bash

set -e

unamestr=`uname`

if [[ "$unamestr" == "Linux" ]]; then
  ./scripts/ubuntu.sh
elif [[ "$unamestr" == "Darwin" ]]; then
  platform="darwin"
  ./scripts/darwin.sh
fi

