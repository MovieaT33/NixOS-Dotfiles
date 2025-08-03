{ config, ... }:

{
  security.apparmor.enable = true;
  boot.kernelParams = [ "apparmor=1" "security=apparmor" ];
}