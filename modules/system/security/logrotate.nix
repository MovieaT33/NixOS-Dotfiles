{ ... }:

{
  services.logrotate = {
    enable = true;
    settings = {
      "system" = {
        enable = true;
        files = [ "/var/log/*.log" ];
        frequency = "weekly";
        rotate = 7;
        compress = true;
        missingok = true;
        notifempty = true;
      };
    };
  };
}