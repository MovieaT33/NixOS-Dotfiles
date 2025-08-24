{ ... }:

{
  services.usbguard = {
    enable = true;
    rules = ''
      deny with-interface all
    '';
  };
}