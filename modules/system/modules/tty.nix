{ ... }:

{
  boot = {
    kernelParams = [
      "video=1920x1200"
      # "console=tty0"
      # TEMPORARY REMOVE: "quiet"
    ];
    consoleLogLevel = 0;
  };
}