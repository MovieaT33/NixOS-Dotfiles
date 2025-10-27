{ config, ... }:

{
  imports = [
    # Desktop apps
    ./hyprpaper.nix   # Wallpaper
    ./hyprlock.nix    # Lock screen
    ./swww.nix        # Wallpaper
    ./waybar.nix      # Bar
    ./wofi.nix        # Menu

    # Apps
    ./kitty.nix       # Terminal
  ];

  home.file.".config/hypr" = {
    source = ../../dotfiles/hypr;
    recursive = true;
  };
}