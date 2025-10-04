{ home, pkgs, ... }:

{
  home.packages = with pkgs; [
    tldr
  ];

  programs.navi = {
    enable = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
  };
}