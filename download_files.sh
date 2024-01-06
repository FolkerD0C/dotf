#!/bin/bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";

source "$DOTFILES_DIR"/install_utils.sh

echo_red 'Installing the latest neovim release'
custom_dir="${HOME}/.custom_stuff"
mkdir -p "$custom_dir" > /dev/null 2>&1 || true
cd "$custom_dir" || exit 1

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract

sudo -A ln -fs "${custom_dir}/squashfs-root/AppRun" /usr/bin/nvim
echo_red 'Testing neovim installation'
nvim --version

echo_red 'Installing rust, needed by the lua formatter in neovim: stylua'
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
