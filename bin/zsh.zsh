#!/bin/zsh

setup_zinit () {
    mkdir ~/.zinit
    git clone https://github.com/zdharma/zinit.git ~/.zinit/bin
}

setup_zsh () {
    setup_zinit
}
