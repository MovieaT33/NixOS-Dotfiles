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

    # Main
    ./antivirus.nix
    ./apparmor.nix
    ./audit.nix
    ./boot.nix
    ./cis.nix
    ./dbus.nix
    ./journald.nix
    ./kernel.nix
    ./logrotate.nix
    ./nix.nix
    ./rtkit.nix
    ./sysstat.nix
    ./systemd.nix
    # ./security/usbguard.nix
  ];
}