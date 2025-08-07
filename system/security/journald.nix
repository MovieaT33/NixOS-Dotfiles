{ config, ... }:

{
  services.journald.extraConfig = ''
    Storage=persistent
    Compress=yes
    ForwardToSyslog=yes
  '';
}