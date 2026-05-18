## About
**This is my own dotfiles**

contains:
- zsh (.zshrc, prezto, powerlevel10k)
- Kvantum (customized WhiteSur Dark and Sweet-Ambar-Blue)
- kitty
- emacs
- fastfetch

## Setup

1. install [chezmoi](https://www.chezmoi.io/install/)
2. initialize my dotfiles

```bash
chezmoi init https://github.com/maroisa/dotfiles.git
```

3. apply the dotfiles

```bash
chezmoi apply
```


## Alternative Setup

just copy the dotfiles manually, or initialize chezmoi and dotfiles with one command:

```bash
sh -c "$(curl -fsLS https://get.chezmoi.io/lb)" -- init --apply maroisa
```
