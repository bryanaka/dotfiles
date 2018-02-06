#!/usr/bin/env bash

# Core Shell Configuration

SHELL_TO_USE='bash'

EXTENSIONS_PATH='${HOME}/.dotfiles/${SHELL_ROOT}/extensions'
AUTOCOMPLETE_PATH='${HOME}/.dotfiles/${SHELL_ROOT}/autocomplete'
ALIASES_PATH='${HOME}/.dotfiles/${SHELL_ROOT}/aliases'

function link_extension {
  . "${EXTENSIONS_PATH}/${1}"
}

function link_autocomplete {
  . "${AUTOCOMPLETE_PATH}/${1}"
}

function link_alias {
  . "${ALIASES_PATH}/${1}"
}

########################################
# Extensions
########################################
link_extension '.z'
link_extension '.iterm2'
link_extension '.rvm'
link_extension '.nvm'

########################################
# Autocomplete
########################################
link_autocomplete '.git_autocomplete'
link_autocomplete '.iterm2_shell_integration.bash'

########################################
# Aliases
########################################
link_alias '.aliases'
