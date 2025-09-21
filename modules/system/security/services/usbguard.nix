{ ... }:

{
  # FIXME: Failed to start
  services.usbguard = {
    enable = false;
    rules = ''
      deny with-interface all
    '';
  };
}