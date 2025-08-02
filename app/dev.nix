{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # delta
    # difftastic
    # docker
    git
    # jless
    just
    # kondo
    # lazygit
    neovim
    # python314
    ripgrep
  ];
}