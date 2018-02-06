#!/usr/bin/env bash

. $HOME/.dotfiles/setup/utils.sh

# YARN APT GET CONFIG
YARN_APT_KEY_PUBLIC_KEY="https://dl.yarnpkg.com/debian/pubkey.gpg"
YARN_DEB_PKG_URL="https://dl.yarnpkg.com/debian/"
YARN_TEE_SOURCE_LIST="/etc/apt/sources.list.d/yarn.list"

if [ "$(program_is_installed yarn)" == 1 ]; then
    echo_pass "yarn"
else
    echo_fail "yarn"
    echo "Installing Yarn..."
    curl -sS $YARN_APT_KEY_PUBLIC_KEY | sudo apt-key add -
    echo "deb $YARN_DEB_PKG_URL stable main" | sudo tee $YARN_TEE_SOURCE_LIST
    sudo apt-get update && sudo apt-get -y install yarn
    assert_program_exists yarn "yarn"
fi
