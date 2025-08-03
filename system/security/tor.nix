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
        HashedControlPassword = "16:01152C3A6F8C7394607D3BFCDE273407FF7D6FC84438034C72EF2FCE96";
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