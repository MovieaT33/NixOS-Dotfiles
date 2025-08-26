{ ... }:

{
  # region [ Time ]
  # services.timesyncd.enable = true;     # systemd-timesyncd
  services.ntp.enable = true;             # NTP

  time = {
    hardwareClockInLocalTime = false;
    timeZone = "UTC";
  };
  # endregion

  # region [ Language and Keyboard ]
  console.keyMap = "us";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    # extraLocaleSettings = {
    #   LC_CTYPE =          "en_US.UTF-8";
    #   LC_NUMERIC =        "en_US.UTF-8";
    #   LC_TIME =           "en_US.UTF-8";
    #   LC_COLLATE =        "en_US.UTF-8";
    #   LC_MONETARY =       "en_US.UTF-8";
    #   LC_MESSAGES =       "en_US.UTF-8";
    #   LC_PAPER =          "en_US.UTF-8";
    #   LC_NAME =           "en_US.UTF-8";
    #   LC_ADDRESS =        "en_US.UTF-8";
    #   LC_TELEPHONE =      "en_US.UTF-8";
    #   LC_MEASUREMENT =    "en_US.UTF-8";
    #   LC_IDENTIFICATION = "en_US.UTF-8";
    # };
  };
  # endregion
}