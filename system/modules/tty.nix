{ config, ... }:

{
  boot = {
    kernelParams = [
      "video=1920x1200"
      "console=tty2"
      "quiet"
      "log_level=0"
      "udev.log_level=0"
    ];
    consoleLogLevel = 0;
  };
}