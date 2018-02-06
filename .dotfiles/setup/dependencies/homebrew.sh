#!/usr/bin/env bash

. $HOME/.dotfiles/setup/utils.sh

RAW_HOMEBREW_URL='https://raw.githubusercontent.com/Homebrew/install/master/install'

if [ "$(program_is_installed brew)" == 1 ]; then
    echo_pass "homebrew"
    echo "Updating homebrew..."
    brew update
else
    echo_fail "homebrew"

    echo "Installing homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL $RAW_HOMEBREW_URL)"
    assert_program_exists brew "homebrew"

    echo "Updating homebrew..."
    brew update
fi
