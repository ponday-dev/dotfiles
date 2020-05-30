#!/bin/zsh

link_karabiner_config() {
    for file in $1/karabiner/*; do
        local filename=$(basename $file)
        if [ -f $file ]; then
            link_to $file ~/.config/karabiner/$filename
        else
            if [ -e ~/.config/karabiner/$filename ]; then
                rm -rf ~/.config/karabiner/$filename
            fi
            link_to $file ~/.config/karabiner
        fi
    done
}

