# oh-my-zsh plugins
plugins=(
  colored-man-pages
  kubectl
  terraform
  vagrant
  zsh-syntax-highlighting
)

# env
export XDG_CONFIG_HOME="${HOME}/.config" # to make macos more XDG compliant

# Configure EDITOR and VISUAL in order of preference.
# Credit to GitHub user sudomateo
if ( command -v nvim > /dev/null 2>&1 ); then
  EDITOR=$(command -v nvim)
  VISUAL=${EDITOR}
  alias vim='nvim'
elif ( command -v vim > /dev/null 2>&1 ); then
  EDITOR=$(command -v vim)
  VISUAL=${EDITOR}
elif ( command -v vi > /dev/null 2>&1 ); then
  EDITOR=$(command -v vi)
  VISUAL=${EDITOR}
fi

# go
export GOPATH="${HOME}/go"
export GOBIN="${GOPATH}/bin"
export PATH="${GOBIN}:${PATH}"

# ripgrep
export RIPGREP_CONFIG_PATH="${XDG_CONFIG_HOME}/rg/.ripgreprc"

# oh-my-zsh
export ZSH="${XDG_CONFIG_HOME}/zsh/oh-my-zsh"
export ZSH_CUSTOM="${XDG_CONFIG_HOME}/zsh/custom"
# come back to this and see about eliminating $ZSH entirely
source ${ZSH}/oh-my-zsh.sh

# nord colorscheme
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

# qmk
export QMK_HOME="~/github.com/justinretzolk/qmk_firmware"

# hashicorp autocomplete
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault
complete -o nospace -C /usr/local/bin/terraform terraform

# general aliases
alias l="ls -lAh"
alias pbc="pbcopy <"

# work functions and aliases
alias keymgmt="terraform-enterprise-keymgmt"

function bundle () {
  cd ~/Downloads
  process-bundle ~/Hashicorp/support-bundles
  cd ~/HashiCorp/support-bundles
}

function dump () {
  if [[ -d primary ]]; then

    if  [[ -e primary/replicated/internal/ledis-app.dump ]]; then
      echo "[primary] Using the dump file"
      ptfe-support-tool --dump-file primary/replicated/internal/ledis-app.dump | jq '.'
    else
      echo "[primary] Using the app-config file"
      jq '.' primary/replicated/internal/app-config.json
    fi

  elif [[ -d master ]]; then

    if  [[ -e master/replicated/internal/ledis-app.dump ]]; then
      echo "[master] Using the dump file"
      ptfe-support-tool --dump-file master/replicated/internal/ledis-app.dump | jq '.'
    else
      echo "[master] Using the app-config file"
      jq '.' master/replicated/internal/app-config.json
    fi

  else

    echo "Neither the primary nor master directories exist"

  fi
}

# starship
eval "$(starship init zsh)"
