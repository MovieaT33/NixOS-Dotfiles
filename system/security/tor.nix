{ config, ... }:

{
  services.tor = {
    enable = true;
    settings = {
      SOCKSPort = "9050";
      SocksPolicy = [ "accept 127.0.0.1" ];
    };
  };
}