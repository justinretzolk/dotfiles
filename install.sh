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
		echo "Installing Homebrew..."
		curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby
	fi

	# wait for Homebrew to be installed
	until $(command -v brew &> /dev/null); do
		echo "Waiting for Homebrew to be installed..."
		sleep 5
	done

	# install programs via brew
	echo "Installing brews..."
	brew bundle install --file=${PWD}/os/macos/Brewfile

	# bash lsp install
	if ! $(command -v bash-language-server &> /dev/null); then
		echo "Installing bash language server..."
		npm i -g bash-language-server
	fi

	# json lsp install
	if ! $(command -v vscode-json-language-server &> /dev/null); then
		echo "Installing json language server..."
		npm i -g vscode-langservers-extracted
	fi

	# yaml lsp install
	if ! $(command -v yaml-language-server &> /dev/null); then
		echo "Installing yaml language server..."
		yarn global add yaml-language-server
	fi

else

	echo "No configs for this OS: ${OS}"
	exit

fi

# stow the config directory
# dots are set up for XDG spec, this directory is the only one that needs to be to stowed.
stow config
