# Dotfiles

This repository contains my personal dotfiles.

## Setup

You can clone the repo and use the dotfiles using [Nix](https://nixos.org/)

1. Clone the repository

```bash
git clone https://github.com/devmegablaster/dotfiles ~/dotfiles
```

2. Install Nix

```bash
sh <(curl -L https://nixos.org/nix/install)
```

3. Use nix-darwin to use the flake

```bash
darwin-rebuild switch --flake ~/dotfiles/nix-darwin#air --impure
```
