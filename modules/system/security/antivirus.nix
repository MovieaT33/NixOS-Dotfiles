{ ... }:

{
  # TODO: Enable and configure antivirus software
  services.clamav = {
    enable = true;
    daemon.enable = true;
    updater = {
      enable = true;
      interval = "12h";
    };
  };
}