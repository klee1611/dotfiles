#!/usr/bin/env bash

check_and_install_brew() {
    local pkg_name=${1}
    echo "Checking and installing ${pkg_name}..."
    HOMEBREW_NO_AUTO_UPDATE=1 brew ls --version ${pkg_name} || \
        HOMEBREW_NO_AUTO_UPDATE=1 brew install ${pkg_name}
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
    brew_pkg_list=( "git" "nvm" "pyenv" "nvim" "pnpm" "asdf" "curl" "pipx" )
    for pkg in "${brew_pkg_list[@]}"; do
        check_and_install_brew $pkg
    done

    echo "Checking if gvm is installed..."
    if [ $(check_installed "gvm" "gvm") -eq 0 ]; then
        echo "Installing gvm and go..."
        bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
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
