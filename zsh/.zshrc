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
  zsh-syntax-highlighting
)

# Settings defaults
export EDITOR="vim"
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CONFIG_ROOT="$HOME/.dotfiles/zsh/extras"

# Go settings
export GOPATH="${HOME}/.go"
export PATH="$PATH:${GOPATH}/bin"

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Standard aliases
if [ -f $ZSH_CONFIG_ROOT/alias.zsh ]; then
  source $ZSH_CONFIG_ROOT/alias.zsh
fi

# Work specific aliases
if [ -f $ZSH_CONFIG_ROOT/work-alias.zsh ]; then
  source $ZSH_CONFIG_ROOT/work-alias.zsh
fi

# HashiCorp Autocomplete
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault
complete -o nospace -C /usr/local/Cellar/terraform/0.11.13/bin/terraform terraform

