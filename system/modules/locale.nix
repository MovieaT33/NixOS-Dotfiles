{ ... }:

{
  services.timesyncd.enable = true;

  time.hardwareClockInLocalTime = false;
  time.timeZone = "UTC";

  i18n.defaultLocale = "en_US.UTF-8";
}