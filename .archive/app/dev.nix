{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # delta
    # difftastic
    # docker
    # jless
    # kondo
    # lazygit
    # lf
    ranger
    # tig
    # wordgrinder
    # python314
    # tokei
    # yazi
  ];
}