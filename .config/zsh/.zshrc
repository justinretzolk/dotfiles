# env
export XDG_CONFIG_HOME="${HOME}/.config" # to make macos more XDG compliant

# term
export TERM=screen-256color

# Configure EDITOR and VISUAL in order of preference.
# Credit to GitHub user sudomateo
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

# tfswitch
export PATH="${HOME}/bin:${PATH}"

# oh-my-zsh
plugins=(
	terraform
)

export ZSH="${XDG_CONFIG_HOME}/zsh/oh-my-zsh"
export ZSH_CUSTOM="${XDG_CONFIG_HOME}/zsh/custom"
source ${ZSH}/oh-my-zsh.sh

# go
export GOBIN="${HOME}/go/bin"
export PATH="${GOBIN}:${PATH}"

# qmk
export QMK_HOME="~/github.com/justinretzolk/qmk_firmware"

# starship
eval "$(starship init zsh)"
