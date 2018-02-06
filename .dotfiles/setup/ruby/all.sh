#!/usr/bin/env bash

. $HOME/.dotfiles/setup/utils.sh

# Setup Script
# ==============================================================================
# Installs the following:
# - rvm
# - ruby (via rvm)
# - rails

depend_on rvm "rvm.sh"
depend_on "rvm-ruby.sh"
depend_on rails "rails.sh"
