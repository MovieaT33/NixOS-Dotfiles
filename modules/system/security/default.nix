{ ... }:

let
  authDir     = builtins.toPath ./auth;
  networkDir  = builtins.toPath ./network;
  servicesDir = builtins.toPath ./services;
in
{
  imports = [
    # Authentication
    "${authDir}/pam.nix"
    "${authDir}/root.nix"

    # Network
    "${networkDir}/dns.nix"
    "${networkDir}/fail2bun.nix"
    "${networkDir}/firewall.nix"
    "${networkDir}/ipv6.nix"

    # Services
    "${servicesDir}/antivirus.nix"
    "${servicesDir}/apparmor.nix"
    "${servicesDir}/audit.nix"
    "${servicesDir}/dbus.nix"
    "${servicesDir}/journald.nix"
    "${servicesDir}/logrotate.nix"
    "${servicesDir}/rtkit.nix"
    "${servicesDir}/sysstat.nix"
    # "${servicesDir}/usbguard.nix"

    # Main
    ./boot.nix
    ./cis.nix
    ./kernel.nix
    ./memory-allocator.nix
    ./nix.nix
    ./systemd-services.nix
    ./systemd.nix
  ];
}