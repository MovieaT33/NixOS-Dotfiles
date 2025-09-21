{ home, pkgs, ... }:

{
  home.packages = with pkgs; [
    # c
    calc
    # t
    tldr
  ];
}