{ config, ... }:

{
  networking.hostName = "nixos";
  networking.wireless.enable = true;
  networking.useNetworkd = true;
}