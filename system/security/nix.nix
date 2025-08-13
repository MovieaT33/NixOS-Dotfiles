{ config, ... }:

{
  nix.settings.allowed-users = [ "root" "mvt33" ];

  nix.settings = {
    substituters = [ "https://cache.nixos.org/" ];
    require-sigs = true;
  };
}