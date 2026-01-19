{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    plymouth
    # plymouth-matrix-theme
    adi1090x-plymouth-themes
  ];

  boot.initrd.kernelModules = [ "virtio_gpu" ];
  boot.plymouth = {
    enable = true;
    # themePackages = [ pkgs.plymouth-matrix-theme ];
    # theme = "matrix";
    theme = "circle";
  };
}