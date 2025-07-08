#!/usr/bin/env bash

check_and_install_brew() {
    local pkg_name=${1}
    local cask=${2}
    echo "Checking and installing ${pkg_name}..."
    if [[ ${cask} == true ]]
    then
        HOMEBREW_NO_AUTO_UPDATE=1 brew ls --version ${pkg_name} || \
            HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask ${pkg_name}
    else
        HOMEBREW_NO_AUTO_UPDATE=1 brew ls --version ${pkg_name} || \
            HOMEBREW_NO_AUTO_UPDATE=1 brew install ${pkg_name}
    fi
}

check_installed() {
    local pkg_name=$1
    local pkg_cmd=$2
    if ! command -v ${pkg_cmd} &> /dev/null
    then
        echo 0
    else
        echo 1
    fi
}

main() {
    brew_pkg_list=( "git" "nvm" "pyenv" "nvim" "pnpm" "asdf" "curl" "pipx" "wget" "rg")
    for pkg in "${brew_pkg_list[@]}"; do
        check_and_install_brew $pkg
    done
	mkdir ~/.nvm

    check_and_install_brew "kitty" true
    if [ ! -d ~/.config/kitty/kitty-themes ]; then
        mkdir -p ~/.config/kitty/kitty-themes
        THEME=https://raw.githubusercontent.com/dexpota/kitty-themes/master/themes/Apprentice.conf
        wget "$THEME" -P ~/.config/kitty/kitty-themes/themes
    fi

    echo "Checking if gvm is installed..."
    if [ $(check_installed "gvm" "gvm") -eq 0 ]; then
        echo "Installing gvm and go..."
        bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
        [[ -s "${HOME}/.gvm/scripts/gvm" ]] && source "${HOME}/.gvm/scripts/gvm"
        gvm install go1.4 -B
        gvm use go1.4
        export GOROOT_BOOTSTRAP=$GOROOT
        gvm install go1.17.13
        gvm use go1.17.13
        export GOROOT_BOOTSTRAP=$GOROOT
        gvm install go1.20
        gvm use go1.20
    fi

    echo "Installing python 3.10.0..."
    pyenv install 3.10.0
    pyenv global 3.10.0

    echo "Installing pipx and poetry..."
    pipx ensurepath
    pipx install poetry

    return 0
}

main
