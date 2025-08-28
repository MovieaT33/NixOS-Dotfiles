# TODO: Update `networking.firewall.extraCommands`
{ ... }:

{
  networking.firewall = {
    enable = true;

    allowPing = false;
    checkReversePath = true;

    allowedTCPPorts = [ 443 ];  # HTTPS
    allowedUDPPorts = [ 53 ];   # DNS

    extraCommands = ''
      # Policies
      iptables -P INPUT   DROP
      iptables -P FORWARD DROP
      iptables -P OUTPUT  ACCEPT

      # 1. Block non-net
      iptables -A OUTPUT -m owner ! --gid-owner 991 -j REJECT

      # 2. Allow loopback
      iptables -A INPUT  -i lo -j ACCEPT
      iptables -A OUTPUT -o lo -j ACCEPT

      # 3. Allow DNS
      iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
      iptables -A INPUT  -p udp --sport 53 -j ACCEPT

      # 4. Allow HTTPS
      iptables -A INPUT  -m state --state NEW -p tcp --dport 443 -j ACCEPT
      iptables -A OUTPUT -m state --state NEW -p tcp --dport 443 -j ACCEPT

      # 5. Log all dropped INPUT and FORWARD packets
      iptables -A INPUT   -j LOG --log-prefix "FW DROP INPUT: "   --log-level 4
      iptables -A FORWARD -j LOG --log-prefix "FW DROP FORWARD: " --log-level 4
    '';
  };
}