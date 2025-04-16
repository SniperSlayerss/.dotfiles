#!/bin/bash

set -e

if command -v tms >/dev/null 2>&1; then
  echo "ERROR: tms already installed"
  exit 1
fi

if ! command -v cargo >/dev/null 2>&1; then
  echo "INFO: installing rust/cargo"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

echo "INFO: Installing tmux-sessionizer"
cargo install tmux-sessionizer --locked

if ! command -v tms >/dev/null 2>&1; then
  echo "ERROR: cannot install tmux-sessionizer"
  exit 1
fi

echo "INFO: Successfully installed tmux-sessionizer"
