#!/usr/bin/env bash

. $HOME/.dotfiles/setup/utils.sh

# Setup Script
# ==============================================================================
# Installs the following:
# - homebrew
# - chrome

assert_program_exists curl "curl"
assert_program_exists wget "wget"
assert_program_exists git "git"

depend_on brew "homebrew.sh"
depend_on chrome "chrome.sh"
