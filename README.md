# dotfiles

To install:
```bash
git clone --recurse-submodules https://github.com/justinretzolk/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
make osx
chsh -s $(which zsh)
```
Replace `osx` with `linux` where appropriate.
You will need to log out/back in in order to switch shells.

_Note: If you have a .zshrc or .vimrc, it will be moved to .zshrc-backup or .vimrc-backup, respectively_
