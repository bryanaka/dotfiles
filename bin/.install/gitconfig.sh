#!/usr/bin/env bash

# This won't work
. $HOME/.dotfiles/setup/utils.sh

CURRENT_DIR="$(get_script_dir)"
PROJECT_DIR="$CURRENT_DIR/../.."

mv $HOME/.gitconfig $HOME/old-gitconfig
cp "$PROJECT_DIR/.gitconfig" $HOME/.gitconfig
cp "$PROJECT_DIR/.gitignore_global" $HOME/.gitignore


