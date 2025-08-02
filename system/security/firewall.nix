{ config, pkgs, ... }:

let
  torTransPort = 9040;
  torDnsPort = 5353;
in
{
  services.tor = {
    enable = true;
    settings = {
      VirtualAddrNetworkIPv4 = "10.192.0.0/10";
      AutomapHostsOnResolve = true;
      TransPort = "${torTransPort}";
      DNSPort = "${torDnsPort}";
      SocksPort = "9050";
    };
  };

  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [];

  networking.firewall.extraCommands = ''
    iptables -F
    iptables -t nat -F

    iptables -P INPUT DROP
    iptables -P FORWARD DROP
    iptables -P OUTPUT DROP

    iptables -A INPUT -i lo -j ACCEPT
    iptables -A OUTPUT -o lo -j ACCEPT

    iptables -A OUTPUT -m owner --uid-owner tor -j ACCEPT

    iptables -A INPUT -p tcp --dport 22 -j DROP

    iptables -t nat -A OUTPUT -p udp --dport 53 -j REDIRECT --to-ports ${torDnsPort}
    iptables -t nat -A OUTPUT -p tcp --dport 53 -j REDIRECT --to-ports ${torDnsPort}

    iptables -t nat -A OUTPUT -p tcp --syn ! -o lo -m owner ! --uid-owner tor -j REDIRECT --to-ports ${torTransPort}

    iptables -A OUTPUT ! -o lo ! -m owner --uid-owner tor -j DROP
  '';

  boot.kernelParams = [ "ipv6.disable=1" ];
}