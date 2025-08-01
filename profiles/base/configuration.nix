{ config, lib, pkgs, ... }:

{
  imports = [
    ../../system/hardware-configuration.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."root".device = "/dev/vda2";

  # Network
  networking.hostName = "nixos";

  # Local
  time.timeZone = "Europe/Zurich";
  i18n.defaultLocale = "en_US.UTF-8";

  # System
  system.stateVersion = "25.05";
}