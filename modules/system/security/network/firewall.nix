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

      # Block all outgoing traffic for users not in group 'net'
      iptables -A OUTPUT -m owner ! --gid-owner net -j REJECT

      # Allow loopback traffic
      iptables -A INPUT  -i lo -j ACCEPT
      iptables -A OUTPUT -o lo -j ACCEPT

      # Accept incoming packets for established or related connections
      iptables -A INPUT  -m state --state ESTABLISHED,RELATED     -j ACCEPT

      # Accept outgoing packets for new, established, or related connections
      iptables -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

      # Allow outgoing DNS queries (UDP port 53)
      iptables -A OUTPUT -p udp --dport 53 -j ACCEPT

      # Allow incoming DNS queries (UDP port 53)
      iptables -A INPUT  -p udp --sport 53 -j ACCEPT

      # Allow incoming new HTTPS connections
      iptables -A INPUT  -m state --state NEW -p tcp --dport 443 -j ACCEPT

      # Allow outgoing new HTTPS connections
      iptables -A OUTPUT -m state --state NEW -p tcp --dport 443 -j ACCEPT

      # Log all dropped INPUT and FORWARD packets
      iptables -A INPUT   -j LOG --log-prefix "FW DROP INPUT: "   --log-level 4
      iptables -A FORWARD -j LOG --log-prefix "FW DROP FORWARD: " --log-level 4
    '';
  };
}