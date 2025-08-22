{ config, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    package = pkgs.hyprpaper;
    settings = {
      wallpaper = [
        "Virtual-1, /etc/nixos/img/Alps - 1920x1200.jpg"
      ];
    };
  };
}