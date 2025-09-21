{ ... }:

{
  boot.loader = {
    efi.canTouchEfiVariables = true;

    # Use `systemd-boot` as the bootloader
    systemd-boot = {
      enable = true;
      editor = false;
      consoleMode = "2";
    };

    timeout = 1;
  };
}