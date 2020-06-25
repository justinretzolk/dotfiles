#!/bin/bash

# Determine what type of OS you're running
OS=$(uname -s)

# stow the config directory
# dots are set up for XDG spec, this directory is the only one we need to stow
stow config

if [[ $OS == "Darwin" ]]; then

  # install defaults
  #${PWD}/os/macos/defaults.sh

  # make sure brew is installed
  command -v brew > /dev/null && echo "Homebrew is already installed." || curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby

  # wait for Homebrew to be installed
  until $( command -v brew > /dev/null 2>&1 ); do
    echo "Waiting for Homebrew to be installed."
    sleep 5
  done

  # install brews
  brew bundle check --file=${PWD}/os/macos/Brewfile

elif [[ $OS == "Linux" ]]; then

  # linux config
  ${PWD}/os/linux/apt.sh

else

  echo "OS cannot be determined. Exiting."
  exit

fi
