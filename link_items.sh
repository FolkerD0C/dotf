#!/bin/bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";

DIRECTORIES_TO_MAKE="$(find -type d | cut -c3- | grep -v '\.git')"

for dir_path in "${DIRECTORIES_TO_MAKE[@]}"; do
    mkdir -p "$HOME/$dir_path"
done

FILES_TO_SET="$(find -type f | cut -c3- | grep -v '^\.git/' | grep -v '\.sh$')"

for file_path in ${FILES_TO_SET[@]}; do
    ln -s -f "$DOTFILES_DIR/$file_path" "$HOME/$file_path"
done
