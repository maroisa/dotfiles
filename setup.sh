#!/bin/sh

git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

curl "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/refs/heads/master/lib/key-bindings.zsh" >> $HOME/.zgen/key-bindings.zsh

echo "source $HOME/.zgen/key-bindings.zsh" >> $HOME/.zshrc
