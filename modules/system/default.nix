# TODO: Use recursive search for importing
{
  imports = [
    ./modules/boot/boot.nix
    ./modules/boot/bootloader.nix
    ./modules/boot/hardware.nix
    ./modules/boot/vm.nix

    ./modules/docs.nix
    ./modules/fonts.nix
    ./modules/locale.nix
    ./modules/network.nix
    ./modules/nix.nix
    ./modules/system.nix
    ./modules/tty.nix
    ./modules/users.nix
    ./modules/zram.nix
    ./modules/zswap.nix

    ./security/network/dns.nix
    ./security/network/firewall.nix
    ./security/network/ipv6.nix

    ./security/antivirus.nix
    ./security/apparmor.nix
    ./security/audit.nix
    ./security/boot.nix
    ./security/cis.nix
    ./security/cpu.nix
    ./security/hardening.nix
    ./security/journald.nix
    ./security/kernel.nix
    ./security/lynis.nix
    ./security/nix.nix
    ./security/root.nix
    ./security/rtkit.nix
    ./security/sudo.nix
    ./security/sysstat.nix
    # ./security/usbguard.nix
    ./security/virtualisation.nix

    ./app.nix
  ];
}