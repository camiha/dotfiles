#!/bin/zsh
set -eu
DOTFILES_PATH=$(cd $(dirname $0); pwd)

for i in .??*; do
    [ $i == ".git" ] && continue
    [ $i == ".gitignore" ] && continue
    [ $i == ".DS_Store" ] && continue
    if [ -d "$DOTFILES_PATH/$i" ]; then
        for j in $DOTFILES_PATH/$i/*; do
            if [ -d "$j" ]; then
                mkdir -p ~/$(basename $j)
            fi
            ln -snfv "$j" ~/$(basename $i)/$(basename $j)
        done
    else
        ln -snf "${DOTFILES_PATH}"/"$i" ~/"$i"
    fi
done