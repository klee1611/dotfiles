#!/usr/bin/env bash
GITHUB_URL="https://github.com"

# Detect platform
is_wsl() { grep -qi microsoft /proc/version 2>/dev/null; }
is_macos() { [[ "$(uname)" == "Darwin" ]]; }

check_plugin_and_install() {
    local plugin_name=${1}
    local git_url=${2}
    local install_path="${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/${plugin_name}"

    echo "Checking and installing ${plugin_name}..."
    [ ! -d "${install_path}" ] && \
        git clone "${git_url}" "${install_path}"
}

install_autojump() {
    if is_macos; then
        echo "Installing autojump via Homebrew..."
        HOMEBREW_NO_AUTO_UPDATE=1 brew ls --version autojump 2>/dev/null || \
            HOMEBREW_NO_AUTO_UPDATE=1 brew install autojump
    else
        echo "Installing autojump via apt..."
        dpkg -s autojump &>/dev/null || sudo apt-get install -y autojump
    fi
}

main() {
    echo "Checking and setting up oh-my-zsh as default shell..."
    if [ ! -d ~/.oh-my-zsh ]; then
        sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" --unattended
    fi

    install_autojump

    plugin_list=("zsh-completions" "zsh-syntax-highlighting" "zsh-autosuggestions" "autoupdate")
    git_url_list=(
        "${GITHUB_URL}/zsh-users/zsh-completions.git"
        "${GITHUB_URL}/zsh-users/zsh-syntax-highlighting.git"
        "${GITHUB_URL}/zsh-users/zsh-autosuggestions.git"
        "${GITHUB_URL}/TamCore/autoupdate-oh-my-zsh-plugins.git"
    )
    for i in "${!plugin_list[@]}"; do
        check_plugin_and_install "${plugin_list[i]}" "${git_url_list[i]}"
    done

    echo "Checking and installing zsh asdf plugin..."
    [ ! -d "${HOME}/.asdf" ] && \
        git clone "${GITHUB_URL}/asdf-vm/asdf.git" ~/.asdf

    return 0
}

main
