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
      iptables -P INPUT   DROP
      iptables -P FORWARD DROP
      iptables -P OUTPUT  ACCEPT

      iptables -A INPUT  -i lo -j ACCEPT
      iptables -A OUTPUT -o lo -j ACCEPT

      iptables -A INPUT  -m state --state ESTABLISHED,RELATED     -j ACCEPT
      iptables -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

      iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
      iptables -A INPUT  -p udp --sport 53 -j ACCEPT

      iptables -A INPUT  -m state --state NEW -p tcp --dport 443 -j ACCEPT
      iptables -A OUTPUT -m state --state NEW -p tcp --dport 443 -j ACCEPT

      iptables -A INPUT   -j LOG --log-prefix "FW DROP INPUT: "   --log-level 4
      iptables -A FORWARD -j LOG --log-prefix "FW DROP FORWARD: " --log-level 4
    '';
  };
}