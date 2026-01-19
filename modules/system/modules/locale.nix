{ ... }:

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
      LC_CTYPE =          config.i18m.defaultLocale;
      LC_NUMERIC =        config.i18m.defaultLocale;
      LC_TIME =           config.i18m.defaultLocale;
      LC_COLLATE =        config.i18m.defaultLocale;
      LC_MONETARY =       config.i18m.defaultLocale;
      LC_MESSAGES =       config.i18m.defaultLocale;
      LC_PAPER =          config.i18m.defaultLocale;
      LC_NAME =           config.i18m.defaultLocale;
      LC_ADDRESS =        config.i18m.defaultLocale;
      LC_TELEPHONE =      config.i18m.defaultLocale;
      LC_MEASUREMENT =    config.i18m.defaultLocale;
      LC_IDENTIFICATION = config.i18m.defaultLocale;
    };
  };
  # endregion
}