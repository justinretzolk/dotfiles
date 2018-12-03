# Leaving this for now in case I run into any issues
# yay shell changes
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Theming
ZSH_THEME="robbyrussell"

# Paths
export EDITOR="vim"
export ZSH_CONFIG_ROOT="$HOME/.dotfiles/config/zsh"

# Load oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# We'll see how useful these things are...
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# Plugins
plugins=(
  git
)

# Aliases
if [ -f $ZSH_CONFIG_ROOT/alias.zsh ]; then
  source $ZSH_CONFIG_ROOT/alias.zsh
fi

# ssh -- will experiment with this at a later date
# export SSH_KEY_PATH="~/.ssh/rsa_id"
