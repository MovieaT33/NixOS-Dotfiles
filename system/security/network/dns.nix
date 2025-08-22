{ config, ... }:

{
  services.resolved.enable = true;
  networking.nameservers = [ "9.9.9.11" ];
}