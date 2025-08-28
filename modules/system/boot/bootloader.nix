{ ... }:

{
  boot.loader = {
    efi.canTouchEfiVariables = true;

    systemd-boot = {
      enable = true;
      editor = false;
    };
    secureBoot = true;
    timeout = 2;
  };
}