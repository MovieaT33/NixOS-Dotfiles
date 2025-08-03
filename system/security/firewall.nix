{ config, ... }:

let
  firewallConf = builtins.readFile ./config/firewall.conf;
in
{
  networking.firewall.enable = true;
  networking.firewall.extraCommands = firewallConf;

  services.tor.enable = true;

  boot.kernelParams = [ "ipv6.disable=1" ];
}