{ config, ... }:

{
  boot.kernelParams = [
    "console=tty1"
    "video=1920x1200"
  ];
}