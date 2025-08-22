{ config, ... }:

{
  services.resolved.enable = true;
  networking.nameservers = [ "9.9.9.11" ];
  networking.resolved.extraConfig = ''
    FallbackDNS=
  '';
}