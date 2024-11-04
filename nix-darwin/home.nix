{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ojastyagi";
  home.homeDirectory = "/Users/ojastyagi";
  
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # For packages that are not required system-wide
  home.packages = [];

  # Home Manage pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/nvim".source = ~/dotfiles/nvim;
    ".config/nix-darwin".source = ~/dotfiles/nix-darwin;
    ".config/tmux".source = ~/dotfiles/tmux;
    ".config/karabiner".source = ~/dotfiles/karabiner;
    ".config/alacritty".source = ~/dotfiles/alacritty;
    ".config/neofetch".source = ~/dotfiles/neofetch;
    "bin".source = ~/dotfiles/bin;
    ".skhdrc".source = ~/dotfiles/skhd/.skhdrc;
    ".yabairc".source = ~/dotfiles/yabai/.yabairc;
    ".zshrc".source = ~/dotfiles/zsh/.zshrc;
    ".p10k.zsh".source = ~/dotfiles/zsh/.p10k.zsh;
  };

  home.sessionVariables = {
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.sessionPath = [
    "/run/current-system/sw/bin"
      "$HOME/.nix-profile/bin"
  ];

  # TODO: Fix Later!
  home.enableNixpkgsReleaseCheck = false;
}
