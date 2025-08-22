{ config, ... }:

{
  environment.etc = {
    "modprobe.d/CIS.conf".text = ''
    install tipc true
    install sctp true
    install dccp true
    install rds  true
    '';
  };
}