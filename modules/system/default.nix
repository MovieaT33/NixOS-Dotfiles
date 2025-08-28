# TODO: Use recursive search for importing modules
{
  imports = [
    # region [ Boot ]
    ./boot/boot.nix
    ./boot/bootloader.nix
    ./boot/hardware.nix
    ./boot/vm.nix
    # endregion

    # region [ Modules ]
    ./modules/console.nix
    ./modules/docs.nix
    ./modules/fonts.nix
    ./modules/groups.nix
    ./modules/locale.nix
    ./modules/network.nix
    ./modules/nix.nix
    ./modules/system.nix
    ./modules/tty.nix
    ./modules/users.nix
    ./modules/zram.nix
    ./modules/zswap.nix
    # endregion

    # region [ Security ]
    ./security/network/dns.nix
    ./security/network/firewall.nix
    ./security/network/ipv6.nix

    ./security/antivirus.nix
    ./security/apparmor.nix
    ./security/audit.nix
    ./security/boot.nix
    ./security/cis.nix
    ./security/dbus.nix
    ./security/doas.nix
    ./security/journald.nix
    ./security/kernel.nix
    ./security/logrotate.nix
    ./security/nix.nix
    ./security/root.nix
    ./security/rtkit.nix
    ./security/sysstat.nix
    ./security/systemd.nix
    # ./security/usbguard.nix
    # endregion

    ./app.nix
  ];
}