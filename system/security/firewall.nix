{ config, ... }:

{
  networking.firewall.enable = true;
  networking.firewall.logRefusedConnections = true;

  networking.firewall.extraCommands = ''
    iptables -P INPUT DROP
    iptables -P OUTPUT DROP
    iptables -P FORWARD DROP

    iptables -A INPUT -m owner --uid-owner tor -j ACCEPT
    iptables -A OUTPUT -m owner --uid-owner tor -j ACCEPT
  '';

  networking.firewall.extraStopCommands = ''
    iptables -P INPUT ACCEPT
    iptables -P OUTPUT ACCEPT
    iptables -P FORWARD ACCEPT
  '';

  services.tor.enable = true;

  boot.kernelParams = [ "ipv6.disable=1" ];
}