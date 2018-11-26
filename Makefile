.PHONY: all osx linux homebrew homebrew-packages apt-packages osx-config linux-config vim-plug oh-my-zsh

all:

osx: homebrew homebrew-packages vim-plug oh-my-zsh osx-config

linux: apt-packages vim-plug oh-my-zsh linux-config

homebrew:
	sh -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

homebrew-packages:
	./config/brew/install.sh

apt-packages:
	./config/apt/install.sh

vim-plug:
	./config/vim/install.sh

oh-my-zsh:
	./config/zsh/install.sh

osx-config:
	./config/os/osx/configure.sh

linux-config:
	./config/os/linux/configure.sh
