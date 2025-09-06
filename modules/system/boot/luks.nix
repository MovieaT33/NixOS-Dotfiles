{ ... }:

{
  boot.initrd.luks.devices = {
    "crypt_root" = {
      device = "/dev/vda2";
      preLVM = true;
    };
    "crypt_data" = {
      device = "/dev/vda3";
    };
  };
}