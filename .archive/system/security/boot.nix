{ ... }:

{
  boot.blacklistedKernelModules = [
    "usb_storage"
    "bluetooth"
    "firewire_core"
  ];
}