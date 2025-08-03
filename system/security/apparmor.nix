{ config, ... }:

{
  security.lsm = [ "apparmor" ];
  security.apparmor.enable = true;

  boot.kernelParams = [ "apparmor=1" ];
}