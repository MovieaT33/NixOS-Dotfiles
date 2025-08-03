{ config, ... }:

{
  boot.blacklistedKernelModules = [
    "usb_storage"
    "bluetooth"
    "firewire_core"
    "cramfs"
    "freevxfs"
    "jffs2"
    "hfs"
    "hfsplus"
    "udf"
  ];
}