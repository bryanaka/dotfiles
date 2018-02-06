#!/usr/bin/env bash

. $HOME/.dotfiles/setup/utils.sh

HAS_PHOENIX_FRAMEWORK="$(mix help phx.new)"
PHOENIX_FRAMEWORK_URL="https://github.com/phoenixframework/archives/raw/master/phx_new.ez"

if [ "$(program_is_installed brew)" == 1 ]; then
  depends_on elixir "elixir-brew.sh"
else
  depends_on elixir "elixir-apt.sh"
fi

if [ -n "$HAS_PHOENIX_FRAMEWORK" ]; then
  echo_pass "Phoenix Framework"
else
  echo_fail "Phoenix Framework"
  echo "Installing Phoenix Framework..."
  mix archive.install $PHOENIX_FRAMEWORK_URL
fi
