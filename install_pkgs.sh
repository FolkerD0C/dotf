#!/bin/bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";

source "$DOTFILES_DIR"/install_utils.sh

export DEBIAN_FRONTEND=noninteractive

echo_red "Attempting an update"
sudo -A apt-get update
sleep 3

echo_red "Attempting an upgrade"
sudo -A apt-get -y upgrade
sleep 3

needed_pkgs='zsh exa bat neofetch git curl gcc'

echo_red "Attempting to install the following packages: [${needed_pkgs}]."
sudo -A apt-get install -yV --no-install-recommends $needed_pkgs

success_1=$?

echo_red "Attempting to install node.js and npm"
curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -A bash - && sudo -A apt-get install -y nodejs
success_2=$?
curl -qL https://www.npmjs.com/install.sh | sudo -A sh
success_3=$?

if [[ "$success_1" -eq 0 && "$success_2" -eq 0 && "$success_3" -eq 0 ]] ; then
    echo "Package install was successful."
else
    echo "Package install did not succeed."
fi

exit "$success_1"
