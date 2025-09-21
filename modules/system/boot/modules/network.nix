{ ... }:

{
  networking = {
    hostId = "00000000";  # Run `hostid`
    hostName = "nixos";

    # `systemd-networkd`
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