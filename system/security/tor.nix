{ config, ... }:

{
  services = {
    tor = {
      enable = true;
      client.dns.enable = true;
      settings = {
        DNSPort = [
          { addr = "127.0.0.1"; port = 53; }
        ];
        SOCKSPort = [
          { port = 9050; }
        ];
        SocksPolicy = [ "accept 127.0.0.1" ];
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