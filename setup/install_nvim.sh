#!/bin/bash

./install_deps.sh ninja-build gettext cmake curl build-essential

set -e

BUILD_DIR=$(mktemp -d -t temp-XXXXXX)
cleanup()
{
    echo "INFO: Cleaning up..."
    rm -rf "$BUILD_DIR"
}
trap cleanup EXIT INT TERM

cd "$BUILD_DIR"

echo "INFO: Cloning nvim"
git clone https://github.com/neovim/neovim.git --depth 1

cd neovim

echo "INFO: Building nvim"
if ! make CMAKE_BUILD_TYPE=Release; then
  echo "ERROR: Failed to build nvim"
  exit 1
fi

echo "INFO: Installing nvim"
sudo make install

