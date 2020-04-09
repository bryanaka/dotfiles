#!/usr/bin/env bash

. $HOME/.dotfiles/setup/utils.sh

if [ "$(program_is_installed volta)" == 1 ]; then
    echo_pass "Volta"
    echo "Updating Volta..."
    echo "INSERT UPDATE HERE"
else
    echo_fail "Volta"
    echo "Installing Volta..."
    curl https://get.volta.sh | bash
    source_all_the_things
    assert_program_exists volta "Volta"
fi

