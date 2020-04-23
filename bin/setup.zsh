#!/bin/zsh

setup_zsh_postproc () {
    local brew_prefix=$(brew --prefix)
    echo -e "
If you want to use zsh installed via Homebrew, please do the following:
1. Edit hosts file. Run '\e[38;5;166msudo vim /etc/hosts\e[m' and write '\e[38;5;166m${brew_prefix}/bin/zsh\e[m' at the bottom.
2. Change login shell. Run '\e[38;5;166mchsh -s ${brew_prefix}/bin/zsh\e[m'"
}

setup () {
    echo "setup homebrew...\n"

    setup_homebrew
    setup_formula
    setup_vim

    echo "\e[38;5;112m\e[1msetup completed !!\e[m"

    setup_zsh_postproc
}
