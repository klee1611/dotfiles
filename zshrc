export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="agnoster"

HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	zsh-completions
	zsh-syntax-highlighting
	zsh-autosuggestions
	git
	autojump
	asdf
)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'
export VISUAL='nvim'

# Detect Homebrew prefix without spawning a subprocess
if [[ -x /opt/homebrew/bin/brew ]]; then
  HOMEBREW_PREFIX="/opt/homebrew"       # Apple Silicon
elif [[ -x /usr/local/bin/brew ]]; then
  HOMEBREW_PREFIX="/usr/local"          # Intel
else
  HOMEBREW_PREFIX="$(brew --prefix 2>/dev/null)"
fi

# NVM — add default node's bin to PATH immediately so node/npm/npx are
# available to all processes (including editors like nvim). The full NVM
# shell integration is lazy-loaded on first use of the 'nvm' command.
export NVM_DIR="$HOME/.nvm"
if [[ -f "$NVM_DIR/alias/default" ]]; then
  _nvm_ver=$(cat "$NVM_DIR/alias/default")
  # Resolve indirect aliases (e.g. lts/* -> lts/iron -> v20.x.x)
  while [[ -f "$NVM_DIR/alias/$_nvm_ver" ]]; do
    _nvm_ver=$(cat "$NVM_DIR/alias/$_nvm_ver")
  done
  [[ -d "$NVM_DIR/versions/node/$_nvm_ver/bin" ]] && \
    export PATH="$NVM_DIR/versions/node/$_nvm_ver/bin:$PATH"
  unset _nvm_ver
fi
_load_nvm() {
  unset -f nvm
  [ -s "${HOMEBREW_PREFIX}/opt/nvm/nvm.sh" ] && . "${HOMEBREW_PREFIX}/opt/nvm/nvm.sh"
  [ -s "${HOMEBREW_PREFIX}/opt/nvm/etc/bash_completion.d/nvm" ] && . "${HOMEBREW_PREFIX}/opt/nvm/etc/bash_completion.d/nvm"
}
nvm() { _load_nvm; nvm "$@"; }

# pyenv — prepend shims directly instead of eval "$(pyenv init --path)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"

# GVM — lazy-load; sourced on first use of gvm or go
_load_gvm() {
  unset -f gvm go
  [[ -s "${HOME}/.gvm/scripts/gvm" ]] && source "${HOME}/.gvm/scripts/gvm"
}
gvm() { _load_gvm; gvm "$@"; }
go()  { _load_gvm; go  "$@"; }

# poetry
export PATH="${HOME}/.local/bin:${PATH}"

export PATH="/usr/local/bin:$PATH"

# pnpm
export PNPM_HOME="${HOME}/Library/pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Google Cloud SDK
if [ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/completion.zsh.inc"; fi

# Load aliases and functions
source ~/.config/zsh/aliases
source ~/.config/zsh/zsh_functions
source ~/.config/zsh/load_secrets

