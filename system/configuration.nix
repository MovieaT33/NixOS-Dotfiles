{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./security/configuration.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."root".device = "/dev/vda2";

  # Network
  networking.hostName = "nixos";

  # Local
  time.timeZone = "UTC";
  time.hardwareClockInLocalTime = false;

  i18n.defaultLocale = "en_US.UTF-8";

  # System
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.05";
}