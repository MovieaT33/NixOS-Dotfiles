{ config, ... }:

{
  networking.firewall.enable = true;

  networking.firewall.allowPing = false;
  networking.firewall.checkReversePath = true;

  # networking.firewall.allowedTCPPorts = [ ];
  # networking.firewall.allowedUDPPorts = [ ];

  networking.firewall.extraCommands = ''
    iptables -P INPUT DROP
    iptables -P FORWARD DROP
    iptables -P OUTPUT ACCEPT

    # Allow DNS
    iptables -A INPUT -p udp --dport 53 -j ACCEPT

    # Allow HTTPS
    iptables -A INPUT -m state --state NEW -p tcp --dport 443 -j ACCEPT
  '';
}

# TODO: zsh vim
# TODO: shred
