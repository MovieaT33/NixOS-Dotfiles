{ config, ... }:

{
  networking.firewall.enable = true;
  networking.firewall.extraCommands = builtins.readFile ./config/firewall.conf;

  services.tor.enable = true;

  boot.kernelParams = [ "ipv6.disable=1" ];
}