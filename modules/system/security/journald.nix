{ ... }:

{
  services.journald = {
    storage = "volatile";     # store logs in memory
    audit = true;
    upload.enable = false;    # disable remote log upload

    extraConfig = ''
      Compress=yes
      ForwardToSyslog=yes

      SystemMaxUse=512M
      SystemMaxFileSize=64M
      RuntimeMaxUse=256M

      MaxRetentionSec=1month
      MaxFileSec=1week
    '';
  };
}