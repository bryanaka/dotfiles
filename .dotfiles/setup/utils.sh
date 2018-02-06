#!/usr/bin/env bash

function source_nvm {
  [ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

function source_all_the_things {
  [ -s "$HOME/.bashrc" ] && \. "$HOME/.bashrc"
  [ -s "$HOME/.profile" ] && \. "$HOME/.profile"
  [ -s "$HOME/.bash_profile" ] && \. "$HOME/.bash_profile"
  [ -s "$HOME/.zshrc" ] && \. "$HOME/.zshrc"
  source_nvm
}

function program_is_installed {
  # set to 1 initially
  local return_=1
  # set to 0 if not found
  command -v $1 >/dev/null 2>&1 || { local return_=0; }
  echo $return_
}

# echo first argument in green
function print_green {
  printf "\e[32m${1}\033[0m\n"
}

# echo first argument in yellow
function print_yellow {
  printf "\e[33m${1}\033[0m\n"
}

# echo first argument in red
function print_red {
  printf "\e[31m${1}\033[0m\n"
}

# display a message in red with a cross by it
function echo_fail {
  print_red "[✘] ${1}"
}

# display a message in green with a tick by it
function echo_pass {
  print_green "[✔] ${1}"
}

function assert_program_exists {
  local program=$1;
  if [ "$(program_is_installed $program)" == 1 ]; then
    echo_pass $2
  else
    print_red "Failed to install ${2}! Please try installing ${2} manually."
    exit 1
  fi
}

function depends_on {
  if [ "$(program_is_installed $1)" ] && [ -z "${2}" ]; then
    [ -z "${3}" ] && echo_pass 'dependencies found for ${3}'
  else
    . "$HOME/.dotfiles/setup/dependencies/${2}"
  fi
}