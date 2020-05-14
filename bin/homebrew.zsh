#!/bin/zsh

local formula=(
    "asdf"
    "autoconf"
    "automake"
    "fzf"
    "jq"
    "ripgrep"
    "tig"
    "zsh"
    "tmux"
)

setup_homebrew () {
    exec /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
}

setup_formula () {
    brew install $formula
}
