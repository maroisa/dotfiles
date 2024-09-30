# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install

source $HOME/.zgen/zgen.zsh

if ! zgen saved; then
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-autosuggestions

  zgen save
fi

source /home/rin/.zgen/key-bindings.zsh
