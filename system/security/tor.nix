{ config, ... }:

{
  services = {
    tor = {
      enable = true;
      client.dns.enable = true;
      settings.DNSPort = [ {
        addr = "127.0.0.1";
        port = 53;
      } ];
    };
    resolved = {
      enable = true;
      dns = [ "127.0.0.1" ];
      fallbackDns = [ ];
      extraConfig = ''
        DNSStubListener=no
      '';
    };
  };
  
  networking.nameservers = [ "127.0.0.1" ];

  # services.tor = {
  #   enable = true;
  #   settings = {
  #     SOCKSPort = "9050";
  #     SocksPolicy = [ "accept 127.0.0.1" ];
  #   };
  # };
}