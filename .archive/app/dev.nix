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
    tree
    # wordgrinder
    # python314
    # ripgrep
    # tokei
    # yazi
  ];
}