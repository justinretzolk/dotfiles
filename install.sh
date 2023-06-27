#!/bin/bash

# Determine the OS
OS=$(uname -s)

# macOS configuration
if [[ $OS == "Darwin" ]]; then

	# set defaults
	echo "Setting up defaults..."
	source ./os/macos/defaults.sh

	# make sure brew is installed
	if ! $(command -v brew &> /dev/null); then
		echo "Unmet Dependency: Please install brew"
	fi

	# install programs via brew
	echo "Installing brews..."
	brew bundle install --file=${PWD}/os/macos/Brewfile

else

	echo "No configs for this OS: ${OS}"
	exit

fi

# stow the config directory
# dots are set up for XDG spec, this directory is the only one that needs to be to stowed.
stow .
