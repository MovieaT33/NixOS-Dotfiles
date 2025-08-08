{ config, ... }:

{
  networking.firewall.enable = true;

  networking.firewall.allowedTCPPorts = [ 443 ];
  networking.firewall.allowedUDPPorts = [ 53 ];

  # networking.firewall.interfaces.lo.allowedTCPPorts = [ ];
  # networking.firewall.interfaces.lo.allowedUDPPorts = [ ];

  # networking.firewall.interfaces.enp1s0.allowedTCPPorts = [ ];
  # networking.firewall.interfaces.enp1s0.allowedUDPPorts = [ ];

  networking.firewall.allowPing = false;
  networking.firewall.checkReversePath = true;
}