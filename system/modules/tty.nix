{ ... }:

{
  boot = {
    kernelParams = [
      "video=1920x1200"
      # "console=tty0"
      "quiet"
    ];
    consoleLogLevel = 0;
  };
}