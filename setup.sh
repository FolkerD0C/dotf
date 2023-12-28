#!/bin/bash

set -eu

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";

source $DOTFILES_DIR/install_utils.sh

sudo_askpass_file="${DOTFILES_DIR}/sudo_askpass"
get_sudo_pass $sudo_askpass_file
if [ $? -eq 0 ] ; then
    export SUDO_ASKPASS=$sudo_askpass_file
else
    echo_red 'Sudo password does not work.'
    exit 1
fi

echo_red 'First phase: Install packages'
bash install_pkgs.sh

echo_red 'Second phase: Download files'
bash download_files.sh
cd $DOTFILES_DIR

echo_red 'Third phase: Clone some repositories'
bash clone_repos.sh

echo_red 'Fourth phase: Link items'
bash link_items.sh
cd $DOTFILES_DIR
