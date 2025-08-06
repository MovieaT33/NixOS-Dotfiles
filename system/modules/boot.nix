{ config, ... }:

{
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  boot.initrd.luks.devices."cryptroot" = {
    device = "/dev/vda2";
    preLVM = true;
  };

  swapDevices = [
    { device = "/dev/vg/swap"; }
  ];
}