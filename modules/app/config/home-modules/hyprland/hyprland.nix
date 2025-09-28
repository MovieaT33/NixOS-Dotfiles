{ config, ... }:

{
  imports = [
    # Desktop apps
    ./hyprpaper.nix   # Wallpaper
    ./waybar.nix      # Bar
    ./hyprlock.nix    # Lock screen
    ./wofi.nix        # Menu

    # Apps
    ./kitty.nix       # Terminal
  ];

  home.file.".config/hypr" = {
    source = ../../dotfiles/hypr;
    recursive = true;
  };
}