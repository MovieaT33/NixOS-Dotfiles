{ ... }:

{
  nix.settings = {
    allowed-users = [ "root" "mvt33" ];

    substituters = [ "https://cache.nixos.org/" ];
    require-sigs = true;
  };
}