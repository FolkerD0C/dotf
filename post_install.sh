#!/bin/bash
# Usage needs 1 argument, the full path for install-utils.sh

if [ $# -ne 1 ] ; then
    echo "Wrong number of arguments. Needed: 1, got: ${#}"
    exit 3
fi

if [[ -z $(grep 'echo_red' "$1") ]] ; then
    echo "Function 'echo_red' not found in ${1}, exiting..."
    exit 4
fi

source "$1"

echo_red 'Installing oh-my-zsh'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
