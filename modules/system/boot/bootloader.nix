{ ... }:

{
  boot.loader = {
    efi.canTouchEfiVariables = true;

    systemd-boot = {
      enable = true;
      editor = false;
      consoleMode = "0";
    };
    timeout = 3;
  };
}