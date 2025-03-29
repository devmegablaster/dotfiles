{ config, pkgs, ... }:

let user = "ojastyagi"; in {
  imports = [
    ../../modules/shared
    ../../modules/darwin/home-manager.nix
  ];

  nix = {
    package = pkgs.nix;

    settings = {
      trusted-users = [ "root" "${user}" ];
      experimental-features = "nix-command flakes";
    };
  };

  environment = {
    systemPackages = import ../../modules/darwin/packages.nix { inherit pkgs; };
  };

  services = {
    skhd = {
      enable = true;
    };

    yabai = {
      enable = true;
    };
  };

  system = {
    stateVersion = 6;

    defaults = {
      dock = {
        autohide = true;
        persistent-apps = [
          "${pkgs.alacritty}/Applications/Alacritty.app"
          "${pkgs.obsidian}/Applications/Obsidian.app"
          "/Applications/Arc.app"
          "/System/Applications/Calendar.app"
        ];
        tilesize = 60;
        largesize = 75;
        magnification = true;
      };

      finder = {
        FXPreferredViewStyle = "clmv";
        AppleShowAllExtensions = true;
        _FXShowPosixPathInTitle = true;
        AppleShowAllFiles = true;
        FXEnableExtensionChangeWarning = false;
        FXDefaultSearchScope = "SCcf";
      };

      NSGlobalDomain = {
        AppleICUForce24HourTime = true;
        AppleInterfaceStyle = "Dark";
        KeyRepeat = 2;
        InitialKeyRepeat = 15;
      };

      trackpad = {
        Clicking = true;
      };

      loginwindow = {
        LoginwindowText = "devmegablaster";
      };

      # NOTE: Give full disk access to the terminal for this.
      universalaccess = {
        reduceMotion = true;
      };
    };

    startup = {
      chime = false;
    };
  };
}
