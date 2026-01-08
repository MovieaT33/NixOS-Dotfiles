{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    difftastic
    jless
    kondo
    lf
    tig
    wordgrinder
    python314
    tokei
  ];
}