install_brew () {
  brew install $1;
}

install_cask () {
  brew cask install $1;
}

# Prepare cask
brew tap caskroom/cask

# Install via brew
install_brew "vim";
install_brew "python";
install_brew "python3";
install_brew "git";
install_brew "wget";
install_brew "zsh";
install_brew "curl";
install_brew "tree";
install_brew "thefuck";

# Install via cask
install_cask "1password";
install_cask "slack";
install_cask "iterm2";
install_cask "docker";
install_cask "spotify";
install_cask "appcleaner";
install_cask "caffeine";

