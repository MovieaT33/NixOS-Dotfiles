{ config, ... }:

{
  networking.firewall.enable = true;

  services.ufw.enable = true;
  services.ufw.defaultInputPolicy = "deny";
  services.ufw.defaultOutputPolicy = "deny";

  services.tor.enable = true;

  boot.kernelParams = [ "ipv6.disable=1" ];
}