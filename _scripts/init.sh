#!/usr/bin/env bash

# Detect platform
is_wsl() { grep -qi microsoft /proc/version 2>/dev/null; }
is_macos() { [[ "$(uname)" == "Darwin" ]]; }

check_installed() {
    local pkg_cmd=$1
    command -v "${pkg_cmd}" &>/dev/null && echo 1 || echo 0
}

check_and_install_brew() {
    local pkg_name=$1
    local cask=${2:-false}
    echo "Checking and installing ${pkg_name} via Homebrew..."
    if [[ ${cask} == true ]]; then
        HOMEBREW_NO_AUTO_UPDATE=1 brew ls --version "${pkg_name}" 2>/dev/null || \
            HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask "${pkg_name}"
    else
        HOMEBREW_NO_AUTO_UPDATE=1 brew ls --version "${pkg_name}" 2>/dev/null || \
            HOMEBREW_NO_AUTO_UPDATE=1 brew install "${pkg_name}"
    fi
}

check_and_install_apt() {
    local pkg_name=$1
    echo "Checking and installing ${pkg_name} via apt..."
    dpkg -s "${pkg_name}" &>/dev/null || sudo apt-get install -y "${pkg_name}"
}

install_macos_packages() {
    local brew_pkg_list=("git" "nvm" "pyenv" "neovim" "pnpm" "asdf" "curl" "pipx" "wget" "ripgrep" "uv")
    for pkg in "${brew_pkg_list[@]}"; do
        check_and_install_brew "$pkg"
    done
    mkdir -p ~/.nvm
}

install_linux_packages() {
    sudo apt-get update -qq

    # Core tools available in apt
    local apt_pkg_list=("git" "curl" "wget" "ripgrep" "pipx" "unzip" "build-essential")
    for pkg in "${apt_pkg_list[@]}"; do
        check_and_install_apt "$pkg"
    done

    # Neovim — use the official PPA for a current release
    if [ "$(check_installed nvim)" -eq 0 ]; then
        echo "Installing Neovim via PPA..."
        sudo add-apt-repository -y ppa:neovim-ppa/unstable
        sudo apt-get update -qq
        sudo apt-get install -y neovim
    fi

    # nvm — installed via its own script, not apt
    mkdir -p ~/.nvm
    if [ "$(check_installed nvm)" -eq 0 ] && [ ! -s "${HOME}/.nvm/nvm.sh" ]; then
        echo "Installing nvm..."
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
    fi

    # pyenv — installed via its own installer
    if [ "$(check_installed pyenv)" -eq 0 ] && [ ! -d "${HOME}/.pyenv" ]; then
        echo "Installing pyenv..."
        curl -fsSL https://pyenv.run | bash
    fi

    # pnpm — installed via its own script
    if [ "$(check_installed pnpm)" -eq 0 ]; then
        echo "Installing pnpm..."
        curl -fsSL https://get.pnpm.io/install.sh | sh -
    fi

    # asdf — installed via git (same method as zsh_init.sh)
    if [ ! -d "${HOME}/.asdf" ]; then
        echo "Installing asdf..."
        git clone https://github.com/asdf-vm/asdf.git ~/.asdf
    fi

    # uv — installed via its own script
    if [ "$(check_installed uv)" -eq 0 ]; then
        echo "Installing uv..."
        curl -LsSf https://astral.sh/uv/install.sh | sh
    fi
}

install_gvm_and_go() {
    echo "Checking if gvm is installed..."
    if [ "$(check_installed gvm)" -eq 0 ] && [ ! -s "${HOME}/.gvm/scripts/gvm" ]; then
        echo "Installing gvm..."
        bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
    fi

    [[ -s "${HOME}/.gvm/scripts/gvm" ]] && source "${HOME}/.gvm/scripts/gvm"

    echo "Setting up Go version 1.25.7..."
    if ! gvm list | grep -q "go1.25.7"; then
        echo "Installing go1.25.7..."
        gvm install go1.25.7 -B
    fi
    gvm use go1.25.7 --default
    echo "Go version: $(go version)"
}

install_python() {
    echo "Installing python 3.10.0 via pyenv..."
    # Ensure pyenv is available in this shell
    export PYENV_ROOT="${HOME}/.pyenv"
    export PATH="${PYENV_ROOT}/bin:${PATH}"
    eval "$(pyenv init -)"

    pyenv install --skip-existing 3.10.0
    pyenv global 3.10.0
}

main() {
    if is_macos; then
        echo "Detected macOS — using Homebrew"
        install_macos_packages
    elif is_wsl; then
        echo "Detected WSL — using apt + standalone installers"
        install_linux_packages
    else
        echo "Detected Linux — using apt + standalone installers"
        install_linux_packages
    fi

    install_gvm_and_go
    install_python

    return 0
}

main
