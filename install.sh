#!/bin/bash

# Determine the OS
OS=$(uname -s)

# macOS configuration
if [[ $OS == "Darwin" ]]; then

  # set defaults
  source ./os/macos/defaults.sh

  # make sure brew is installed
  if ! $(command -v brew &> /dev/null); then
	  echo "Installing Homebrew..."
	  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby
  fi

  # wait for Homebrew to be installed
  until $(command -v brew &> /dev/null); do
    echo "Waiting for Homebrew to be installed..."
    sleep 5
  done

  # install programs via brew
  brew bundle install --file=${PWD}/os/macos/Brewfile

else

  echo "No configs for this OS: ${OS}"
  exit

fi

# stow the config directory
# dots are set up for XDG spec, this directory is the only one that needs to be to stowed.
stow config
