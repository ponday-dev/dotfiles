#!/bin/zsh

link_vim_config () {
    for file in $1/vim/*; do
        local filename=$(basename $file)
        link_to $file ~/.vim/$filename
    done
}

setup_vim () {
    # see https://github.com/Shougo/dein.vim
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh ./installer.sh ~/.cache/dein

    echo -e "\e[38;5;112m\e[1mShougo/dein installed !!\e[m

> Finally open the vim and type command '\e[38;5;166m:call dein#install()\e[m'.
"

}
