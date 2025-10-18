export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="agnoster"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Skip insecure directories checking
# ZSH_DISABLE_COMPFIX="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	zsh-completions
	zsh-syntax-highlighting
	zsh-autosuggestions
	git
	autojump
    autoupdate
    asdf
)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh

# User configuration
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi


export EDITOR='nvim'

# NVM
export NVM_DIR="$HOME/.nvm"
HOMEBREW_PREFIX=${HOMEBREW_PREFIX:-"$(brew --prefix 2>/dev/null)"}
[ -s "${HOMEBREW_PREFIX}/opt/nvm/nvm.sh" ] && . "${HOMEBREW_PREFIX}/opt/nvm/nvm.sh"  # This loads nvm
[ -s "${HOMEBREW_PREFIX}/opt/nvm/etc/bash_completion.d/nvm" ] && . "${HOMEBREW_PREFIX}/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# pyenv
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:${HOME}/go/bin:$PATH"
eval "$(pyenv init --path)"
#eval "$(pyenv init -)"
#
# pipenv
#export LANG=en_US.UTF-8

# protoc & poetry
#export PATH="$PATH:$(go env GOPATH)/bin:${HOME}/.local/bin"

# poetry
export PATH="${HOME}/.local/bin:${PATH}"


#export PATH="/usr/local/bin:/usr/local/opt/libpq/bin:/usr/local/opt/mysql-client/bin:/usr/local/opt/make/libexec/gnubin:$PATH"

#  GVM
[[ -s "${HOME}/.gvm/scripts/gvm" ]] && source "${HOME}/.gvm/scripts/gvm"

# pnpm
export PNPM_HOME="${HOME}/Library/pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# asdf
#. /usr/local/opt/asdf/libexec/asdf.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/completion.zsh.inc"; fi

# Load aliases and functions
source ~/.config/zsh/aliases
source ~/.config/zsh/zsh_functions

[[ -s "${HOME}/.gvm/scripts/gvm" ]] && source "${HOME}/.gvm/scripts/gvm"
