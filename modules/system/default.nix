{ ... }:

{
  imports = [
    ./boot/default.nix
    ./modules/default.nix
    ./security/default.nix

    ./app.nix
  ];
}