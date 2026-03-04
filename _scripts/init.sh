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
    brew_pkg_list=( "git" "nvm" "pyenv" "nvim" "pnpm" "asdf" "curl" "pipx" "wget" "rg" "uv")
    for pkg in "${brew_pkg_list[@]}"; do
        check_and_install_brew $pkg
    done
	mkdir -p ~/.nvm

    echo "Checking if gvm is installed..."
    if [ $(check_installed "gvm" "gvm") -eq 0 ]; then
        echo "Installing gvm and go..."
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

    echo "Installing python 3.10.0..."
    pyenv install 3.10.0
    pyenv global 3.10.0

    return 0
}

main
