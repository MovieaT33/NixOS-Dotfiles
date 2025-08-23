{ ... }:

{
  networking = {
    hostName = "nixos";
    wireless.enable = true;
    useNetworkd = true;
    # useDHCP = true;
  }
}