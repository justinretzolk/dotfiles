###################################
# EDITOR and VISUAL               #
# Credit to GitHub user sudomateo #
###################################
#
if ( command -v nvim > /dev/null 2>&1 ); then
  export EDITOR=$(command -v nvim)
  export VISUAL=${EDITOR}
  alias vim='nvim'
elif ( command -v vim > /dev/null 2>&1 ); then
  export EDITOR=$(command -v vim)
  export VISUAL=${EDITOR}
elif ( command -v vi > /dev/null 2>&1 ); then
  export EDITOR=$(command -v vi)
  export VISUAL=${EDITOR}
fi

###############
# Environment #
###############

# XDG
export XDG_CONFIG_HOME="${HOME}/.config" # to make macos more XDG compliant

# go
export GOPATH="${HOME}/go"
export GOBIN="${GOPATH}/bin"
export PATH="${GOBIN}:${PATH}"

# ripgrep
export RIPGREP_CONFIG_PATH="${XDG_CONFIG_HOME}/rg/.ripgreprc"

# qmk
export QMK_HOME="~/github.com/justinretzolk/qmk_firmware"

################
# Autocomplete #
################

# init
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

# brew
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# hashicorp
complete -o nospace -C /usr/local/bin/vault vault
complete -o nospace -C /usr/local/bin/terraform terraform

#########################
# Aliases and Functions #
#########################

# general
alias l="ls -lAh"
alias pbc="pbcopy <"

# work
alias keymgmt="terraform-enterprise-keymgmt"

function tfctoken() {
  export TOKEN=$(jq -r '.credentials["app.terraform.io"].token' ~/.terraform.d/credentials.tfrc.json)
}

function bundle() {
  cd ~/Downloads
  process-bundle ~/Hashicorp/support-bundles
  cd ~/HashiCorp/support-bundles
}

function dump() {
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

############
# Starship #
############

eval "$(starship init zsh)"
