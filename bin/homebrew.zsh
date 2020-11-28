#!/bin/zsh

local formula=(
    "asdf"
    "autoconf"
    "automake"
    "gpg" # required asdf-nodejs
    "fzf"
    "jq"
    "ripgrep"
    "tig"
    "zsh"
    "tmux"
    "ghq"
    "hub"
    "vim"
)

setup_homebrew () {
    exec /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
}

setup_formula () {
    brew install $formula
}

