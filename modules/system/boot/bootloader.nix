{ ... }:

{
  boot.loader = {
    efi.canTouchEfiVariables = true;

    # systemd-boot = {
    #   enable = true;
    #   editor = false;
    #   consoleMode = "2";
    # };
    grub = {
      enable = true;
      version = 2;
      device = "/dev/vda";
      efiSupport = true;
    };
    timeout = 3;
  };
}