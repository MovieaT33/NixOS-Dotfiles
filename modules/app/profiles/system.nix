{ home, pkgs, ... }:

{
  home.packages = with pkgs; [
    screenfetch
  ];
}