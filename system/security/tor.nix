{ config, ... }:

{
  services = {
    tor = {
      enable = true;

      client = {
        enable = true;

        socksListenAddress = {
          addr = "127.0.0.1";
          port = 9050;
          IsolateDestAddr = true;
        };

        dns.enable = true;
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

  boot.kernelParams = [ "ipv6.disable=1" ];
}