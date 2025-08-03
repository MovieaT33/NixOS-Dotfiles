{ config, ... }:

{
  boot.blacklistedKernelModules = [
    "usb_storage"
    "firewire_core"
    "bluetooth"
  ];
}