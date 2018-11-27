install_package () {
  sudo apt-get -y install $1;
}

# Install necessary packages
install_package "vim";
install_package "python";
install_package "python3";
install_package "git";
install_package "wget";
install_package "zsh";
install_package "curl";
install_package "tree";
