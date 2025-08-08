{ config, ... }:

{
  imports = [
    ./modules/config.nix
    ./security/config.nix
    ./app.nix
  ];
}