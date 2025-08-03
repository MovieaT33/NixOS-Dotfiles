{ config, ... }:

{
  networking.firewall.enable = true;

  networking.firewall.allowedTCPPorts = [ 9050 ];

  # TODO: use builtins.readFile
  networking.firewall.extraCommands = ''
    iptables -P INPUT DROP
    iptables -P OUTPUT DROP
    iptables -P FORWARD DROP

    iptables -A INPUT -i lo -j ACCEPT
    iptables -A OUTPUT -o lo -j ACCEPT

    iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

    iptables -A OUTPUT -m owner --uid-owner tor -j ACCEPT
  '';

  networking.firewall.extraStopCommands = ''
    iptables -P INPUT ACCEPT
    iptables -P OUTPUT ACCEPT
    iptables -P FORWARD ACCEPT
  '';

  services.tor = {
    enable = true;
    settings = {
      SOCKSPort = "9050";
      SocksPolicy = [ "accept 127.0.0.1" ];
    };
  };

  boot.kernelParams = [ "ipv6.disable=1" ];
}