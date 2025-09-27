{ ... }:

{
  # TODO: Remove this once
  services.xserver = {
    enable = false;
    monitorSection = ''
      Section "Monitor"
        Identifier "HDMI-1"
        Option "PreferredMode" "1920x1200"
      EndSection
    '';
    xkb.layout = "us";   # TODO: Check is work correctly
  };
}