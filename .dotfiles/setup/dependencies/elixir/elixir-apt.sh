#!/usr/bin/env bash

. $HOME/.dotfiles/setup/utils.sh

if [ "$(program_is_installed elixir)" == 1 ]; then
    echo_pass "elixir"
else
    echo_fail "elixir"
    echo "Installing Elixir..."
    # TODO
    assert_program_exists elixir "elixir"
fi
