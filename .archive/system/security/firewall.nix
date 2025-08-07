{ config, ... }:

{
  # networking.firewall.enable = true;

  # networking.firewall.allowedTCPPorts = [ 9050 ];

  # TODO: use builtins.readFile
  # networking.firewall.extraCommands = ''
  #   iptables -P INPUT DROP
  #   iptables -P OUTPUT DROP
  #   iptables -P FORWARD DROP

  #   iptables -A INPUT -i lo -j ACCEPT
  #   iptables -A OUTPUT -o lo -j ACCEPT

  #   iptables -A OUTPUT -m owner --uid-owner tor -j ACCEPT
  # '';

  # networking.firewall.extraStopCommands = ''
  #   iptables -P INPUT ACCEPT
  #   iptables -P OUTPUT ACCEPT
  #   iptables -P FORWARD ACCEPT
  # '';
}