{ ... }:

{
  services.journald = {
    storage = "volatile";       # store logs in memory
    upload.enable = false;    # disable remote log upload
    extraConfig = ''
      Storage=persistent
      Compress=yes
      ForwardToSyslog=yes

      SystemMaxUse=500M
      SystemMaxFileSize=50M
    '';
  };
}