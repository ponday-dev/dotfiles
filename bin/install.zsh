#!/bin/zsh
set -eu

local current_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd -P)
local repo_dir=$(dirname $current_dir)

install () {
    for file in $repo_dir/.??*; do
        local filename=$(basename $file)

        [[ $filename == ".git" ]] && continue
        [[ $filename == ".DS_Store" ]] && continue

        link_to $file ~/$filename
    done

    link_vim_config $repo_dir
}
