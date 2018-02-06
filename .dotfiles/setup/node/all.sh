#!/usr/bin/env bash

. $HOME/.dotfiles/setup/utils.sh

# Setup Script
# ==============================================================================
# Installs the following:
# - yarn
# - nvm

depend_on nvm "nvm.sh"
depend_on yarn "yarn.sh"
