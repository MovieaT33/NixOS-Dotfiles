{ ... }:

{
  boot.loader = {
    efi.canTouchEfiVariables = true;

    systemd-boot = {
      enable = true;
      editor = false;
      consoleMode = "2";
    };

    timeout = 1;
  };
}