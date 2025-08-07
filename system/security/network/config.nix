{ config, ... }:

{
  imports = [
    ./firewall.nix
    ./ipv6.nix
  ];
}