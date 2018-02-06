#!/usr/bin/env bash

. $HOME/.dotfiles/setup/utils.sh

# Setup Script
# ==============================================================================
# Installs the following:
# - yarn
# - nvm
# - Ember CLI
# - watchman

depend_on nvm "nvm.sh"
depend_on yarn "yarn.sh"
depend_on ember "ember-cli.sh"
depend_on watchman "watchman.sh"
