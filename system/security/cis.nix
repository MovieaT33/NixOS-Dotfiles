{ config, ... }:

{
  boot.extraModprobeConfig = ''
    install tipc true
    install sctp true
    install dccp true
    install rds  true
  '';
}