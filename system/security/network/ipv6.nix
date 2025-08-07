{ config, ... }:

{
  boot.kernelParams = [ "ipv6.disable=1" ];
}