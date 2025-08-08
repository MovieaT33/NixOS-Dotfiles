{ config, ... }:

{
  nix.settings.allowed-users = [ "root" ];

  nix.settings = {
    substituters = [ "https://cache.nixos.org/" ];
    require-sigs = true;
  };
}