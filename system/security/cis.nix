{ config, ... }:

{
  # FIXME: check if these modules are actually available on the system
  boot.extraModprobeConfig = ''
    install tipc true
    install sctp true
    install dccp true
    install rds  true
  '';
}