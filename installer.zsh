#!/bin/zsh

for script in ./bin/*.zsh; do
    . $script
done

if [ $# = 0 ]; then
    install
elif [ $# = 1 ]; then
    case $1 in
        "--install" ) install ;;
        "--setup" ) setup ;;
    esac
fi
