#!/usr/bin/env bash

. $HOME/.dotfiles/setup/utils.sh

depends_on brew "homebrew.sh"

if [ "$(program_is_installed watchman)" == 1 ]; then
    echo_pass "watchman"
else
    echo_fail "watchman"
    echo "Installing watchman..."
    brew install watchman
    assert_program_exists watchman "watchman"
fi
