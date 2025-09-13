{ config, pkgs, ... }:

let
  name = "devmegablaster";
  email = "devmegablaster@gmail.com";
in
{

  # Git config
  git = {
    enable = true;
    userName = name;
    userEmail = email;
    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "nvim";
      commit.gpgSign = true;
    };
  };
}
