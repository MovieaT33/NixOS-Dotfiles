{ stateVersion, ... }:

let
  username = "mvt33";
in
{
  home = {
    inherit stateVersion;
    username = username;
    homeDirectory = "/home/${username}";
  };

  imports = [
    ../../app/profiles/dev-home.nix
    ../../app/config/home/hyprland.nix
  ];
}