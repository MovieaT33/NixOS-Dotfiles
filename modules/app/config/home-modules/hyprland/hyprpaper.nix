{ ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "/etc/nixos/assets/wallpapers/current.png" ];
      wallpaper = [ "Virtual-1, /etc/nixos/assets/wallpapers/current.png" ];
    };
  };
}