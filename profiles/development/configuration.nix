{ config, libs, pkgs, ... }:

{
  environment.systemPackages = [
    delta
    difftastic
    docker
    git
    jless
    just
    kondo
    lazygit
    neovim
    python314
    ripgrep
  ];
}