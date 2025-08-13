{ config, ... }:

{
  home.file.".config/hypr/hyprland.conf".text = ''
    monitor=,1920x1200,0,1.6
  '';
}