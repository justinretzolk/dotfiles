# Theming
ZSH_THEME="spaceship"
export DEFAULT_USER="justinretzolk"
prompt_context()

# Plugins
plugins=(
  git,
  terraform,
  vagrant,
  colored-man-pages,
  zsh-syntax-highlighting
)

# Settings defaults
export EDITOR="vim"
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CONFIG_ROOT="$HOME/.dotfiles/zsh/extras"
export ZSH_CUSTOM="$HOME/.dotfiles/zsh/custom"

# Go settings
export GOPATH="${HOME}/.go"
export GOBIN="${GOPATH}/bin"
export PATH="${GOBIN}:${PATH}"

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
complete -o nospace -C /usr/local/bin/terraform terraform

