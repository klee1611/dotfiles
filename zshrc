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
	autoupdate
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
  HOMEBREW_PREFIX="/opt/homebrew"                        # Apple Silicon
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  HOMEBREW_PREFIX="/usr/local"                           # Intel Mac
elif [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"           # Linux / WSL
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
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

# GVM — source default Go environment eagerly so `go` is in PATH for all
# processes; lazy-load the full gvm script only on first use of gvm command
if [[ -s "${HOME}/.gvm/environments/default" ]]; then
  source "${HOME}/.gvm/environments/default"
fi
_load_gvm() {
  unset -f gvm
  [[ -s "${HOME}/.gvm/scripts/gvm" ]] && source "${HOME}/.gvm/scripts/gvm"
}
gvm() { _load_gvm; gvm "$@"; }

# poetry
export PATH="${HOME}/.local/bin:${PATH}"

export PATH="/usr/local/bin:$PATH"

# pnpm
export PNPM_HOME="${HOME}/Library/pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Google Cloud SDK (macOS default location; on Linux it is the same)
if [ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/completion.zsh.inc"; fi
# Google Cloud SDK — Snap install path (common on Ubuntu/WSL)
if [ -f "/snap/google-cloud-cli/current/path.zsh.inc" ]; then . "/snap/google-cloud-cli/current/path.zsh.inc"; fi
if [ -f "/snap/google-cloud-cli/current/completion.zsh.inc" ]; then . "/snap/google-cloud-cli/current/completion.zsh.inc"; fi

# Load aliases and functions
source ~/.config/zsh/aliases
source ~/.config/zsh/zsh_functions
source ~/.config/zsh/load_secrets

#export CLAUDE_CODE_USE_OPENAI=1
#export OPENAI_BASE_URL="http://desktop-7fhnqhc:11434/v1"
#export OPENAI_MODEL=qwen2.5-coder:7b
#export OPENAI_MODEL=llama3.1
