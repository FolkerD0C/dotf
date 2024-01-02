#!/bin/bash
# Usage needs 1 argument, the full path for install-utils.sh

if [ $# -ne 1 ] ; then
    echo "Wrong number of arguments. Needed: 1, got: ${#}"
    exit 3
fi

if [[ -z $(grep 'echo_red' $1) ]] ; then
    echo "Function 'echo_red' not found in ${1}, exiting..."
    exit 4
fi

source $1

echo_red 'Installing the latest neovim release'
custom_dir="${HOME}/.custom_stuff"
mkdir -p $custom_dir > /dev/null 2>&1 || true
cd $custom_dir

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract

sudo -A ln -fs "${custom_dir}/squashfs-root/AppRun" /usr/bin/nvim
echo_red 'Testing neovim installation'
nvim --version
