{ config, pkgs, ... }:

{
  # TODO: use Tor

  networking.firewall.enable = true;
  # networking.firewall.extraCommands = ''
  # '';

  boot.kernelParams = [ "ipv6.disable=1" ];
}