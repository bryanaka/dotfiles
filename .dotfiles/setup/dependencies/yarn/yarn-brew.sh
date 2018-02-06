#!/usr/bin/env bash

. $HOME/.dotfiles/setup/utils.sh

depends_on brew "homebrew.sh"

if [ "$(program_is_installed yarn)" == 1 ]; then
    echo_pass "yarn"
else
    echo_fail "yarn"
    echo "Installing Yarn..."
    brew install yarn --without-node
    assert_program_exists yarn "yarn"
fi
