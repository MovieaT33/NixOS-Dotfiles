{ stateVersion, pkgs, ... }:

let
  username = "mvt33";
in
{
  home = {
    inherit stateVersion;
    username = username;
    homeDirectory = "/home/${username}";
  };
}