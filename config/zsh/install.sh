# Install oh-my-zsh
 sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh::g')"

# Back up any current zshrc
if [ -f $HOME/.zshrc ]; then
  sudo mv $HOME/.zshrc $HOME/.zshrc-backup
fi

# Symlink the proper zshrc
ln -sf "$HOME/.dotfiles/.zshrc" "$HOME/.zshrc";
