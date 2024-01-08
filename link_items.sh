#!/bin/bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";

source "${DOTFILES_DIR}/install_utils.sh"

DIRECTORIES_TO_MAKE="${HOME}/.config"

echo_red "Attempting to make the following directories: ${DIRECTORIES_TO_MAKE}"
mkdir -p $DIRECTORIES_TO_MAKE

for relative_path in .config/nvim .bashrc .zshrc; do
  echo_red "Attempting to link the following 2 paths: ${HOME}/${relative_path} -> ${DOTFILES_DIR}/${relative_path}"
  ln -s -f "${DOTFILES_DIR}/${relative_path}" "${HOME}/${relative_path}"
done
