{ config, ... }:

{
  services = {
    tor = {
      enable = true;
      client = {
        enable = true;
        dns.enable = true;
        socksListenAddress = "127.0.0.1";
        socksListenPort = 9050;
      };
    };

    resolved = {
      enable = true;
      fallbackDns = [ ];
      extraConfig = ''
        DNSStubListener=no
        DNS=127.0.0.1
      '';
    };
  };

  networking.nameservers = [ "127.0.0.1" ];
}