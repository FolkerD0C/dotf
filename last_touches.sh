#!/bin/bash

ZSHRC_PRIV_PATH="${HOME}/.zshrc.priv"

if [ ! -f "$ZSHRC_PRIV_PATH" ]; then
  echo "Creating new file: $ZSHRC_PRIV_PATH"
  echo 'It is a file which is sourced by ~/.zshrc'
  echo 'and it is not included in the dotfiles repository.'
  cat <<EOF > $ZSHRC_PRIV_PATH
# This is an autocreated file by the installer scripts of 
#      https://github.com/FolkerD0C/dotfiles
# This file is not part of the repository but is sourced by its .zshrc
# You can place private statements (eg. aliases and environmental variables)
# or functions here.
EOF
fi

if grep -q '^export NEOVIM_REQUIRED_LANGUAGES=' "$ZSHRC_PRIV_PATH"; then
  echo 'export NEOVIM_REQUIRED_LANGUAGES=lua' >> "$ZSHRC_PRIV_PATH"
fi
