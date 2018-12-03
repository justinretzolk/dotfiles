.PHONY: all osx linux homebrew homebrew-packages apt-packages osx-config linux-config stow

all:

osx: homebrew homebrew-packages stow osx-config

linux: apt-packages stow linux-config

homebrew:
	sh -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

homebrew-packages:
	./config/brew/install.sh

apt-packages:
	./config/apt/install.sh

stow:
	./config/stow/install.sh

osx-config:
	./config/os/osx/configure.sh

linux-config:
	./config/os/linux/configure.sh
