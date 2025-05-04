{ pkgs, ... }:

with pkgs; [
  # Dev
  alacritty
  neovim
  tmux
  lazygit
  k9s
  minikube
  ripgrep
  cloudflared
  poetry
  postgresql
  ngrok
  redis
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
  docker
  gh
  git-remote-codecommit
  awscli2
  kcat
  postman
  fzf
  gnupg
  cowsay
  wakatime-cli
  nixpkgs-fmt
  stripe-cli
  python310
  localstack
  minio
  minio-client
  rustc

  # Utils and management
  btop

  # Productivity
  obsidian

  # Entertainment
  spotify

  # Misc
  rclone
]
