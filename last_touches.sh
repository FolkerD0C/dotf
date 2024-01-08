#!/bin/bash

ZSHRC_PRIV_PATH="${HOME}/.zshrc.priv"

if [ ! -f "$ZSHRC_PRIV_PATH" ]; then
  echo "   Creating new file: $ZSHRC_PRIV_PATH"
  echo '   It is a file which is sourced by ~/.zshrc'
  echo '   and it is not included in the dotfiles repository.'
  cat <<EOF > "$ZSHRC_PRIV_PATH"
# This is an autocreated file by the installer scripts of 
#      https://github.com/FolkerD0C/dotfiles
# This file is not part of the repository but is sourced by its .zshrc
# You can place private statements (eg. aliases and environmental variables)
# or functions here.
#
# Uncomment the following line to have lsp capabilities in neovim.
# List of supported languages:
#  - Bash: 'bash'
#  - C#: 'csharp'
#  - Lua: 'lua'
# export NEOVIM_REQUIRED_LANGUAGES='bash,lua'
#
# Uncomment the following line to have cargo/rust enabled in your shell
# source "${HOME}/.cargo/env"
EOF
fi
