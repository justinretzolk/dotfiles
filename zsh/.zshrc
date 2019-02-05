# Theming
ZSH_THEME="agnoster"
export DEFAULT_USER="justinretzolk"
prompt_context()

# Plugins
plugins=(
  git,
  terraform,
  vagrant,
  thefuck,
  colored-man-pages
)

# Paths
export EDITOR="vim"
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CONFIG_ROOT="$HOME/.dotfiles/config/zsh"
export GOPATH="${HOME}/.go"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# We'll see how useful these things are...
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"


# Aliases
if [ -f $ZSH_CONFIG_ROOT/alias.zsh ]; then
  source $ZSH_CONFIG_ROOT/alias.zsh
fi

if [ -f $ZSH_CONFIG_ROOT/work-alias.zsh ]; then
  source $ZSH_CONFIG_ROOT/work-alias.zsh
fi

# TODO: Figure out what the hell these were for...
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault
