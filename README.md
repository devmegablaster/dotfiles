# 🚀 devmegablaster's Dotfiles

![Nix](https://img.shields.io/badge/Nix-5277C3?style=for-the-badge&logo=nixos&logoColor=white)
![macOS](https://img.shields.io/badge/macOS-000000?style=for-the-badge&logo=apple&logoColor=white)
![Neovim](https://img.shields.io/badge/Neovim-57A143?style=for-the-badge&logo=neovim&logoColor=white)
![Tmux](https://img.shields.io/badge/tmux-1BB91F?style=for-the-badge&logo=tmux&logoColor=white)

A meticulously crafted development environment powered by Nix and nix-darwin, designed for maximum productivity and minimal friction.

## ✨ Features

- **Declarative Setup**: Your entire system configuration defined as code
- **Cross-Platform**: Configured for both macOS (Darwin) and NixOS systems
- **Homebrew Integration**: Seamless integration with Homebrew via nix-homebrew
- **Modern Terminal**: Alacritty + Tmux + Neovim for a powerful CLI experience
- **Window Management**: Yabai for tiling window management with skhd keybindings
- **Developer Tools**: Comprehensive collection of development utilities

## 📦 What's Inside?

### Core Tools

- Shell Environment: Zsh with custom configurations
- Terminal: Alacritty terminal emulator
- Text Editor: Neovim configuration
- Terminal Multiplexer: Tmux setup
- Git Workflow: Lazygit and custom Git configurations

### System Management

- Window Management: Yabai (tiling window manager)
- Keyboard: Skhd (hotkey daemon) and Karabiner (keyboard customization)
- System Configuration: Nix and nix-darwin for declarative setup

### Development Environment

- Languages & Toolchains: Configuration for various programming languages
- Infrastructure: Docker, Kubernetes (k9s), AWS tooling
- Databases: Database clients and tools

## 🛠️ Installation

### Prerequisites

- [Nix](https://nixos.org/download.html) package manager
- macOS or NixOS

### Setup Steps

1. **Clone the repository**

```bash
git clone https://github.com/devmegablaster/dotfiles ~/dotfiles
```

2. **Install Nix** (if not already installed)

```bash
sh <(curl -L https://nixos.org/nix/install)
```

3. **For macOS**:

```bash
nix run ~/dotfiles/nix#build-switch
```

> [!NOTE]
> You need to give Full Disk Access to the Terminal you are using to run the script.

This will:
- Build the configuration
- Switch to the new generation
- Link all dotfiles to appropriate locations

## 🧩 Structure

```
└── dotfiles/
    ├── README.md
    ├── alacritty/        # Terminal configuration
    ├── bin/              # Custom scripts
    ├── karabiner/        # Keyboard customization
    ├── neofetch/         # System info display
    ├── nix/              # Nix configuration
    │   ├── flake.nix     # Main entry point
    │   └── ...
    ├── nvim/             # Neovim configuration
    ├── skhd/             # Hotkey daemon
    ├── tmux/             # Terminal multiplexer
    ├── yabai/            # Window manager
    └── zsh/              # Shell configuration
```

## 🔧 Customization

The configurations are organized into modules:

- `nix/modules/darwin/`: macOS-specific configurations
- `nix/modules/shared/`: Common configurations shared across platforms

Modify these files to customize your setup according to your preferences.

## 📝 License

Released under the MIT License.

---

<p align="center">
  Created with ❤️ by <a href="https://github.com/devmegablaster">@devmegablaster</a>
</p>
