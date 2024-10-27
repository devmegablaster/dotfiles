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
    ".zshrc".source = ~/dotfiles/zshrc;
    ".config/nix-darwin".source = ~/dotfiles/nix-darwin;
    ".config/tmux".source = ~/dotfiles/tmux;
  };

  home.sessionVariables = {
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.sessionPath = [
    "/run/current-system/sw/bin"
      "$HOME/.nix-profile/bin"
  ];
}
