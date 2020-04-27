# theme
ZSH_THEME="spaceship"

# plugins
plugins=(
  colored-man-pages
  git
  ripgrep
  terraform
  vagrant
  vagrant-prompt
  web-search
  z
  zsh-interactive-cd
  zsh-abbr
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# env
export EDITOR="vim"

# go
export GOPATH="${HOME}/.go"
export GOBIN="${GOPATH}/bin"
export PATH="${GOBIN}:${PATH}"

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.dotfiles/zsh/custom"
source $ZSH/oh-my-zsh.sh

# HashiCorp Autocomplete
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault
complete -o nospace -C /usr/local/bin/terraform terraform
