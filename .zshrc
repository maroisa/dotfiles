# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install

# Setup zgen
if ! [ -d $HOME/.zgen ]; then
    git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
    curl "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/refs/heads/master/lib/key-bindings.zsh" >> $HOME/.zgen/key-bindings.zsh
fi

# config
source $HOME/.zgen/zgen.zsh
source /home/rin/.zgen/key-bindings.zsh

if ! zgen saved; then
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-autosuggestions

  zgen save
fi

export PROMPT=$'%F{cyan}%n@%m: %~ \n%F{white} > '
