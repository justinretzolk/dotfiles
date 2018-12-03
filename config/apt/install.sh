install_package () {
  sudo apt-get -y install $1;
}

install_pip () {
  sudo pip3 install $1;
}

# Install necessary packages
install_package "stow";
install_package "vim";
install_package "python";
install_package "python3";
install_package "python3-dev";
install_package "python3-pip";
install_package "python3-setuptools";
install_package "git";
install_package "wget";
install_package "zsh";
install_package "curl";
install_package "tree";

# pip install
install_pip "thefuck";
