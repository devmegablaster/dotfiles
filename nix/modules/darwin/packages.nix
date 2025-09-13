{ pkgs }:

with pkgs;
let shared-packages = import ../shared/packages.nix { inherit pkgs; }; in
shared-packages ++ [
  # Utils and Management
  yabai
  skhd
  rar
  sketchybar
  sketchybar-app-font
]
