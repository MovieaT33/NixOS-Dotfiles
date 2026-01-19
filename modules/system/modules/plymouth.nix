{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    plymouth
    plymouth-matrix-theme
  ];

  boot.initrd.kernelModules = [ "virtio_gpu" ];
  boot.plymouth = {
    enable = true;
    theme = "matrix";
  };
}