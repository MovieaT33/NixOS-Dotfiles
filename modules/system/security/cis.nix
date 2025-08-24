{ ... }:

{
  # FIXME: Check if these settings are actually work on the system
  boot.extraModprobeConfig = ''
    install tipc true
    install sctp true
    install dccp true
    install rds  true
  '';
}