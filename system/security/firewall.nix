{ config, lib, pkgs, ... }:

{
  services.tor.enable = true;

  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 ];
}