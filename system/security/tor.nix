{ config, ... }:

{
  services = {
    tor = {
      enable = true;

      client = {
        enable = true;
        socksListenAddress = {
          IsolateDestAddr = true;
          addr = "127.0.0.1";
          port = 9050;
        };
      };

      settings = {
        DNSPort = [
          { addr = "127.0.0.1"; port = 53; }
        ];
        SocksPolicy = [ "accept 127.0.0.1" ];

        ControlPort = 9051;
        HashedControlPassword = "16:EFCC337C31681E95608C44E7CC425DC45804AE8BABA98BFD3C8FB758D6";
      };

      controlPortPassword = "torpassword";
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