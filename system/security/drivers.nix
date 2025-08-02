{ config, lib, pkgs, ... }:

{
  boot.blacklistedKernelModules = [ "usb_storage" "firewire_core" "bluetooth" ];
}