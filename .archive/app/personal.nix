{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # General
    inetutils
    # mprocs
    tty-clock

    # Hyprland
    # kitty
  ];
}