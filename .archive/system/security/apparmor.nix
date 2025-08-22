{ config, ... }:

{
  security.lsm = [ "apparmor" ];
  security.apparmor.enable = true;
}