{ ... }:

{
  boot.kernelParams = [
    # "console=tty0"    # console output
    "video=1920x1200,921600"   # set resolution
    # "quiet"           # reduce messages
  ];
}