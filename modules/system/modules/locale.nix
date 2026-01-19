{ config, ... }:

{
  # region [ Time ]
  # services.timesyncd.enable = true;     # systemd-timesyncd
  services.ntp.enable = true;             # NTP

  time = {
    timeZone = "Europe/Zurich";
    hardwareClockInLocalTime = true;
  };
  # endregion

  # region [ Internationalization ]
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_CTYPE =          config.i18n.defaultLocale;
      LC_NUMERIC =        config.i18n.defaultLocale;
      LC_TIME =           config.i18n.defaultLocale;
      LC_COLLATE =        config.i18n.defaultLocale;
      LC_MONETARY =       config.i18n.defaultLocale;
      LC_MESSAGES =       config.i18n.defaultLocale;
      LC_PAPER =          config.i18n.defaultLocale;
      LC_NAME =           config.i18n.defaultLocale;
      LC_ADDRESS =        config.i18n.defaultLocale;
      LC_TELEPHONE =      config.i18n.defaultLocale;
      LC_MEASUREMENT =    config.i18n.defaultLocale;
      LC_IDENTIFICATION = config.i18n.defaultLocale;
    };
  };
  # endregion
}