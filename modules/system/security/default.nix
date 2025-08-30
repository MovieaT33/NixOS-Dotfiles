{ ... }:

let
  authDir     = "./auth";
  networkDir  = "./network";
  servicesDir = "./services";
in
{
  imports = [
    # Authentication
    "${authDir}/doas.nix"
    "${authDir}/pam.nix"
    "${authDir}/root.nix"

    # Network
    "${networkDir}/dns.nix"
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
    ./nix.nix
    ./systemd.nix
  ];
}