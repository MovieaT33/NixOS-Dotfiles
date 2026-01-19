{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    plymouth
    plymouth-themes
  ];

  boot.initrd.kernelModules = [ "virtio_gpu" ];
  boot.plymouth = {
    enable = true;
    theme = "spinner";
  };
}