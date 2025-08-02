{ config, pkgs, ... }:

{
  imports = [
    ./drivers.nix
    ./firewall.nix
    # TODO: uncomment this: `./pam.nix`
    ./passwords.nix
  ];
}