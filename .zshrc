# Leaving this for now in case I run into any issues
# yay shell changes
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Theming
ZSH_THEME="robbyrussell"

# Plugins
plugins=(
  git,
  terraform,
  vagrant,
  thefuck,
  colored-man-pages,
  zsh-autosuggestions,
  zsh-syntax-highlighting
)

# Paths
export EDITOR="vim"
export MYVIMRC="$HOME/.dotfiles/.vimrc"
export VIMINIT="source $MYVIMRC"
export ZSH_CONFIG_ROOT="$HOME/.dotfiles/config/zsh"

# Load oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# We'll see how useful these things are...
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# Aliases
if [ -f $ZSH_CONFIG_ROOT/alias.zsh ]; then
  source $ZSH_CONFIG_ROOT/alias.zsh
fi

# ssh -- will experiment with this at a later date
# export SSH_KEY_PATH="~/.ssh/rsa_id"
