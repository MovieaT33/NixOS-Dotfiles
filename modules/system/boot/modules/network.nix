{ ... }:

{
  networking = {
    hostName = "nixos";

    # Systemd-networkd
    useNetworkd = true;

    # Networks
    wireless = {
      enable = true;
      # networks = { };
    };

    # DHCP
    useDHCP = true;
    # interfaces = { };
  };
}