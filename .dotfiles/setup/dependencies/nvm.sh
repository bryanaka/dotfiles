#!/usr/bin/env bash

# Configuration Variables
# ==============================================================================
TARGET_NVM_VERSION="v0.33.8"
NVM_INSTALL_SCRIPT="https://raw.githubusercontent.com/creationix/nvm/$TARGET_NVM_VERSION/install.sh"

. $HOME/.dotfiles/setup/utils.sh

source_nvm

assert_program_exists curl "curl"

if [ "$(program_is_installed nvm)" == 1 ]; then
    # check nvm version
    if [ "v$(nvm --version)" == $TARGET_NVM_VERSION ]; then
        echo_pass "nvm"
        source_nvm
    else
      echo "Updating nvm..."
      CURRENT_WORKING_DIR="$(pwd)"
      cd $NVM_DIR
      git fetch
      git checkout $TARGET_NVM_VERSION
      source_nvm
      cd $CURRENT_WORKING_DIR
    fi
else
    echo_fail "nvm"
    echo "Installing nvm..."
    curl -o- $NVM_INSTALL_SCRIPT | bash
    source_nvm
    assert_program_exists nvm "nvm"
fi
