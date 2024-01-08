#!/bin/bash

if [ $# -ne 1 ]; then
  echo -e 'Expected one argument: sudo password\nExiting...'
  exit 2
fi

sudo_password=$1

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

echo 'Installing oh-my-zsh'
echo -e "y\n${sudo_password}\nexit" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo_red 'Installing rust, needed by the lua formatter in neovim: stylua'
echo 1 | sh -c "$(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs)"
