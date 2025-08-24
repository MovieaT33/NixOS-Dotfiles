{ ... }:

{
  boot = {
    kernelParams = [
      "video=1920x1200"
      # "console=tty0"
      "quiet"
    ];
    # TEMPORARY REMOVE: consoleLogLevel = 0;
  };
}