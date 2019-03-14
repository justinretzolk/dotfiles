backup_config () {
	if [ -f $HOME/$1 ]; then
		sudo mv $HOME/$1 $HOME/$1-backup;
	fi
}

init_stow () {
	stow $1;
}

echo "Backing up existing '.zshrc'"
backup_config ".zshrc";

echo "Backing up existing '.vimrc'"
backup_config ".vimrc";

init_stow "vim";
init_stow "zsh";
