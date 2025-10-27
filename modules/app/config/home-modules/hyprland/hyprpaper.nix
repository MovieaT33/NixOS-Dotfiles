{ ... }:

{
  services.hyprpaper = {
    enable = true;
    preload = [ "/etc/nixos/assets/wallpapers/current.png" ];
    wallpaper = [ "Virtual-1, /etc/nixos/assets/wallpapers/current.png" ];
  };
}