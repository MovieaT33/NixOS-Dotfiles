{ ... }:

{
  # TODO: Add more antivirus scanners

  # region [ ClamAV ]
  # FIXME: Service `clamav-freshclam` failed to start
  services.clamav = {
    scanner = {
      enable = true;
      interval = "12h";
      # TODO: `scanDirectories`
    };

    fangfrisch = {
      enable = true;
      interval = "hourly";
    };

    updater = {
      enable = true;
      interval = "hourly";
      frequency = 12;
    };

    daemon.enable = true;
  };
  # endregion
}