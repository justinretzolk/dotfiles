DOTFILES_DIR = $(shell echo $(HOME)/.dotfiles)
UNAME := $(shell uname -s)

ifeq ($(UNAME), Darwin)
  	OS := macos
else ifeq ($(UNAME), Linux)
  	OS := linux
endif

all: install

install: $(OS)

.PHONY: macos linux

macos: brew stow
	bash $(DOTFILES_DIR)/os/macos/defaults.sh

linux: apt stow
	bash $(DOTFILES_DIR)/os/linux/defaults.sh

.PHONY: brew apt stow

brew:
	which brew > /dev/null && echo "Homebrew is already installed." || curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby
	brew bundle --file=$(DOTFILES_DIR)/os/macos/Brewfile

apt:
	bash $(DOTFILES_DIR)/os/linux/apt.sh

stow:
	stow vim
	stow git
	stow zsh
