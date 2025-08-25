{ ... }:

{
  # TODO: Add antivirus software

  # region [ ClamAV ]
  services.clamav = {
    scanner = {
      enable = true;
      interval = "12h";
    };

    fangfrisch = {
      enable = true;
      interval = "1h";
    };

    updater = {
      enable = true;
      interval = "12h";
    };

    daemon.enable = true;
  };
  # endregion
}