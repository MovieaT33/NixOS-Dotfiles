{ ... }:

{
  networking = {
    hostId = "00000000";  # run `hostid`
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