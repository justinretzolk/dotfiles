# theme
ZSH_THEME="spaceship"

# plugins
plugins=(
  colored-man-pages
  terraform
  vagrant
  zsh-syntax-highlighting
)

# env
export EDITOR="nvim"
export VISUAL="nvim"
export XDG_CONFIG_HOME="${HOME}/.config" # to make macos XDG compliant

# go
export GOPATH="${HOME}/.go"
export GOBIN="${GOPATH}/bin"
export PATH="${GOBIN}:${PATH}"

# oh-my-zsh
export ZSH="${HOME}/.oh-my-zsh"
export ZSH_CUSTOM="${HOME}/.dotfiles/zsh/custom"
source ${ZSH}/oh-my-zsh.sh

# ripgrep
export RIPGREP_CONFIG_PATH="${XDG_CONFIG_HOME}/rg/.ripgreprc"

# hashicorp autocomplete
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault
complete -o nospace -C /usr/local/bin/terraform terraform

# aliases
alias vi="nvim"
alias vim="nvim"
alias l="ls -lAh"
alias pbc="pbcopy <"
alias reload="source ~/.zshrc"
alias bundle='cd ~/Downloads/; process-bundle ~/HashiCorp/support-bundles/; cd ~/HashiCorp/support-bundles/'
alias dump='if [[ -e master/replicated/internal/ledis-app.dump ]]; then ptfe-support-tool --dump-file master/replicated/internal/ledis-app.dump | jq .; else jq . master/replicated/internal/app-config.json; fi'
