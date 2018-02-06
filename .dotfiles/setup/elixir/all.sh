#!/usr/bin/env bash

. $HOME/.dotfiles/setup/utils.sh

# Setup Script
# ==============================================================================
# Installs the following:
# - Elixir
# - Phoenix Framework

depend_on elixir "elixir.sh"
depend_on "phoenix.sh"
