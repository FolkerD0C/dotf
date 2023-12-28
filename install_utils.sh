#!/bin/bash

function echo_red() {
    local RED='\033[0;31m' #Red Color
    local NC='\033[0m' # No Color

    echo -e "\n\t${RED}${1}${NC}\n"
}

function get_sudo_pass() {
    echo_red 'The setup needs a sudo password, so provide one, please:'
    echo -n 'Your sudo password: '
    read -s PASS
    echo 2>&1
    
    #Create askpass file
    echo -e "#!/usr/bin/env bash\necho ${PASS}" > $1
    chmod u+x $askpass_file

    #Test password
    SUDO_ASKPASS=$askpass_file sudo -A true > /dev/null

    exit $?
}
