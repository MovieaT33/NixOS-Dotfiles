{ config, ... }:

{
  boot = {
    kernelParams = [
      "video=1920x1200"
      # "console=tty0"
      "quiet"
      "udev.log_level=0"
    ];
    consoleLogLevel = 0;
  };
}