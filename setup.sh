#!/bin/sh

if [ -d $HOME/.zgen ]; then
    echo "Directory Exist!"
else
    git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
    curl "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/refs/heads/master/lib/key-bindings.zsh" >> $HOME/.zgen/key-bindings.zsh
fi

