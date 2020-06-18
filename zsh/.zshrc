# oh-my-zsh plugins
plugins=(
  colored-man-pages
  terraform
  vagrant
  zsh-syntax-highlighting
)

# env
export EDITOR="nvim"
export VISUAL="nvim"
export XDG_CONFIG_HOME="${HOME}/.config" # to make macos more XDG compliant

# go
export GOPATH="${HOME}/.go"
export GOBIN="${GOPATH}/bin"
export PATH="${GOBIN}:${PATH}"

# ripgrep
export RIPGREP_CONFIG_PATH="${XDG_CONFIG_HOME}/rg/.ripgreprc"

# oh-my-zsh
export ZSH="${HOME}/.oh-my-zsh"
export ZSH_CUSTOM="${HOME}/.dotfiles/zsh/custom"
source ${ZSH}/oh-my-zsh.sh

# nord colorscheme
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

# hashicorp autocomplete
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault
complete -o nospace -C /usr/local/bin/terraform terraform

# general aliases
alias vi="nvim"
alias vim="nvim"
alias l="ls -lAh"
alias pbc="pbcopy <"

# work functions
function bundle () {
  cd ~/Downloads
  process-bundle ~/Hashicorp/support-bundles
  cd ~/HashiCorp/support-bundles
}

function dump () {
  if  [[ -e master/replicated/internal/ledis-app.dump ]]; then
    ptfe-support-tool --dump-file master/replicated/internal/ledis-app.dump | jq '.'
  else
    jq '.' master/replicated/internal/app-config.json
  fi
}

# starship
eval "$(starship init zsh)"
