{ ... }:

{
  boot.kernelParams = [
    # Console output
    "console=tty0,115200"
    # "console=ttyS0,115200"

    "video=1920x1200@60"    # set resolution
    # "quiet"               # reduce messages
  ];
}