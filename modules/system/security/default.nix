{ ... }:

{
  imports = [
    # Authentication
    ./auth/doas.nix
    ./auth/root.nix

    # Network
    ./network/dns.nix
    ./network/firewall.nix
    ./network/ipv6.nix

    # Services
    ./services/antivirus.nix
    ./services/apparmor.nix
    ./services/audit.nix
    ./services/dbus.nix
    ./services/journald.nix
    ./services/logrotate.nix
    ./services/rtkit.nix
    ./services/sysstat.nix
    # ./services/usbguard.nix

    # Main
    ./boot.nix
    ./cis.nix
    ./kernel.nix
    ./nix.nix
    ./systemd.nix
  ];
}