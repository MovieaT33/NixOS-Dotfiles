{ ... }:

{
  # Disable IPv6 entirely
  boot.kernelParams = [ "ipv6.disable=1" ];
}