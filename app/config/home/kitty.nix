{ config, pkgs, ... }:

let
  catppuccinKitty = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/kitty/main/themes/mocha.conf";
    sha256 = "0000000000000000000000000000000000000000000000000000";
  };
in
{
  home.packages = with pkgs; [
    kitty
  ];

  home.file.".config/kitty/kitty.conf".source = ../dotfiles/kitty.conf;

  programs.kitty = {
    enable = true;
    extraConfig = ''
      include ${catppuccinKitty}
    '';
  };
}
