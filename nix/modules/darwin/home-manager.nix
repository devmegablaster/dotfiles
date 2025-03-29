{ config, pkgs, lib, home-manager, ... }:

let
  user = "ojastyagi";
in
{
  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
    shell = pkgs.zsh;
  };

  homebrew = {
    enable = true;
    casks = pkgs.callPackage ./casks.nix { };
  };

  home-manager = {
    useGlobalPkgs = true;
    users.${user} = { pkgs, config, lib, ... }: {
      home = {
        username = user;
        homeDirectory = "/Users/" + user;

        stateVersion = "24.05";

        # Dotfiles
        file = {
          ".config/nvim".source = /Users/${user}/dotfiles/nvim;
          ".config/nix".source = /Users/${user}/dotfiles/nix;
          ".config/tmux".source = /Users/${user}/dotfiles/tmux;
          ".config/karabiner".source = /Users/${user}/dotfiles/karabiner;
          ".config/alacritty".source = /Users/${user}/dotfiles/alacritty;
          ".config/neofetch".source = /Users/${user}/dotfiles/neofetch;
          "bin".source = /Users/${user}/dotfiles/bin;
          ".skhdrc".source = /Users/${user}/dotfiles/skhd/.skhdrc;
          ".yabairc".source = /Users/${user}/dotfiles/yabai/.yabairc;
          ".zshrc".source = /Users/${user}/dotfiles/zsh/.zshrc;
          ".p10k.zsh".source = /Users/${user}/dotfiles/zsh/.p10k.zsh;
        };

        sessionPath = [
          "/run/current-system/sw/bin"
          "$HOME/.nix-profile/bin"
        ];

        enableNixpkgsReleaseCheck = false;
      };

      programs = { } // import ../shared/home-manager.nix { inherit pkgs config lib; };
    };
  };
}
