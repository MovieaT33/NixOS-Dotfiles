{ ... }:

{
  # services.timesyncd.enable = true;
  services.ntp.enable = true;

  time = {
    hardwareClockInLocalTime = false;
    timeZone = "UTC";
  };

  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "us";  # TODO: Check is work correctly

  services.xserver.layout = "us";
}