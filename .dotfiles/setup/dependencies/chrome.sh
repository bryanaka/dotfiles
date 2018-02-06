#!/usr/bin/env bash

. $HOME/.dotfiles/setup/utils.sh

# NOTE: This only works for regular installs of Google Chrome
CHROME_PATH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
CASK_CHROME_PATH="/usr/local/Caskroom/google-chrome"

depends_on 'homebrew.sh'
depends_on 'cask.sh'

if [ -s "$CHROME_PATH" ]; then
    echo_pass "Chrome"
else
    echo_fail "Chrome"
    echo "Installing Chrome Browser..."
    brew cask install google-chrome

    if [ -s "$CASK_CHROME_PATH" ] || [ -s "$CHROME_PATH" ]; then
      echo_pass "Chrome"
    else
      print_red "Chrome or Chromium is required to run tests from the command line."
      print_yellow "It is highly recommened you download the latest Google Chrome"
    fi
fi
