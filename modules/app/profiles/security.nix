{ home, pkgs, ... }:

{
  home.packages = with pkgs; [
    kpcli
  ];
}