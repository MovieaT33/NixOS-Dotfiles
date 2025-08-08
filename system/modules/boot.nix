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

  boot.kernelParams = [
    "console=tty1"
    "video=1920x1200"
  ];
}