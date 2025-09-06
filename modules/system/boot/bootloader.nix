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
      device = "/dev/vda1";
      efiSupport = true;
    };
    timeout = 3;
  };
}