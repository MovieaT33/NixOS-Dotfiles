{ ... }:

{
  services.xserver = {
    enable = true;
    monitorSection = ''
      Section "Monitor"
        Identifier "HDMI-1"
        Option "PreferredMode" "1920x1200"
      EndSection
    '';
  };
}