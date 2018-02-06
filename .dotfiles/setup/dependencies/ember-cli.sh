#!/usr/bin/env bash

. $HOME/.dotfiles/setup/utils.sh

if [ "$(program_is_installed brew)" == 1 ]; then
  depends_on yarn "yarn-brew.sh"
else
  depends_on yarn "yarn-apt.sh"
fi

# check ember cli
if [ "$(program_is_installed ember)" == 1 ]; then
    echo_pass "Ember CLI"
else
    echo_fail "Ember CLI"
    echo "Installing Ember CLI..."
    yarn add global ember-cli
    assert_program_exists ember "Ember CLI"
fi
