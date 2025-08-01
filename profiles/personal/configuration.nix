{ config, lib, pkgs, ... }:

{
  imports = [
    ../base/configuration.nix
    ../system/configuration.nix
    ../development/configuration.nix
    ../security/configuration.nix
    ../fun/configuration.nix
  ];

  environment.systemPackages = with pkgs; [
    atuin
    bat
    eza
    fd
    lf
    lolcat
    mprocs
    tldr
    tig
    tmux
    tokei
    tor
    tree
    wordgrinder
    yazi
    zoxide
  ];
}