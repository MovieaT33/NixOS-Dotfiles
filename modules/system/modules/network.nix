{ ... }:

{
  networking = {
    hostName = "nixos";
    wireless = {
      enable = true;
      # networks = { };
    };
    useNetworkd = true;

    useDHCP = true;
    # interfaces = { };
  };
}