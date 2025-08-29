{ ... }:

{
  imports = [
    ./network/dns.nix
    ./network/firewall.nix
    ./network/ipv6.nix

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
    ./root.nix
    ./rtkit.nix
    ./sysstat.nix
    ./systemd.nix
    # ./security/usbguard.nix
  ];
}