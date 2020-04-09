# theme
ZSH_THEME="spaceship"

# theme customization
export SPACESHIP_PROMPT_ADD_NEWLINE=false
export SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
export SPACESHIP_PROMPT_DEFAULT_PREFIX="using "
export SPACESHIP_CHAR_SYMBOL="$"
export SPACESHIP_CHAR_SUFFIX=" "
export SPACESHIP_DIR_TRUNC="0"
export SPACESHIP_DIR_PREFIX="cwd: "
export SPACESHIP_DIR_SUFFIX=" "
export SPACESHIP_GOLANG_SYMBOL="go "
export SPACESHIP_DOCKER_SYMBOL="docker "
export SPACESHIP_AWS_SYMBOL="aws "
export SPACESHIP_TERRAFORM_SYMBOL="terraform "

# plugins
plugins=(
  git
  terraform
  vagrant
  colored-man-pages
)

# env
export EDITOR="vim"
export DEFAULT_USER="justinretzolk"

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

