#!/usr/bin/env bash

. $HOME/.dotfiles/setup/utils.sh

depends_on 'homebrew.sh'

HAS_CASK="$(brew tap | grep cask)"

if [ -n "$HAS_CASK" ]; then
  echo_pass "cask"
else
  echo_fail "cask"
  echo "Installing Cask..."
  brew tap caskroom/cask
  [ -z "$(brew tap | grep cask)" ] && echo 'Failed to install cask!' && exit 2;
fi
