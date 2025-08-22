# FIXME: use recursive search for importing
{
  imports = [
    ./modules/boot.nix
    ./modules/fonts.nix
    ./modules/hardware.nix
    ./modules/locale.nix
    ./modules/network.nix
    ./modules/nix.nix
    ./modules/system.nix
    ./modules/tty.nix
    ./modules/users.nix
    ./modules/zram.nix
    ./modules/zswap.nix

    ./security/network/firewall.nix
    ./security/network/ipv6.nix
    ./security/apparmor.nix
    ./security/audit.nix
    ./security/general.nix
    ./security/hardening.nix
    ./security/journald.nix
    ./security/kernel.nix
    ./security/lynis.nix
    ./security/nix.nix
    ./security/root.nix
    ./security/sudo.nix
    ./security/sysstat.nix

    ./app.nix
  ];
}