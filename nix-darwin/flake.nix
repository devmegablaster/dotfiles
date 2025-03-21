{
  description = "devmegablaster Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager}:
  let

    rPackagesOverlay = final: prev: {
      r-environment = prev.rWrapper.override {
        packages = with final.rPackages; [
          tm
          text2vec
          caret
          dplyr
          arrow
          data_table
          tidyverse
          text
          glmnet
          SnowballC
          class
          RPostgreSQL
        ];
      };
    };

    configuration = { pkgs, config, ... }: {

      nixpkgs.config.allowUnfree = true;

      nixpkgs.overlays = [ rPackagesOverlay ];

      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = with pkgs; [ 
          vim
          neovim
          #TODO: Switch to unstable karabiner after latest release of unstable
          # karabiner-elements
          tmux
          skhd
          yabai
          fzf
          gnupg
          lazygit
          k9s
          minikube
          mkalias
          ripgrep
          cloudflared

          poetry

          alacritty
          obsidian
          spotify

          postgresql
          redis
          ngrok

          pngpaste
          pandoc
          (texlive.combine {
             inherit (texlive) scheme-full;
          })

          templ
          air
          vhs
          goreleaser
          tailwindcss

          go
          nodejs_20
          pnpm
          cargo
          R
          r-environment

          docker
          gh
          btop
          git-remote-codecommit
          awscli2
        ];

      fonts.packages = [
        (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      ];

      system.activationScripts.applications.text = let
        env = pkgs.buildEnv {
          name = "system-applications";
          paths = config.environment.systemPackages;
          pathsToLink = "/Applications";
        };
      in
        pkgs.lib.mkForce ''
        # Set up applications.
        echo "setting up /Applications..." >&2
        rm -rf /Applications/Nix\ Apps
        mkdir -p /Applications/Nix\ Apps
        find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
        while read src; do
          app_name=$(basename "$src")
          echo "copying $src" >&2
          ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
        done
            '';

      security.pam.enableSudoTouchIdAuth = true;

      system.defaults = {

        # Dock
        dock.autohide = true;
        dock.persistent-apps = [
          "${pkgs.alacritty}/Applications/Alacritty.app"
          "${pkgs.obsidian}/Applications/Obsidian.app"
          "/Applications/Arc.app"
          "/System/Applications/Calendar.app"
        ];
        dock.tilesize = 60;
        dock.largesize = 75;
        dock.magnification = true;

        # Finder
        finder.FXPreferredViewStyle = "clmv";
        finder.AppleShowAllExtensions = true;
        finder._FXShowPosixPathInTitle = true;
        finder.AppleShowAllFiles = true;
        finder.FXEnableExtensionChangeWarning = false;
        finder.FXDefaultSearchScope = "SCcf";

        NSGlobalDomain.AppleICUForce24HourTime = true;
        NSGlobalDomain.AppleInterfaceStyle = "Dark";
        NSGlobalDomain.KeyRepeat = 2;

        # TODO: Fix this
        # universalaccess.reduceMotion = true;

        trackpad.Clicking = true;

        loginwindow.LoginwindowText = "devmegablaster";
      };

      system.startup.chime = false;

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;  # default shell on catalina
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      services.skhd.enable = true;
      services.yabai.enable = true;
      # TODO: Fix after latest unstable release fix for karabiner
      # services.karabiner-elements.enable = true;

      users.users.ojastyagi = {
        name = "ojastyagi";
        home = "/Users/ojastyagi";
      };

      homebrew.enable = true;

      homebrew.casks = [
        "karabiner-elements"
        "vlc"
      ];

      homebrew.brews = [
        "wakatime-cli"
        "cowsay"
        "jatt"
      ];
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."air" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        configuration
        home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.ojastyagi = import ./home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."air".pkgs;
  };
}
