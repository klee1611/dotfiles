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

# Detect Homebrew prefix without spawning a subprocess
if [[ -x /opt/homebrew/bin/brew ]]; then
  HOMEBREW_PREFIX="/opt/homebrew"       # Apple Silicon
elif [[ -x /usr/local/bin/brew ]]; then
  HOMEBREW_PREFIX="/usr/local"          # Intel
else
  HOMEBREW_PREFIX="$(brew --prefix 2>/dev/null)"
fi

# NVM — lazy-load to avoid ~500ms startup penalty.
# nvm, node, npm, npx, and yarn will trigger a one-time load on first use.
export NVM_DIR="$HOME/.nvm"
_load_nvm() {
  unset -f nvm node npm npx yarn
  [ -s "${HOMEBREW_PREFIX}/opt/nvm/nvm.sh" ] && . "${HOMEBREW_PREFIX}/opt/nvm/nvm.sh"
  [ -s "${HOMEBREW_PREFIX}/opt/nvm/etc/bash_completion.d/nvm" ] && . "${HOMEBREW_PREFIX}/opt/nvm/etc/bash_completion.d/nvm"
}
nvm()  { _load_nvm; nvm  "$@"; }
node() { _load_nvm; node "$@"; }
npm()  { _load_nvm; npm  "$@"; }
npx()  { _load_nvm; npx  "$@"; }
yarn() { _load_nvm; yarn "$@"; }

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

