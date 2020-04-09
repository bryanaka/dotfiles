#!/usr/bin/env bash

# https://asdf-vm.com/
ASDF_TAG_VERSION="v0.7.8"

. $HOME/.dotfiles/setup/utils.sh

if [ "$(program_is_installed asdf)" == 1 ]; then
    echo_pass "asdf"
    echo "Updating asdf..."
    asdf update --head
else
    echo_fail "asdf"
    echo "Installing asdf..."
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch $ASDF_TAG_VERSION
    
    # In case version is stale
    echo "Updating asdf..."
    asdf update --head
    
    # fish 
    if [ "$(program_is_installed fish)" == 1 ]; then
        echo 'source ~/.asdf/asdf.fish' >> ~/.config/fish/config.fish
        mkdir -p ~/.config/fish/completions; and cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions
    fi
    
    # bash
    echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
    echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
    
    source_all_the_things
    assert_program_exists asdf "asdf"
fi
