{ ... }:

{
  services.journald = {
    storage = "volatile";   # store logs in memory
    compress = true;
    forwardToSysLog = true;

    systemMaxUse = 512 * 1024 * 1024;     # 512 MB total
    systemMaxFileSize = 64 * 1024 * 1024; # 64 MB per file
    runtimeMaxUse = 256 * 1024 * 1024;    # 256 MB in RAM for volatile logs

    audit = true;

    upload.enable = false;                # disable remote log upload

    extraConfig = ''
      MaxRetentionSec=1month
      MaxFileSec=1week
    '';
  };
}