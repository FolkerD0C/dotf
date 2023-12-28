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

export DEBIAN_FRONTEND=noninteractive

source $1

echo_red "Attempting an update"
sudo -A apt-get update
sleep 3

echo_red "Attempting an upgrade"
sudo -A apt-get upgrade
sleep 3

needed_pkgs='zsh exa bat neofetch git curl gcc'

echo_red "Attempting to install the following packages: [${needed_pkgs}]."
sudo -A apt-get install -yV --no-install-recommends $needed_pkgs

success=$?

if [ $success -eq 0 ] ; then
    echo "Package install was successful."
else
    echo "Package install did not succeed."
fi

exit $success

