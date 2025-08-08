{ config, ... }:

{
  networking.firewall.enable = true;

  networking.firewall.allowPing = false;
  networking.firewall.checkReversePath = true;

  networking.firewall.allowedTCPPorts = [ 443 ];
  networking.firewall.allowedUDPPorts = [ 53 ];

  # networking.firewall.interfaces.enp1s0.allowedTCPPorts = [ ];
  # networking.firewall.interfaces.enp1s0.allowedUDPPorts = [ ];

  networking.firewall.extraCommands = ''
    iptables -A OUTPUT -p tcp --dport 80 -j REJECT
  '';
}