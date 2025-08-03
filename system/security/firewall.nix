{ config, ... }:

{
  networking.firewall.enable = true;
  # networking.firewall.extraCommands = ''
  # '';

  services.tor.enable = true;

  boot.kernelParams = [ "ipv6.disable=1" ];
}