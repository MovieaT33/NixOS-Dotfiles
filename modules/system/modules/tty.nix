{ ... }:

{
  boot.kernelParams = [
    # "console=tty0"        # console output
    "console=ttyS0,115200"  # console output
    "video=1920x1200@60"    # set resolution
    # "quiet"               # reduce messages
  ];
}